<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="./styles/main.css" />
  <script defer src="./scripts/main.js"></script>
  <script src="https://kit.fontawesome.com/7daf78b674.js" crossorigin="anonymous"></script>
  <%@ page import="java.sql.*" %>

    <!-- Java code handling login action or set up username with localstorage if already login   -->
<%
    String Name = "LOGIN";
	String Signup_or_Logout = "SIGN UP";
    try {
        String id = "";
        id = request.getParameter("login-id");
        String password = "";
        password = request.getParameter("login-password");
		//connect to website database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb?" + "user=root&password=root");
        PreparedStatement pst = conn.prepareStatement("SELECT name FROM users WHERE id=? AND password=?");
        pst.setString(1, id);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        //return user name if the query works well.
        if (rs.next()) {
            Name = rs.getString("name");
            Signup_or_Logout = "LOGOUT";
        	%>
        	<script>
        	localStorage.setItem('myName', '<%= Name %>' );
        	</script>
        	<%
        	Name = "Welcome, " + rs.getString("name") + "!";
 
        }
        //when login action works, but ID and password is wrong.
        else {
            request.setAttribute("Name", Name);
            if(!id.equals("")|| !password.equals("")){
            	%>
            	<script>
            	    alert("ID and password do not match. Please try again.");
            	    window.location.href = "signin.jsp";
            	</script>
            	<%
            	}

            
            }        
    } catch (Exception e) {
        out.println("Something went wrong !! Please try again");
        out.println(e);

    	%>
    	<script>
    	<!-- run function whether user alraedy login before  -->
        window.onload = function() {
            checkLocalStorageValue();
        };
    	</script>
    	<%
    }
%>

  <title>ENJOYWINTER</title>
</head>

<body>
  <!-- Main page - Header -->
  <header id="navigation_bar">
    <div class="nav_bar func">
      <ul>
        <li>
          <a class="nav_btn" href="">SKI <i class="fa-solid fa-angle-down"></i></a>
          <ul class="modal hidden">
            <li><a href="./aboutski.jsp">About SKI </a></li>
            <li><a href="./howtoski.jsp">How to SKI </a></li>
          </ul>
        </li>
        <li>
          <a class="nav_btn" href="">SNOWBOARD <i class="fa-solid fa-angle-down"></i></a>
          <ul class="modal hidden">
            <li><a href="./aboutsnowboard.jsp">About SNOWBOARD </a></li>
            <li><a href="./howtosnowboard.jsp">How to SNOWBOARD </a></li>
          </ul>
        </li>
        <li>
          <a class="nav_btn" href="">STORE <i class="fa-solid fa-angle-down"></i></a>
          <ul class="modal hidden">
            <li>
              <a href="https://one8.co.kr/ski.html?cate_no=3986" target="_blank">SKI</a>
            </li>
            <li>
              <a href="https://one8.co.kr/snow.html?cate_no=33" target="_blank">SNOWBOARD</a>
            </li>
            <li>
              <a href="https://browse.gmarket.co.kr/list?category=200000214" target="_blank">Equipments</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    
    <div class="logo_section">
      <div id="logo_wrapper" >
        <a href="./main.jsp"><i id="logo_img" class="fa-solid fa-snowflake"></i></a>
      </div>
      <a href="./main.jsp" id="logo">Winjoy</a>
    </div>
    <ul class="nav_bar user">
      <li>
        <button class="nav_btn header_button" id="login" ><%= Name %></button>
      </li>
      <li>
        <button class="nav_btn header_button" id="register" ><%= Signup_or_Logout %></button>
      </li>
      <li>
        <a class="nav_btn" id="user-icon" href="">
          <i class="fa-regular fa-snowflake ani"></i>
        </a>
      </li>
    </ul>
  </header>

  <section>
    <!-- Main page - main banner -->
    <div class="main">
      <img src="" alt="" id="main_img" />
      <h1 class="banner_text">Enjoy The Winter</h1>
      <p id="main_text">
        Dive into the exciting world of skiing and snowboarding!<br />
        Here, we celebrate every carve, jump, and powdery descent.<br />
        Gear up for an unforgettable journey down the slopes, where every run brings a new adventure.
      </p>
    </div>


    <!-- Main page - About -->
    <div class="about">
      <div class="about_box ski">
        <h3>SKI</h3>
        <p id="ski_explaination">
          Skiing is the use of skis to glide on snow. Variations of purpose include basic transport, a recreational
          activity, or a competitive winter sport. <br />
          Many types of competitive skiing events are recognized by the International Olympic Committee (IOC), and the
          International Ski Federation (FIS). <br />
          The word ski comes from the Old Norse word skíð which means "cleft wood", "stick of wood" or "ski".<br /><br />

        </p>
        <a id="learnmorebtn" href="./aboutski.jsp">LEARN MORE</a>
      </div>

      <div class="about_box snowboard">
        <h3>SNOWBOARD</h3>
        <p id="snowboard_explaination">
          Snowboarding is a recreational and competitive activity that involves descending a snow-covered surface while
          standing on a snowboard <br />
          that is almost always attached to a rider's feet. It features in the Winter Olympic Games and Winter
          Paralympic Games.<br />
          Snowboarding was developed in the United States, inspired by skateboarding, sledding, surfing, and skiing. It
          became popular around the world,<br />
          and was introduced as a Winter Olympic Sport at Nagano in 1998 and featured in the Winter Paralympics at Sochi
          in 2014.<br /><br />
        </p>
        <a id="learnmorebtn" href="./aboutsnowboard.jsp">LEARN MORE</a>
      </div>
    </div>


    <!-- Main page - Class -->
    <div class="class">
      <div class="howtoenjoy">
        <div class="welcome_ment">
          <h3><span class="banner_text">HOW TO ENJOY</span> the winter?</h3>
          <p id="welcome">
            Welcome to our Beginner's Guide, where your skiing and snowboarding journey begins! <br />
            Embrace the basics, master new skills, and start your exciting path towards becoming <br />
            a proficient rider on the snow. Let's make your first tracks unforgettable!
          </p>
          <div class="howtoenjoy_btns">
            <div class="howtoenjoy_service">
              <p>How to Ski?</p>
              <a class="howtoenjoy_btn" href="./howtoski.jsp" id="hoverButton1">Get Started!</a>
            </div>
            <div class="howtoenjoy_service">
              <p>How to SnowBoard?</p>
              <a class="howtoenjoy_btn" href="./howtosnowboard.jsp" id="hoverButton2">Get Started!</a>
            </div>
          </div>
        </div>
      </div>
    </div>



    <!-- Main page - store -->
    <div class="store">
      <div class="cards">
        <a class="card" href="https://one8.co.kr/ski.html?cate_no=3986" target="_blank">
          <div class="item_card">
            <img src="./assets/images/ski.jpg" alt="" />
            <div class="card_text">
              <h4 class="title">SKI</h4>
              <p class="card_explanation">
                Purchase your own Ski!
              </p>
            </div>
          </div>
        </a>
        <a class="card" href="https://one8.co.kr/snow.html?cate_no=33" target="_blank">
          <div class="item_card">
            <img src="./assets/images/snowboard.jpg" alt="" />
            <div class="card_text">
              <h4 class="title">SNOWBOARD</h4>
              <p class="card_explanation">
                Purchase your own Snowboard!
              </p>
            </div>
          </div>
        </a>
        <a class="card" href="https://browse.gmarket.co.kr/list?category=200000214" target="_blank">
          <div class="item_card">
            <img src="./assets/images/equipment.jpg" alt="" />
            <div class="card_text">
              <h4 class="title">Other Equipments</h4>
              <p class="card_explanation">
                Ready for you Equipments?
              </p>
            </div>
          </div>
        </a>
        <a class="card" href="./googlemap.jsp">
          <div class="item_card">
            <img src="./assets/images/skiplace.jpg" alt="" />
            <div class="card_text">
              <h4 class="title">Slope</h4>
              <p class="card_explanation">
                Let's go!
              </p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </section>

  <!-- Main page - Footer -->
  <footer id="footer">
    <div class="corp_info">
      <h2 class="banner_text">Winjoy</h2>
      <p>Tel: 010-4643-1419</p>
      <p>Email: seoswon2419@gmail.com</p>
      <p>Location: SKKU</p>
      <div id="map"></div>
    </div>
    <div class="footer_nav">
      <div class="footer_items">
        <h6>SKI</h6>
        <ul>
          <li>
            <a class="footer_item" href="./aboutski.jsp">About SKI</a>
          </li>
          <li>
            <a class="footer_item" href="./howtoski.jsp">How to SKI</a>
          </li>
        </ul>
      </div>
      <div class="footer_items">
        <h6>SNOWBOARD</h6>
        <ul>
          <li><a class="footer_item" href="./aboutsnowboard.jsp">About SNOWBOARD</a></li>
          <li><a class="footer_item" href="./howtosnowboard.jsp">How to SNOWBOARD</a></li>
        </ul>
      </div>
      <div class="footer_items">
        <h6>STORE</h6>
        <ul>
          <li>
            <a class="footer_item" href="https://one8.co.kr/ski.html?cate_no=3986" target="_blank">SKI</a>
          </li>
          <li>
            <a class="footer_item" href="https://one8.co.kr/snow.html?cate_no=33" target="_blank">SNOWBOARD</a>
          </li>
          <li>
            <a class="footer_item" href="https://browse.gmarket.co.kr/list?category=200000214"
              target="_blank">Equipments</a>
          </li>
        </ul>
      </div>
    </div>
    <span id="author">Sangwon/Yohan</span>
  </footer>
</body>

</html>