<!--#include virtual="/libs/config.asp"-->
<!--#include virtual="/libs/commonLibs.asp"-->
<!--#include virtual="/libs/coreLibs.asp"-->
<!--#include virtual="/libs/databaseAPI.asp"-->
<!--#include virtual="/libs/securityAPI.asp"-->
<%

    Response.Expires = -1
    Response.Buffer = False
	
	Set connObj = Server.CreateObject("ADODB.Connection")
    Set dbObj = New databaseAPI
    Set secObj = Server.CreateObject("RTEL.WebSecurity")
    
	'Open the database connection
    Call dbObj.openDatabaseConnection(connObj, secObj.decryptData(DBConnStr))

    If dbObj.ErrorState = 0 Then

%>
<!DOCTYPE html>
<html lang="el-gr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
    
	<link rel="apple-touch-icon" sizes="180x180" href="/img/favi/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/img/favi/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/img/favi/favicon-16x16.png">
	<link rel="manifest" href="/img/favi/site.webmanifest">
	<link rel="mask-icon" href="/img/favi/safari-pinned-tab.svg" color="#5bbad5">
	<link rel="shortcut icon" href="/img/favi/favicon.ico">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="msapplication-config" content="/img/favi/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	
	<title>Αρχειακή Συλλογή Ελληνικής Παιδικής Ζωγραφικής / H Συλλογή</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-dialog.css" rel="stylesheet" />
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
    <script src="js/jquery.min.js"></script>
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
					<li><a class="bc" href="/learntopaint.asp">Εκπαιδευτικό Υλικό</a></li>
					<li class="active">Εκπαιδευτικές Ενότητες</li>
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
				<div class="panel panel-default">
					<div class="panel-heading">Αναζήτηση</div>
					<div class="panel-body">
						<form id="searchForm" method="post">
							
							<div id="grp-artistFullName" class="form-group form-group-sm">
								<label for="artistFullName">Ονοματεπώνυμο Καλλιτέχνη</label>
								<input type="text" value="" class="form-control" name="artistFullName" id="artistFullName" maxlength="255" placeholder="Ονοματεπώνυμο Καλλιτέχνη..." onkeyup="this.value = this.value.toUpperCase();">
							</div>
							
							<div id="grp-artWorkTheme" class="form-group-sm">
								<label for="artWorkTheme">Θέμα</label>
								<select name="artWorkTheme" id="artWorkTheme" class="form-control">
									<option value="">Επιλέξτε...</option>
									<%=buildArtWorkThemeList(connObj, dbObj, "")%>
								</select>
							</div>
							<br />
							
							<div id="grp-paintingMedium" class="form-group-sm">
								<label for="paintingMedium">Μέσον</label>
								<select name="paintingMedium" id="paintingMedium" class="form-control">
									<option value="">Επιλέξτε...</option>
									<%=buildPaintingMediumList(connObj, dbObj, "")%>
								</select>
							</div>
							<br />
							
							<div id="grp-creationYearRange" class="form-group-sm">
								<label for="creationYearRange">Έτος Δημιουργίας (από-εώς)</label>
								<select style="display:inline-block;width:118px;" name="creationYearFrom" id="creationYearFrom" class="form-control">
									<option value="0">...</option>
									<%=buildNumberList(Year(Now()) - 18, Year(Now()), 1, 0)%>
								</select>
								<span style="display:inline-block">&nbsp;-&nbsp;</span>
								<select style="display:inline-block;width:118px;" name="creationYearTo" id="creationYearTo" class="form-control">
									<option value="0">...</option>
									<%=buildNumberList(Year(Now()) - 18, Year(Now()), 1, 0)%>
								</select>
							</div>
							<br />
							<div id="grp-artistAgeRange" class="form-group-sm">
								<label for="artistAgeRange">Ηλικία Καλλιτέχνη (από-εώς)</label>
								<select style="display:inline-block;width:118px;" name="artistAgeFrom" id="artistAgeFrom" class="form-control">
									<option value="0">...</option>
									<%=buildNumberList(4, 18, 1, 0)%>
								</select>
								<span style="display:inline-block">&nbsp;-&nbsp;</span>
								<select style="display:inline-block;width:118px;" name="artistAgeTo" id="artistAgeTo" class="form-control">
									<option value="0">...</option>
									<%=buildNumberList(4, 18, 1, 0)%>
								</select>
							</div>
							<br />
							<div id="grp-geoLocation" class="form-group-sm">
								<label for="geoLocation">Γεωγραφική Περιοχή</label>
								<select name="geoLocation" id="geoLocation" class="form-control">
									<option value="">Επιλέξτε...</option>
									<%=buildGeographicalLocationList(connObj, dbObj, "")%>
								</select>
							</div>
							<br />
							<input type="hidden" name="page" id="page" value="1">
							<button id="search-submit" type="submit" class="btn btn-default-local">Αναζήτηση</button>
							<button id="search-reset" type="reset" class="btn btn-default-local">Καθαρισμός</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-9" id="page-content">
			
				<div class="row" style="margin-bottom:10px">
					<h3 id="article-title" style="display:inline-block;margin:0;" class="pull-left">H Συλλογή</h3>	
				</div>
				<div class="row text-justified" style="margin-bottom:10px; margin-right:10px;">
					<p>Η παιδική τέχνη αποκτά έναν αξιόπιστο μηχανισμό μεταβίβασης σε τοπική και χρονική συνέχεια, ο οποίος οργανώνει την ιστορική μνήμη και προστατεύει από τη λήθη ανεκτίμητο πολιτιστικό και  καλλιτεχνικό υλικό,  διαφυλάσσοντας το για τις επόμενες γενιές, εγχείρημα το οποίο δεν έχει προηγούμενο στη χώρα μας. Τελικός στόχος είναι η επίτευξη ενός ανοικτού διαλόγου ανάμεσα στην αρχειακή πρακτική και την παιδική εικαστική παραγωγή, που φέρνει στο προσκήνιο την σύγχρονη παιδική σκέψη, τους προβληματισμούς και τις προοπτικές της νέας γενιάς της χώρας μας, ενισχύοντας την βαθύτερη κατανόηση του παρόντος και δίνοντας φωνή και χώρο έκφρασης μέσω της τέχνης, στους αρχιτέκτονες του μέλλοντος, στα παιδιά μας</p>
				</div>
				
				<div class="row text-justified" style="margin-bottom:10px; margin-right:10px;">
					<div class="panel panel-default">
						<div class="panel-heading">Αποτελέσματα Αναζήτησης</div>
						<div class="panel-body">
							<div id="searchResults" style="display:block;">&nbsp;</div>
							<div id="searchLoader" style="display:none;text-align:center;">
								<i class="fa fa-refresh fa-spin" style="margin-top:100px;font-size:68px;color:#666600;"></i>
								<p style="margin-top:10px;color:#666600">Επεξεργασία. Παρακαλώ περιμένετε...</p>
							</div>
						</div>
						<div class="panel-footer clearfix">
						
						<span id="result-pane" class="pull-left" style="width:50%;">&nbsp;</span>
						<span id="result-paging" class="pull-right text-right" style="width:50%;">&nbsp;</span>	
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--#include virtual="/includes/footer.inc"--> 
	
	<script type="text/javascript" src="js/jquery.collection-search.js"></script>	
	
	
</body>
</html>
<%
    Else
%>
<!DOCTYPE html>
<html lang="el-gr">
<head>
<title><%=CompanyName%> - <%=ApplicationName%></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
<head>
<h3>Πρόβλημα σύνδεσης στη βάση δεδομένων. Παρακαλώ δοκιμάστε ξανά. <a href="/">Επιστροφή</a></h3>
</body>
</html>
<%
    End If

    dbObj.closeDatabaseConnection(connObj)
    Set dbObj = Nothing
    Set secObj = Nothing

%>
<%
    If debugEnabled Then
%>
<!-- Debug information block --
<%=debugCode%>
---- Debug information block -->
<%
    End If 'debugEnabled
%>


