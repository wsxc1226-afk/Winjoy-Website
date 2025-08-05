<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./styles/signin.css" />
    <script
      src="https://kit.fontawesome.com/7daf78b674.js"
      crossorigin="anonymous"
    ></script>
    <title>ENJOYWINTER</title>
  </head>

  <body>
    <header>
      <div class="navigation_bar">
        <div class="logo_section">
          <div id="logo_wrapper">
            <a href="./main.jsp"
              ><i id="logo_img" class="fa-solid fa-snowflake"></i
            ></a>
          </div>
          <a href="./main.jsp" id="logo">Winjoy</a>
        </div>
      </div>
    </header>
    <div class="login-box">
      <h2>LOGIN</h2>
      <form action="main.jsp", method="post">
        <div class="user-box">
          <input type="text" id="login-id" name="login-id" required />
          <label>ID</label>
        </div>
        <div class="user-box">
          <input type="password" id="login-password" name="login-password" required />
          <label>Password</label>
        </div>
        <div class="button-form">
          <div>
            <button type="submit" id="login-submit">Login</button>
          </div>
          <div id="register-wrapper">
            <span>Don't you have an account ?</span>
            <a id="register" href="signup.jsp"> Register</a>
          </div>
        </div>
      </form>
    </div>

  </body>
</html>
