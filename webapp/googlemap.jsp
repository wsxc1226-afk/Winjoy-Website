<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./styles/googlemap.css" />
    <script
      src="https://kit.fontawesome.com/7daf78b674.js"
      crossorigin="anonymous"
    ></script>
    
    <title>ENJOYWINTER</title>
  </head>
  <body>
    <header id="navigation_bar">

      <div class="logo_section">
        <div id="logo_wrapper">
          <a href="./main.jsp"><i id="logo_img" class="fa-solid fa-snowflake"></i></a>
        </div>
        <a href="./main.jsp" id="logo">Winjoy</a>
      </div>
    </header>
  
    <section>
      <div id="map"></div>
    </section>
    <script  src="./scripts/map.js"></script>
    <script
      async
      defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBBgYVJFJp8wKBsIqjtKjDJLom46MaPSFI&libraries=places&callback=initMap">
    </script>
  </body>
</html>