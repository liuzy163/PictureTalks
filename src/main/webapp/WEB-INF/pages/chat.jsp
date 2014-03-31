<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<link href="resources/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    
    <title>Share Photographing Experience</title>
    
    <link href="lightbox/css/lightbox.css" rel="stylesheet" />
    <link href="resources/css/style.css" rel="stylesheet" />
    
    <script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
    <script src="resources/js/jquery.slides.js"></script>
    <script src="lightbox/js/lightbox.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {        
      $('#newProblemForm').submit(function(event) {
    	  var numbers = $('#numbers').val();
    	  var order = $('#order').val();
    	  var complexity = $('#complexity').val();  
    	  var json = { "numbers" : numbers, "order" : order, "complexity": complexity};
    	  
        $.ajax({
        	url: $("#newProblemForm").attr( "action"),
        	data: JSON.stringify(json),
        	type: "POST",
        	dataType: 'json', 
        	contentType: 'application/json',
    		mimeType: 'application/json',
        	
        	success: function(solution) {       		
        		var respContent = "";        		
		  		respContent += "<span class='success'>";
		  		respContent += "The result list is " + solution.numbers;
		  		respContent += ", and the "+order+ "th largest number is " + solution.order +  "</span>";
        		
        		$("#puzzleResult").html(respContent);   		
        	},
        	error: function(jqXHR, textStatus, errorThrown)
        	{
        		$("#puzzleResult").html("");    		
        		var errorMessage = $.parseJSON(jqXHR.responseText).errorMessage;
            	alert(errorMessage);
            }
        	
        });
         
        event.preventDefault();
      });
       
    });   
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
      function warnNotImplementedYet(){
        alert("Sorry, the search function has yet to be implemented yet!");
      }
    </script>
  
</head>
<body>
<header>
  <h1>Let's Share the View of the World</h1>
  <nav>
    <ul>
      <li><a href="start">Home</a></li>
      <li><a href="http://google.com">Chat</a></li>
    </ul>
  </nav>
</header>

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


  <section id="spacer">  
    <h2 class="hidden">Search more photos</h2>          
    <p>Want to explore more amazing photos?</p>
       <div class="search">
          <form action="#">
             <input type="text" name="sitesearch" value="Enter words to search"/>
             <input type="submit" name="start_search" class="button" value="Search" onclick="warnNotImplementedYet()"/>
          </form>
        </div>            
  </section>

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