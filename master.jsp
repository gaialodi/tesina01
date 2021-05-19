<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Tiw2021.Tesina00.HelloAppEngine" %>
<%@ page import ="java.util.*" %>
<%@ page import= "com.google.appengine.api.users.*" %>
<%@ page import="Tiw2021.Tesina00.*" %>
<%@ page import="Tiw2021.Tesina00.login" %>




<head>
<title>Prefettura e adolescenza di Gaia, Andrea, Federico e Gabriele</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;300;400&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<link rel="import" href="login.jsp">


<!-- #log modifica la barra di login
.navbar modifica la barra di navigazione (in alto)
.body modifica tutto quello che c'è sotto alla barra di navigazione


-->
<style>

.navbar-brand {
	cursor: pointer;
}

.navbar {
  padding-top: 15px;
  padding-bottom: 15px;
  border: 0;
  border-radius: 0;
  margin-bottom: 0;
  font: montserrat;
  font-size: 12px;
  letter-spacing: 5px;
}

.article {
			-moz-transform: translateY(0.25rem);
			-webkit-transform: translateY(0.25rem);
			-ms-transform: translateY(0.25rem);
			transform: translateY(0.25rem);
			-moz-transition: opacity 0.325s ease-in-out, -moz-transform 0.325s ease-in-out;
			-webkit-transition: opacity 0.325s ease-in-out, -webkit-transform 0.325s ease-in-out;
			-ms-transition: opacity 0.325s ease-in-out, -ms-transform 0.325s ease-in-out;
			transition: opacity 0.325s ease-in-out, transform 0.325s ease-in-out;
			padding: 4.5rem 2.5rem 1.5rem 2.5rem ;
			position: relative;
			width: 40rem;
			max-width: 100%;
			background-color: rgba(27, 31, 34, 0.85);
			border-radius: 4px;
			opacity: 0;
		}

.article{
	display: block;}

.a {
		-moz-transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-webkit-transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-ms-transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		transition: color 0.2s ease-in-out, background-color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		border-bottom: dotted 1px rgba(255, 255, 255, 0.5);
		text-decoration: none;
		color: inherit;
	}

.body{
background-color:MistyRose;
margin-right:2px solid;
padding-right:2px solid;
}

.tbn{
border-right:1px solid !important;
}

</style>

<script type="text/javascript">

		//Diagramma per vedere gli ANNI e quanti eventi ogni anno
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          chartArea:{left:20,right:20,top:0,width:'50%',height:'75%'}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
       
        chart.draw(data, options);
      }
      
     /* //Mappa per visualizzare scuola/e IO LA CANCELLEREI
        google.charts.load('current', {
        'packages':['map'],
        // Note: you will need to get a mapsApiKey for your project.
        // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
        'mapsApiKey': 'AIzaSyCm3QmfA6xK-2Tsfs02mMtAMz7e2QgxODE' 
        }) 
        
        google.charts.setOnLoadCallback(geolocalize);
      
      function geolocalize(){
    	  navigator.geolocation.getCurrentPosition(drawChart)
    	  
    	  drawChart()
    	  
      }
      
      function drawChart(position) {
        var data = google.visualization.arrayToDataTable([
          ['Lat', 'Long', 'Name'],
          [position.coords.latitude, position.coords.longitude, 'My Position'],

        ]);

        var map = new google.visualization.Map(document.getElementById('map_div'));
        map.draw(data, {
          showTooltip: true,
          showInfoWindow: true
        });
      }
      */
      
    </script>

<script>

//funzione di login
	
	localStorage.setItem("Username","Marco")
	localStorage.setItem("Password","1234")

	Admin=(localStorage.getItem("Username"))
	Pw=(localStorage.getItem("Password"))

	var access=false
	

	function login(){
	$(document).ready(function(){
		$("#log").css("visibility","visible")
		//$("#log").show()
	})
	}
	
	function hide(){
	$(document).ready(function(){
		$("#log").css("visibility","hidden")
		//$("#log").hide()
	})
	}
	
	function check(){
		x=document.getElementById("User").value
		   y=document.getElementById("Password").value
		    if(x==Admin||y==Pw)
		    {
			   console.log("Login successful")
		       access=true
		    }
		$(document).ready(function(){
			$("#log").css("visibility","hidden")
			//$("#log").show()
		})
	}
	
	var lat=44.7007475271964;
	var long=10.633781921287271;
	
	function mappa(){
		var map = L.map('map').setView([44.7007, 10.6337], 13);

		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
		}).addTo(map);

		L.marker([lat, long]).addTo(map)
		    .bindPopup('Istituto ScaruffiLeviTricolore.<br>Tutti i tuoi eventi sono qui')
		    .openPopup();
		
	}
	
	function getUser(){
		String u= new String();
		u=getParameter(u);
	}
   

</script>

</head>

<body style="background-color:MistyRose;">
<body>
<%
//login login0 = new login(); 
//String user = login0.getUs(); //quello che metto nel form in login0
//String pw =login0.getPw();
//user = request.getParameter("username");
// pw = request.getParameter("password");

//if(user != null){ //qui dovrei controllare la password ma come si faaaaaaaa


String user=(String)session.getAttribute("username");

String pw=(String)session.getAttribute("pw");
		
	
%>


<div id="main">

<nav class="navbar navbar-inverse navbar-default">
  <div class="container">
    <div class="navbar-header ">
      <li> 
      <a class="navbar-brand" onclick="login()">Login</a>
      </li>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right text-gray">
    <li><a href="#">ME</a></li>
      <li><a href="#">WHO</a></li>
      <li><a href="#">WHAT</a></li>
      <li><a href="#">WHERE</a></li>
    </ul>
  </div>
</nav>

<% 
//accedo a UserService
//UserService usServ = UserServiceFactory.getUserService();

//accedo al nickname dell'utente
//String u = usServ.getCurrentUser().getNickname(); //questo è l'username?

//se username e pw sono giusti voglio andare in un'altra pagina che mi dice che non posso entrare perchè le credenziali sono sbagliate
%>
<h3>Ciao <%=user%></h3>
<h3>Stringa che esce dalla query: <%=pw%></h3>
<h3>Sei nel master.jsp</h3>

	
	<div class="container-fluid text-center">
		<p><h3>Benvenuto nella pagina della Prefettura</h3></p>
		<p>Se sei un utente registrato puoi fare il login cliccando il pulsante in alto a sinistra per inserire o consultare dati sugli eventi nella provincia di Reggio Emilia</p>
	</div>
	
<ul>
<li><a href="#Spiegazione"></a>Spiegazione</li>
<li><a href="#DatiEGrafici"></a>Dati e grafici</li>
<li><a href="#Eventi"></a>Eventi</li>
<li><a href="#Scuole"></a>Scuole</li>
<li><a href="#Mappa"></a>Mappa</li>

</ul>

<article id="Spiegazione">
<div class="container-fluid text-center">
<h2>Spiegazione</h2>
</div>
</article>

<article id="DatiEGrafici">
<div class="container-fluid text-center">
<p><h3>Data</h3></p>
<div class="row">
	<div id="tbn" class="col-sm-3">	 	
		Eventi svolti (Qui vogliamo mettere la somma degli eventi svolti)
		
	</div>
	<div id="tbn" class="col-sm-3">
		Studenti coinvolti 
		
 	</div>
 	<div id="tbn" class="col-sm-3">
 		Ore totale di eventi
 		
 	</div>
 	<div id="tbn" class="col-sm-3">	
 		Tema più trattato 	
		
	</div>
	
</div>
</div>
</article>


<div class="container-fluid text-center">
<p><h3>Charts</h3></p>
<div class="row">
	<div id="tbn" class="col-sm-12 textcenter">	 	
		<div id="chart_div" style="width: 1000px; height: 500px; "></div>
	</div>
</div>


</div>

<article id="Eventi">
<div class="container-fluid text-center">
<p><h3>Eventi</h3></p>
</div>
</article>

<article id="Scuole">
<div class="container-fluid text-center">
<p><h3>Scuole</h3></p>
<div id="map_div" style="width: 800px; height: 600px"></div>
</article>


<article id="Mappa">
<div id="map" style="width: 800px; height: 600px"></div>
<!-- c'è il modo di visualizzare la mappa direttamente senza fare click? come si mette id? -->
<div>Mappa 
<button onclick="mappa()">Visualizza la mappa</button></div>
</div>
</article>


<article id="Mappa">
<div class="container-fluid text-center">
<p><h5>Cerca per parole chiave</h5></p>

</div>
</article>


<!-- VISIBILE SOLO AGLI AMMINISTRATORI -->

<article id="Aggiungi utente">
<div class="container-fluid text-center">

<p><h5>Aggiungi utente</h5></p>


</div>
</article>

<p><h5>Vedi password utenti</h5></p>


</div>
</article>


</div>


</body>
</html>