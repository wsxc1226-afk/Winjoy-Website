<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./styles/signup.css" />
    <script defer src="./scripts/signup.js"></script>
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

  


    <div class="signup-box">
      <h2>SIGN UP</h2>
      <form action="aftersignup.jsp" method="post" onsubmit="return validateForm()">
        <div class="user-box">
          <input type="text" id="signup-name" name="signup-name" required />
          <label>Name</label>
        </div>
        <div class="user-box">
          <input type="email" id="signup-email" name="signup-email" required />
          <label>Email</label>
        </div>
        <div class="user-box">
          <input type="number" id="signup-phone-number" name="signup-phone-number" required />
          <label>Phone number</label>
        </div>
        <div class="user-box">
          <input type="text" id="signup-id" name="signup-id" required />
          <label>ID</label>
        </div>
        <div class="user-box">
          <input type="password" id="signup-password" name="signup-password" required />
          <label>Password</label>
        </div>
        <div class="user-box">
          <input type="password" id="signup-password2" name="signup-password2" required />
          <label>Confirm Password</label>
        </div>
        <div class="user-box">
		<p id ="result"><p>
        </div>
        <div class="button-form">
          <div>
            <button type="submit" id="signup-submit">SIGNUP</button>
          </div>
          <div id="register">
            Do you have an account ?
            <a id="login-in-signup" href="signin.jsp"> Login</a>
          </div>
        </div>
      </form>
    </div>

  </body>
</html>
