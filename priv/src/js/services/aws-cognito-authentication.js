class AwsCognitoAuthenticationService {
  constructor() {
    this.url = process.env.AWS_COGNITO_TOKEN_URL;
  }

  get baseHeaders() {
    const headers = new Headers();
    headers.append("Content-Type", "application/x-www-form-urlencoded");
    return headers;
  }

  get baseParams() {
    const params = new URLSearchParams();
    params.append("client_id", process.env.AWS_COGNITO_APP_CLIENT_ID);
    return params;
  }

  postAuthorizationCode(code) {
    const params = this.baseParams;
    params.append("code", code);
    params.append("grant_type", "authorization_code");
    params.append(
      "redirect_uri",
      window.location.origin + window.location.pathname
    );
    return fetch(this.url, {
      body: params,
      headers: this.baseHeaders,
      method: "POST"
    })
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

  postRefreshToken(token) {
    const params = this.baseParams;
    params.append("grant_type", "refresh_token");
    params.append("refresh_token", token);
    return fetch(this.url, {
      body: params,
      headers: this.baseHeaders,
      method: "POST"
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("postRefreshToken/UNKNOWN_ERROR");
      })
      .then(tokensResponseJson => tokensResponseJson);
  }
}

const instance = new AwsCognitoAuthenticationService();
export default instance;
