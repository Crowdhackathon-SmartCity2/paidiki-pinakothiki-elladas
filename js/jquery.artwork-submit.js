$( document ).ready(function() {

$(".navbar").find(".active").removeClass("active");
			$(".top-level4").addClass("active");
		
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

	// $('body').addClass('loaded');
	
	$('[data-toggle="popover"]').popover({
		container: 'body',
		delay: { "show": 500, "hide": 100 },
		trigger: 'hover focus', 
		html: true
	});
	
	$("#checkTerms").click(function() {
		if ($(this).is(':checked')) {
			$("#signup-submit").prop("disabled", false);
		} else {
			$("#signup-submit").prop("disabled", true);
		}
	});
	
	$("#refreshCaptcha").click(function() {
		refreshImageCaptcha();
	});
	
	$("#signup-reset").click(function() {
		$("#signup-aubmit").prop("disabled", true);
	});
	
	$( "#subscriptionPackageID" ).change(function () {
		$( "#subscriptionPackageID option:selected" ).each(function() {
			$( "#subscriptionPackageLabel").val($( this ).text());
		});
		
	}).change();
	
	$( "#businessCatID" ).change(function () {
		$( "#businessCatID option:selected" ).each(function() {
			$( "#businessCatLabel").val($( this ).text());
		});
		
	}).change();
	
	
	
	
	$("#signup-submit").click(function(e) {
	
		e.preventDefault();
		
		// disable the submit button and show spinner
		
		$("#signup-submit").hide();
		$("#loading-submit").show();
		
		// start validating the form
		// 1. validate captcha
		
		var googleResponse = $('#g-recaptcha-response').val();

		
		
		// alert("grecaptcha.getResponse().length: " + grecaptcha.getResponse().length)
		if (googleResponse == "") {
			e.preventDefault();
			doAlert("error", "Παρακαλώ βεβαιώστε ότι δεν είστε ρομπότ κανοντας κλικ στο αντιστοιχο κουτί");
			
			// highlight error
			$('#grp-captchaCode').addClass('has-error');
			
						// toggle submit 
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			
			return;
		}else{
			//un highlight error
			if ($('#grp-captchaCode').hasClass('has-error')) {
				$('#grp-captchaCode').removeClass('has-error');
			}
		}
		
		
		// old captcha code
		
		// var validCaptcha = validateCaptcha($( '#captchaCode' ).val());
		

//		if (!validCaptcha) {
			
			// alert error
//			doAlert("error", "Ο κωδικός ασφαλείας που εισάγατε δεν είναι ίδιος με τον κωδικό της εικόνας");
			
			// highlight error
//			$('#grp-captchaCode').addClass('has-error');
			
			// refresh captcha image
//			refreshImageCaptcha();
			
			// set focus on element
			
//			$('#captchaCode').val('');
//			$('#captchaCode').focus();
			
			// toggle submit 
//			$("#signup-submit").show();
//			$("#loading-submit").hide();
			
			
//			return;
//		}else{
			//un highlight error
//			if ($('#grp-captchaCode').hasClass('has-error')) {
//				$('#grp-captchaCode').removeClass('has-error');
//			}
//		}
		
		// 2. Validate VAT number
		
		if ($("#customerVATNo").val() == "") {
		
			doAlert("error", "Δεν έχετε εισάγει των αριθμό φορολογικού μητρώου σας.");
			
			$('#grp-customerVATNo').addClass('has-error');
					
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#customerVATNo').val('');
			$('#customerVATNo').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
		
			return;
		
		}else{
		
			var validVATNumber = checkVATNumber($("#customerVATNo").val());
		
			if (!validVATNumber) {
		
				doAlert("error", "Ο αριθμός φορολογικού μητρώου που εισάγατε δεν είναι έγκυρος");
				
				$('#grp-customerVATNo').addClass('has-error');
				
				refreshImageCaptcha();
				$('#captchaCode').val('');
				
				// set focus on element
				$('#customerVATNo').val('');
				$('#customerVATNo').focus();
				
				$("#signup-submit").show();
				$("#loading-submit").hide();
			
				return;
			}else{
			
				var vatnoChech = vatNoFound($('#customerVATNo').val())
			
				if (!vatnoChech) {
					doAlert("error", "Υπάρχει ήδη λογαραισμός με τον αριθμός φορολογικού μητρώου που εισάγατε.");
				
					$('#grp-customerVATNo').addClass('has-error');
				
					refreshImageCaptcha();
					$('#captchaCode').val('');
				
					// set focus on element
					$('#customerVATNo').val('');
					$('#customerVATNo').focus();
				
					$("#signup-submit").show();
					$("#loading-submit").hide();
			
					return;
				}else{
					if ($('#grp-customerVATNo').hasClass('has-error')) {
						$('#grp-customerVATNo').removeClass('has-error');
					}
				}
			}
		}
		
		// 3. Validate Business Name
		if ($("#businessName").val() == "") {
			
			doAlert("error", "Δεν έχετε εισάγει την επωνυμία της επιχείρισης σας.");
			
			$('#grp-businessName').addClass('has-error');
					
			// set focus on element
			$('#businessName').val('');
			$('#businessName').focus();
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
			if ($('#grp-businessName').hasClass('has-error')) {
				$('#grp-businessName').removeClass('has-error');
			}
		}
		
		// 4. Validate Business Category
		if ($("#businessCatID").val() == "") {
			
			doAlert("error", "Δεν έχετε επιλέξει την κατηγορία της επιχείρισης σας από το μενού των διαθέσιμων επιλογών.");
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#grp-businessCatID').addClass('has-error');
					
			// set focus on element
			$('#businessCatID').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
			if ($('#grp-businessCatID').hasClass('has-error')) {
				$('#grp-businessCatID').removeClass('has-error');
			}
		}
		
		// 5. Validate Business Address
		if ($("#businessAddress").val() == "") {
			
			doAlert("error", "Δεν έχετε εισάγει την ταχυδρομική διεύθυνση της επιχείρισης σας.");
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#grp-businessAddress').addClass('has-error');
					
			// set focus on element
			$('#businessAddress').focus();
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
			if ($('#grp-businessAddress').hasClass('has-error')) {
				$('#grp-businessAddress').removeClass('has-error');
			}
		}
		
		
		// 6. Validate Contact name
		if ($("#contactName").val() == "") {
			
			doAlert("error", "Δεν έχετε εισάγει το όνομα του υπευθυνου επικοινωνίας.");
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#grp-contactName').addClass('has-error');
					
			// set focus on element
			$('#contactName').focus();
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
			if ($('#grp-contactName').hasClass('has-error')) {
				$('#grp-contactName').removeClass('has-error');
			}
		}
		
		
		// 7. contactEmail
		
		if ($("#contactEmail").val() == "") {
		
			doAlert("error", "Δεν έχετε εισάγει το e-mail επικοινωνίας.");
			
			$('#grp-contactEmail').addClass('has-error');
					
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#contactEmail').val('');
			$('#contactEmail').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
		
			return;
		
		}else{
		
		
			if (!isValidEmail($("#contactEmail").val())) {
		
				doAlert("error", "Η διεύθυνση e-mail που εισάγατε δεν είναι έγκυρh");
				
				$('#grp-contactEmail').addClass('has-error');
					
				refreshImageCaptcha();
				$('#captchaCode').val('');
			
				$('#contactEmail').val('');
				$('#contactEmail').focus();
			
				$("#signup-submit").show();
				$("#loading-submit").hide();
			
				return;
			}else{
				if ($('#grp-contactEmail').hasClass('has-error')) {
					$('#grp-contactEmail').removeClass('has-error');
				}
			}
		}
		
		// 8. Validate phone numbers
		if ( ($("#contactTelNo").val() == "") && ($("#contactTelNo").val() == "") ) {
			doAlert("error", "Δεν έχετε εισάγει κάποιο τηλέφωνο επικοινωνίας (σταθερό ή/και κινητό)");
				
			$('#grp-contactTelNo').addClass('has-error');
			$('#grp-contactMobNo').addClass('has-error');
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#contactTelNo').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
		
			
		
			// 8.1 - validate land line number
			if ($("#contactTelNo").val() != "") {
				if (!isValidPhone($("#contactTelNo").val())) {
		
					doAlert("error", "Ο αριθμός του σταθερού τηλεφώνου που εισάγατε δεν είναι έγκυρος");
				
					$('#grp-contactTelNo').addClass('has-error');
				
					refreshImageCaptcha();
					$('#captchaCode').val('');
				
					// set focus on element
					$('#contactTelNo').val('');
					$('#contactTelNo').focus();
				
					$("#signup-submit").show();
					$("#loading-submit").hide();
			
					return;
				}else{
					if ($('#contactTelNo').hasClass('has-error')) {
						$('#contactTelNo').removeClass('has-error');
					}
				}
			}else{
				if ($('#contactTelNo').hasClass('has-error')) {
					$('#contactTelNo').removeClass('has-error');
				}
			}
			
			// 8.2 - validate mobile number
			if ($("#contactMobNo").val() != "") {
				if (!isValidMobile($("#contactMobNo").val())) {
		
					doAlert("error", "Ο αριθμός του κινητού τηλεφώνου που εισάγατε δεν είναι έγκυρος");
				
					$('#grp-contactMobNo').addClass('has-error');
				
					refreshImageCaptcha();
					$('#captchaCode').val('');
				
					// set focus on element
					$('#contactMobNo').val('');
					$('#contactMobNo').focus();
				
					$("#signup-submit").show();
					$("#loading-submit").hide();
			
					return;
				}else{
					if ($('#contactMobNo').hasClass('has-error')) {
						$('#contactMobNo').removeClass('has-error');
					}
				}
			}else{
				if ($('#contactMobNo').hasClass('has-error')) {
					$('#contactMobNo').removeClass('has-error');
				}
			}
		}
		
		
		// 9. validate password
		if ($("#userPass").val() == "") {
		
			doAlert("error", "Δεν έχετε εισάγει κάποιον κωδικό πρόσβασης");
			
			$('#grp-userPass').addClass('has-error');
					
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#userPass').val('');
			$('#userPass').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
		
			return;
		
		}else{
		
			if (!isValidPassword($('#userPass').val())) {
		
				doAlert("error", "<p>Ο κωδικός πρόσβασης που είσαγατε δεν είναι αποδεκτός.</p><p>O κωδικός πρέπει να είναι από 8-12 χαρακτήρες.</p><p>Επιτρεπτοί χαρακτήρες είναι οι: a-z A-Z 0-9 , . - _ / + $ : % @ ! #</p>");
				
				$('#grp-userPass').addClass('has-error');
				
				refreshImageCaptcha();
				$('#captchaCode').val('');
				
				// set focus on element
				$('#userPass').val('');
				$('#userPass').focus();
				
				$("#signup-submit").show();
				$("#loading-submit").hide();
			
				return;
			}else{
				if ($('#grp-userPass').hasClass('has-error')) {
					$('#grp-userPass').removeClass('has-error');
				}
			}
		}
		
		
		
		// 10. Password re-type
		if ($('#userPass').val() != $('#userPassReType').val()) {
		
			
		
			doAlert("error", "<p>Ο κωδικός πρόσβασης που είσαγατε στο πεδίο <strong>Επιβεβαίωση κωδικού</strong> δεν είναι ίδιος με αυτόν που εισάγατε στο πεδίο <strong>Κωδικός Πρόσβασης</strong>.</p>");
				
			$('#grp-userPassReType').addClass('has-error');
				
			refreshImageCaptcha();
			$('#captchaCode').val('');
				
			// set focus on element
			$('#userPassReType').val('');
			$('#userPassReType').focus();
				
			$("#signup-submit").show();
			$("#loading-submit").hide();
		
			return;
		
		}else{
			if ($('#grp-userPassReType').hasClass('has-error')) {
				$('#grp-userPassReType').removeClass('has-error');
			}
		}
		
		// 11. Subscription Package
		if ($("#subscriptionPackageID").val() == "") {
			
			doAlert("error", "Δεν έχετε επιλέξει την κατηγορία της επιχείρισης σας από το μενού των διαθέσιμων επιλογών.");
			
			refreshImageCaptcha();
			$('#captchaCode').val('');
			
			$('#grp-subscriptionPackageID').addClass('has-error');
					
			// set focus on element
			$('#subscriptionPackageID').focus();
			
			$("#signup-submit").show();
			$("#loading-submit").hide();
			
			return;
		}else{
			if ($('#grp-subscriptionPackageID').hasClass('has-error')) {
				$('#grpsubscriptionPackageID').removeClass('has-error');
			}
		}
		
		// form is completed OK
		// send data to the database
		
		var form = $('#signup');
		var postData = form.serialize();
		var formURL = '/ajax/register-client.asp';
							
		// window.open(formURL+'?'+postData, '_blank');					
							
		$.ajax({
			url    : formURL,
			data   : postData,
			type   : 'post',
			async: true,
			success: function(result, textStatus, jqXHR) {
				var ajaxResArr = result.split("|=|")
				
				// alert(ajaxResArr[0] + '=' + ajaxResArr[1]);
				
				if (ajaxResArr[0] == "success") {
					
					refreshImageCaptcha();
					$('#captchaCode').val('');
					$("#signup")[0].reset();	
					doAlert(ajaxResArr[0], "<p>H εγγραφή σας ολοκληρώθηκε! Δείτε το e-mail σας για τις οδηγίες ενεργοποίησης του λογαριασμού σας.</p>");	
				}else if (ajaxResArr[0] == "warning") {
					refreshImageCaptcha();
					$('#captchaCode').val('');
					$("#signup")[0].reset();	
					doAlert(ajaxResArr[0], "<p>H εγγραφή σας ολοκληρώθηκε αλλά δεν ήταν δυνατή η αποστολή ενημερωτικού e-mail στον λογαριασμό που δηλώσατε κατά την εγγραφή σας.</p><p>Το σφάλμα που αναφερθηκε είναι: </p>" + ajaxResArr[1]);					
				}else if (ajaxResArr[0] == "error") {
					refreshImageCaptcha();
					$('#captchaCode').val('');
					doAlert(ajaxResArr[0], "<p>H εγγραφή σας δεν ολοκληρώθηκε!</p><p>Το σφάλμα που αναφερθηκε είναι:</p>" + ajaxResArr[1]);
				}

			},
			error: function(jqXHR, textStatus, errorThrown) {
				var errMsg = '';
				errMsg = errMsg + "<p>Παρουσιάστηκε σφάλμα κατά την διαδικασία αποθήκευσης των δεδομένων.</p>";
				errMsg = errMsg + "<p>Το μήνυμα που επεστράφει από του διακομιστή είναι το εξής:</p>";
				errMsg = errMsg + "<p>" + errorThrown + "</p>";
				errMsg = errMsg + "<p>" + jqXHR.responseText + "</p>";
				doAlert("error", errMsg);	
				refreshImageCaptcha();
				$('#captchaCode').val('');
			},
			complete: function() {
				$("#signup-submit").show();
				$("#loading-submit").hide();
			}
		});	
	
	});
	
});

// jquery global functions
function doAlert(aStatus, aMsg) {

	var alertType;
	var alertTitle;
	var btnClass;
	
	if (aStatus == "error") {
	
		alertType = BootstrapDialog.TYPE_DANGER;
		alertTitle = '<h4><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>&nbsp;<strong>Κάτι δεν πήγε καλά!</strong></h4>';
		btnClass = 'btn-danger';
				
	}else if (aStatus == "warning") {
	
		alertType = BootstrapDialog.TYPE_WARNING;
		alertTitle = '<h4><span class="glyphicon glyphicon-alert" aria-hidden="true"></span>&nbsp;<strong>Προειδοποίηση!</strong></h4>';
		btnClass = 'btn-warning';
		
	}else if (aStatus == "success") {	

		alertType = BootstrapDialog.TYPE_SUCCESS;
		alertTitle = '<h4><span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>&nbsp;<strong>Συγχαρητήρια!</strong></h4>';
		btnClass = 'btn-success';
	
	}else if (aStatus == "info") {

		alertType = BootstrapDialog.TYPE_INFO;
		alertTitle = '<h4><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>&nbsp;<strong>Χρήσιμη Πληροφορία!</strong></h4>';
		btnClass = 'btn-info';
	
	}else{
	
		alertType = BootstrapDialog.TYPE_DEFAULT;
		alertTitle = '';
		btnClass = 'btn-default';
	}

	// Initialiase the alert box
	BootstrapDialog.show({
        type: alertType,
        title: alertTitle,
        message: aMsg,
		buttons: [{
			label: 'Εντάξει',
			cssClass: btnClass, 
			action: function(dialogItself){
                dialogItself.close();
			}					
		}]
    });    
		
}

function refreshImageCaptcha() {
	//var objImage = document.images[valImageId];
    var objImage = document.getElementById("imgCaptcha");
	if (objImage == undefined) {
		return;
	}
	var now = new Date();
	objImage.src = objImage.src.split('?')[0] + '?x=' + escape(now.toUTCString());
}


function validateCaptcha(pCaptcha) {
	
	var vCResult = false;
	
	if (pCaptcha == "") {
		return false;
	}else{
	
		$.ajax({
			url    : '/ajax/validate-captcha.asp',
			data   : 'captchaCode=' + pCaptcha,
			type   : 'post',
			async: false,
			success: function (result) {
						
				var json = JSON.parse(result);
				var status = json['status'];
			
				if (status == "valid") { 
					vCResult = true;
				}else{
					vCResult = false;
				}
			
			}
		});	
	}
	
	return vCResult;
}


function vatNoFound(pVatNo) {
	
	var vFResult = false;
	
	if (pVatNo == "") {
		return false;
	}else{
	
		// window.open('/ajax/check-vatnumber.asp?customerVATNo=' + pVatNo, '_blank');
	
		$.ajax({
			url    : '/ajax/check-vatnumber.asp',
			data   : 'customerVATNo=' + pVatNo,
			type   : 'post',
			async: false,
			success: function (result) {
						
				var json = JSON.parse(result);
				var status = json['status'];
			
				if (status == "notfound") { 
					vFResult = true;
				}else{
					vFResult = false;
				}
			
			}
		});	
	}
	
	return vFResult;
}