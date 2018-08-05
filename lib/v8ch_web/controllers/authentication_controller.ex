defmodule V8chWeb.AuthenticationController do
  use V8chWeb, :controller

  @app_client_id Application.get_env(
                   :v8ch,
                   V8chWeb.AuthenticationController
                 )[:aws_cognito_app_client_id]
  @callback_url Application.get_env(
                  :v8ch,
                  V8chWeb.AuthenticationController
                )[:aws_cognito_callback_url]
  @hosted_ui_url Application.get_env(
                   :v8ch,
                   V8chWeb.AuthenticationController
                 )[:aws_cognito_hosted_ui_url]
  @sign_out_url Application.get_env(
                  :v8ch,
                  V8chWeb.AuthenticationController
                )[:aws_cognito_sign_out_url]

  def login(conn, _) do
    redirect(
      conn,
      external:
        "#{@hosted_ui_url}/login?response_type=code&client_id=#{@app_client_id}&redirect_uri=#{
          @callback_url
        }"
    )
  end

  def logout(conn, _) do
    redirect(
      conn,
      external: "#{@hosted_ui_url}/logout?client_id=#{@app_client_id}&logout_uri=#{@sign_out_url}"
    )
  end
end
