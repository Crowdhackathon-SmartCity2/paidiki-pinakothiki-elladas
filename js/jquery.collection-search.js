$(document).ready(function () {
		
	$(".navbar").find(".active").removeClass("active");
	$(".top-level2").addClass("active");
		
	// enable tooltips
	$('[data-toggle="tooltip"]').tooltip();
			
	$(document).delegate('*[data-toggle="lightbox"]:not([data-gallery="navigateTo"])', 'click', function(event) {
		event.preventDefault();
        $(this).ekkoLightbox();
    });
		
	// handle page menubar		

	$('#result-paging').on('change', function() {
		$( "#page").val($( this ).value);
			
			$( "#searchForm" ).submit(function( event ) {
				event.preventDefault();
			});
	});

	
		
		
	// submit search form
	$("#search-reset").click(function(e) {
		$("#searchForm")[0].reset();
		
	
	});	

	$("#searchForm").submit(function(e) {
	
		e.preventDefault();
		
		// clear result area and enable spinner
		$( "#searchResults" ).html('');
		$( "#searchResults" ).hide();
		
		$("#searchLoader").show();
		
		
		// form is completed OK
		// send data to the database
		
		var form = $('#searchForm');
		var postData = form.serialize();
		var formURL = '/ajax/collection-search.asp';
							
		// window.open(formURL+'?'+postData, '_blank');					
							
		$.ajax({
			url    : formURL,
			data   : postData,
			type   : 'post',
			async: true,
			success: function(result, textStatus, jqXHR) {
				var ajaxResArr = result.split("===");
				$( "#searchResults" ).html(ajaxResArr[0]);
				$( "#result-pane" ).html(ajaxResArr[1]);
				$( "#result-paging" ).html(ajaxResArr[2]);
				//alert("ajaxResArr[1]");
				//alert("ajaxResArr[0]");
			},
			error: function(jqXHR, textStatus, errorThrown) {
				var errMsg = '';
				errMsg = errMsg + "<p>Παρουσιάστηκε σφάλμα κατά την διαδικασία αναζήτησης.</p>";
				errMsg = errMsg + "<p>Το μήνυμα που επεστράφει από του διακομιστή είναι το εξής:</p>";
				errMsg = errMsg + "<p>" + errorThrown + "</p>";
				errMsg = errMsg + "<p>" + jqXHR.responseText + "</p>";
				doAlert("error", errMsg);	
				
			},
			complete: function() {
				$("#searchResults" ).show();
		
				$("#searchLoader").hide();
			}
		});	
	
	});
			
});
////////////////////////////////////////////////////////////////

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