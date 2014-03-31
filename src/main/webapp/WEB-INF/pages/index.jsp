<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
    <title>Picture Talks</title>
    
    <link href="resources/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="lightbox/css/lightbox.css" rel="stylesheet" />
    <link href="resources/css/style.css" rel="stylesheet" />
    
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
    <script src="resources/js/jquery.slides.js"></script>
    <script src="lightbox/js/lightbox.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script src="resources/js/customize-tooltip.js"></script>
    <script>
	  var map;
	  function initialize() {
  		var mapOptions = {
    	  zoom: 4,
    	  center: new google.maps.LatLng(45.396401,-75.715054)
  	    };
  	    map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
  	    google.maps.event.addListenerOnce(map, 'idle', function() {
    	  google.maps.event.trigger(map, 'resize');
		});	
		google.maps.event.addListener(map, 'click', function(event) {
    	  addMarker(event.latLng);
  		});
	  }
			
	  function addMarker(location) {
  		var marker = new google.maps.Marker({
          position: location,
          map: map,
          draggable:true,
          tooltip:"<table><tr><td>name</td><td>Zhiyong Liu</td></tr><tr><td>Date</td><td>2010-08-02</td></tr></table>"
  		});
  		var html = "<table>" +
                 "<tr><td>Name:</td> <td><input type='text' id='name'/> </td> </tr>" +
                 "<tr><td>Address:</td> <td><input type='text' id='address'/></td> </tr>" +
                 "<tr><td>Type:</td> <td><select id='type'>" +
                 "<option value='bar' SELECTED>bar</option>" +
                 "<option value='restaurant'>restaurant</option>" +
                 "</select> </td></tr>" +
                 "<tr><td></td><td><input type='button' value='Save & Close' onclick='saveData()'/></td></tr>";
  		var infowindow = new google.maps.InfoWindow({
          content: html
  	  	});
	    google.maps.event.addListener(marker, 'click', function() {
    	  infowindow.open(map,marker);
  	    });
  	    var tooltip = new Tooltip({map: map}, marker);
        tooltip.bindTo("text", marker, "tooltip");
        google.maps.event.addListener(marker, 'mouseover', function() {
            tooltip.addTip();
            tooltip.getPos2(marker.getPosition());
        });
  	
        google.maps.event.addListener(marker, 'mouseout', function() {
            tooltip.removeTip();
        });
        google.maps.event.addListener(marker, 'rightclick', function() {
		  marker.setMap(null);
		});
        
	  }

	  google.maps.event.addDomListener(window, 'load', initialize);
    </script> 
    <script>
        $(function() {
          $('#slides').slidesjs({	
            height: 235,
            navigation: false,
            pagination: false,
            effect: {
              fade: {
                speed: 400
              }
            },
            callback: {
                start: function(number)
                {			
                    $("#photo1,#photo2,#photo3").fadeOut(500);
                },
                complete: function(number)
                {			
                    $("#photo" + number).delay(500).fadeIn(1000);
                }		
            },
            play: {
                active: false,
                auto: true,
                interval: 6000,
                pauseOnHover: true
            }
          });
        });
      </script>
      <script>
        function loadTabs() {
  	 	  var container = document.getElementsByTagName("nav")[0];
          var welcomeTab = document.getElementById("welcome-tab");
          welcomeTab.parentNode.setAttribute("currenttab",welcomeTab.id);

          var allTabs = container.querySelectorAll("ul li");
          for (var i = 1; i < allTabs.length; i++) {
            allTabs[i].className += " inactive";
            var content = document.getElementById(allTabs[i].id.replace("-tab",""));
            content.className+="-inactive";
          }
                    
          for (var i = 0; i < allTabs.length; i++) {
      	    allTabs[i].onclick=showTab;
    	  }
    	}

		function showTab() {
  		  var currentTabId = this.parentNode.getAttribute("currenttab");
  		  if(this.id == currentTab)
  		  {
  		    return;
  		  }
  		  var currentTab=document.getElementById(currentTabId);
  		  var currentContent=document.getElementById(currentTabId.replace("-tab",""));
		  currentTab.className += " inactive";
		  currentContent.className += "-inactive";	  
		  
		  var newTab=this;
		  var newContent=document.getElementById(newTab.id.replace("-tab",""));
		  newTab.className=newTab.className.replace(" inactive", "");
		  newContent.className=newContent.className.replace("-inactive", "");
          newTab.parentNode.setAttribute("currenttab",newTab.id);
       }
       window.onload=loadTabs;
     </script>
</head>
<body>
<header>
  <h1>Let's Share the View of the World</h1>
  <nav>
    <ul>
      <li id="welcome-tab"><a href="#welcome">Home</a></li>
      <li id="chat-tab"><a href="#chat">Chat</a></li>
    </ul>
  </nav>
  <section id="toolbar">
    <div class="search" id="search">
      <form action="#">
         <input type="text" name="sitesearch" value="Key words"/>
         <input type="submit" name="start_search" class="button" value="Search" onclick="alert("Sorry, the search function has yet to be implemented yet!")"/>
      </form>
     </div>    
    <a id="login" class="button" href="javascript:authentication()">Log In</a>
  </section>
</header>

<div id="welcome" class="page">
<section class="container">
  <h2 class="hidden">Let's explore the world together</h2>
    <article id="photo1">
      <h3>Evening Clouds in Ottawa</h3>
      <p>I love this blue and white, so PURE!!! Taken in September 2007 from Barrheaven.</p>
      <a class="button" href="http://ottawa.ca/en">Read more...</a>
    </article>
    
    <article id="photo2">
      <h3>Autumn in Gatineau Park</h3>
      <p>Breath-taking colors, so AMAZING!!! Taken in 2011 in Gatineau Park.</p>
      <a class="button" href="http://www.ncc-ccn.gc.ca/places-to-visit/gatineau-park">Read more...</a>
    </article>
    
    <article id="photo3">
      <h3>Rideau River</h3>
      <p>Did you hear birds and waves, so PEACEFUL!!! Taken in 2010 from Chapman Mills Park</p>
      <a class="button" href="http://www.rvca.ca/careas/chapman/">Read more...</a>
    </article>

    <div id="slides">
      <img src="resources/img/cloud.jpg" alt="Eiffel Tower, Paris, France">
      <img src="resources/img/gatineau.jpg" alt="Great Wall, Beijing, China">
      <img src="resources/img/river.jpg" alt="Perliment Hill, Ottawa, Canada">
    </div>
  </section>
  
  <section id="gallery">
    <h2>
      More From Zhiyong's Gallery
    </h2>    
    <article class="img-item">
      <h3 class="hidden">Sunset</h3>
      <figure>  
        <a href="resources/img/sunset.jpg" rel="lightbox" title="Sunset">
      	  <span class="thumb-screen"></span>
          <img src="resources/img/sunset-small.jpg" alt="Sunset"/>
        </a>
        <figcaption>
          <strong>Photographer: Zhiyong Liu</strong>
          Splendid evening light!
        </figcaption>
      </figure>
    </article>
    
    <article class="img-item">
      <h3 class="hidden">Autumn Leave</h3>
      <figure>  
        <a href="resources/img/redleave.jpg" rel="lightbox" title="Autumn leave">
      	<span class="thumb-screen"></span>
          <img src="resources/img/redleave-small.jpg" alt="Autumn leave"/>
        </a>
        <figcaption>
          <strong>Photographer: Zhiyong Liu</strong>
          I know the autumn is here!
        </figcaption>
      </figure>
    </article>

    <article class="img-item">
      <h3 class="hidden">Cherry Blossom</h3>
      <figure>  
        <a href="resources/img/cherrybuds.jpg" rel="lightbox" title="Cherry Blossom">
      	<span class="thumb-screen"></span>
          <img src="resources/img/cherrybuds-small.jpg" alt="Cherry Blossom"/>
        </a>
        <figcaption>
          <strong>Photographer: Zhiyong Liu</strong>
          Cheery blossom in no day!
        </figcaption>
      </figure>
    </article>

    <article class="img-item">
      <h3 class="hidden">Trees</h3>
      <figure>  
        <a href="resources/img/tree.jpg" rel="lightbox" title="Trees">
      	<span class="thumb-screen"></span>
          <img src="resources/img/tree-small.jpg" alt="Trees"/>
        </a>
        <figcaption>
          <strong>Photographer: Zhiyong Liu</strong>
          Quite, and peaceful!
        </figcaption>
      </figure>
    </article>

    <br class="clear"/>
  </section>
</div>

<div id="chat" class="page">
  <section id="maps">
    <h2 class="hidden">Google Maps</h2>
    <div id="map-canvas">
    </div>
  </section>
  <section id="chatsection">
    <div class="chatterPanel">
      <p><strong>Online Users:</strong></p>
      <select name="buddy" id="chatterlist" size=16>
    	<option>text1</option>
    	<option>text2</option>
    	<option>text3</option>
    	<option>text4</option>
    	<option>text5</option>
 	  </select>
    </div>
    <div class="chat-right">
      <p><strong>Messages Board:</strong></p>
      <div class="message-board">dfdsfdsfsdfasf dfadfasd</div>
      <p><Strong>Enter message:</Strong></p>
      <input type="submit" value="Send" style="float: right; margin-left:5px" />
      <div style="overflow: hidden; padding-right: .5em;">
        <input type="text" style="width: 100%; background: #fff" />
      </div>
    </div>
  </section>
</div>


<footer>
  <h2 class="hidden">A footer demo</h2>
  <section id="copyright">
    <h3 class="hidden">Copyright and social media section</h3>
    <div class="wrapper">
       &copy; Copyright 2014 by <a href="http://liuzy163.github.com">Zhiyong Liu</a>. All Rights Reserved.
     </div>
   </section>

</body>
</html>