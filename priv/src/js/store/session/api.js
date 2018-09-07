export default {
  postAuthorizationCode(code) {
    const headers = new Headers();
    headers.append("Content-Type", "application/x-www-form-urlencoded");
    const params = new URLSearchParams();
    params.append("client_id", process.env.AWS_COGNITO_APP_CLIENT_ID);
    params.append("code", code);
    params.append("grant_type", "authorization_code");
    params.append(
      "redirect_uri",
      window.location.origin + window.location.pathname
    );
    const url = process.env.AWS_COGNITO_TOKEN_URL;
    return fetch(url, { body: params, headers, method: "POST" })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        if (response.status === 400) {
          switch (response.json().error) {
            case "invalid_grant":
              throw new Error("postAuthorizationCode/CODE_NOT_VALID");
            default:
              throw new Error("postAuthorizationCode/BAD_REQUEST");
          }
        }
        throw new Error("postAuthorizationCode/UNKNOWN_ERROR");
      })
      .then(tokensResponseJson => tokensResponseJson);
  }
};
