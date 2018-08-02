defmodule V8ch.Contexts do
    use Timex
    import Ecto.Query, warn: false
  
    @behaviour V8ch.Behaviours.Contexts
  
    def get_user_from_jwt(jwt) do
      auth_id = get_field_from_jwt(jwt, "username")
  
      user = %{username: auth_id}
  
      if user == nil, do: {:error, "USER_NOT_FOUND"}, else: {:ok, user}
    end
  
    def verify_jwt(jwt) do
      aws_key_set = Application.get_env(:v8ch, V8ch.Contexts)[:aws_jwks_json]
      key_id = get_field_from_jwt(jwt, "kid")
  
      with {:ok} <- check_token_iss_claim(jwt),
           {:ok} <- check_token_use(jwt),
           {:ok} <- check_token_expiration(jwt),
           {:ok, keys} <- jwks_from_binary(aws_key_set) do
        # Use key_id to extract the correct signed key from the set
        jwk =
          Enum.find(keys, fn key ->
            match?(^key_id, key.fields["kid"])
          end)
  
        # Verify signature
        if JOSE.JWT.verify_strict(jwk, ["RS256"], jwt),
          do: {:ok, jwt},
          else: {:error, "INVALID_JWT_SIGNATURE"}
      else
        # Forward error tuple
        error ->
          error
      end
    end
  
    defp check_token_expiration(jwt) do
      if get_field_from_jwt(jwt, "exp") > Timex.to_unix(Timex.now()),
        do: {:ok},
        else: {:error, "TOKEN_EXPIRED"}
    end
  
    defp check_token_iss_claim(jwt) do
      valid_iss_claim =
        "https://cognito-idp." <>
        Application.get_env(:v8ch, V8ch.Contexts)[:aws_region] <>
          ".amazonaws.com/" <> Application.get_env(:v8ch, V8ch.Contexts)[:aws_user_pool_id]
  
      if get_field_from_jwt(jwt, "iss") == valid_iss_claim,
        do: {:ok},
        else: {:error, "INVALID_JWT_ISS_CLAIM"}
    end
  
    defp check_token_use(jwt) do
      if get_field_from_jwt(jwt, "token_use") == "access",
        do: {:ok},
        else: {:error, "INVALID_JWT_TOKEN_USE"}
    end
  
    defp get_field_from_jwt(jwt, field) do
      JOSE.JWT.peek_payload(jwt)
      |> Map.get(:fields)
      |> Map.get(field)
    end
  
    defp jwks_from_binary(jwks_binary) do
      with {:ok, map} <- Poison.decode(jwks_binary),
           {:ok, keys} when is_list(keys) <- Map.fetch(map, "keys"),
           jwks_list when is_list(jwks_list) <- Enum.map(keys, &JOSE.JWK.from_map/1),
           jwks when is_list(jwks) <- JOSE.JWK.from(jwks_list) do
        {:ok, jwks}
      else
        _ -> {:error, "INVALID_JWKS"}
      end
    end
  end