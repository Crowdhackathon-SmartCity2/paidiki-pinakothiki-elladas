<!DOCTYPE html>
<html lang="el-gr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
    <title>Αρχειακή Συλλογή Ελληνικής Παιδικής Ζωγραφικής / Συμμετοχή στην Α.Σ.Ε.Π.Ζ. / Δράσεις &amp; Εκδηλώσεις</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/fonts/OpenSans/OpenSans.css" />
	<link href="css/basic.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/jquery.smartmenus.bootstrap.css">
	
	<link rel="stylesheet" href="js/jquery/ui-lightness/jquery-ui-1.10.2.custom.css" />
    <link href="css/primitives.latest.css" media="screen" rel="stylesheet" type="text/css" />

	<link href="css/primitives.latest.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="css/ekko-lightbox.css" media="screen" rel="stylesheet" type="text/css" />
	
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery/jquery-ui-1.10.2.custom.min.js"></script>
	
	<script src="js/bootstrap.min.js"></script>
	
	<!-- SmartMenus jQuery plugin -->
	<script type="text/javascript" src="js/jquery.smartmenus.js"></script>

	<!-- SmartMenus jQuery Bootstrap Addon -->
	<script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>

	<script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
	<script type="text/javascript" src="js/primitives.min.js"></script>
	

	<script type="text/javascript" src='js/printThis.js'></script>
	
	<script type="text/javascript" src='js/ekko-lightbox.js'></script>
	
</head>
    
</head>
<body>
    <div class="navbar-wrapper hidden-print">
    <!--#include virtual="/includes/sitenav.inc"--> 
    </div>
<!--	
	<div class="container-fluid hidden-print" style="margin-top:142px;margin-bottom:0px;">
		<div class="row">

			<div class="col-xs-3 col-sm-3 col-md-9 pull-left hidden-print" id="breadcrumb">
			
				<ol class="breadcrumb" style="background-color:#fff">
					<strong>Βρίσκεστε εδώ:</strong>&nbsp; 
					<li><a class="bc" href="/">Αρχική</a></li>
					<li><a class="bc" href="/actions.asp">Συμμετοχή στην Α.Σ.Ε.Π.Ζ.</a></li>
					<li class="active">Δράσεις &amp; Εκδηλώσεις</li>
				</ol>
			</div>
			<div id="page-toolbar" class="pull-right" style="margin-right:15px;margin-top:0px;">
				
				<button id="print-article" title="Εκτύπωση άρθρου" type="button" class="btn btn-default btn-sm" aria-label="Εκτύπωση άρθρου" style="color:#7f8a13; font-weight: bold;">
					<span class="glyphicon glyphicon-print" aria-hidden="true"></span><span style="margin-left:10px;display:inline;">Εκτύπωση</span> 
				</button>
						
						
			</div>
		</div>
    </div>
//-->	
	<div class="container-fluid" style="margin-top:142px;margin-bottom:10px;">
		<div class="row">
		
			<div class="col-xs-6 col-sm-3 hidden-print" id="sidebar">
				<div class="list-group">
					<a class="list-group-item active">Δράσεις &amp; Εκδηλώσεις</a>
					<a href="howtoapply.asp" class="list-group-item">Οδηγίες Συμμετοχής</a>
					<a href="submit_artwork.asp" class="list-group-item">Υποβολή Έργων</a>
					<a href="artwork_assesment.asp" class="list-group-item">Αξιολόγηση Έργων</a>

				</div>
			</div>

			<div class="col-xs-12 col-sm-9" id="page-content">
			
				
			
				<div class="row" style="margin-bottom:10px">
					<h3 id="article-title" style="display:inline-block;margin:0;" class="pull-left">Δράσεις &amp; Εκδηλώσεις</h3>	
				</div>
				<div class="row" style="margin-bottom:10px; margin-right:10px;">
					
					
				</div>
			</div>
		</div>
	</div>

	<!--#include virtual="/includes/footer.inc"--> 
	

	<script>
		$(document).ready(function () {
		
			// enable tooltips
			$('[data-toggle="tooltip"]').tooltip();
			
			$(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function(event) {
                event.preventDefault();
                $(this).ekkoLightbox();
            });
				
				
			
				
			// print article //not working with ie
			$("#print-article").click(function(){
				
				
				$("#page-content").printThis({
					debug: false,               // show the iframe for debugging
					importCSS: true,            // import page CSS
					importStyle: true,         // import style tags
					printContainer: true,       // grab outer container as well as the contents of the selector
					loadCSS: "/css/basic.css",  // path to additional css file - us an array [] for multiple
					pageTitle: "",              // add title to print page
					removeInline: false,        // remove all inline styles from print elements
					printDelay: 333,            // variable print delay
					header: null,               // prefix to html
					formValues: true            // preserve input/form values
				});
				
				return false;
			});
			
			
			
			
		});
		
		
		
	</script>
	
</body>
</html>