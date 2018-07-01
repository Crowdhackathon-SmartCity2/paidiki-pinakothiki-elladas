//-----------------------------------------------------------------
//   Application : Control Panel
//   Version     : 1.0
//   File        : common.js
//   Usage       : Common Application JavaScript Functions
//   Copyright   : (c)2006 RTel S.A. All rights reserved.
//-----------------------------------------------------------------

var clockID = 0;
var singleSelect = true;  // Allows an item to be selected once only
var sortSelect = true;  // Only effective if above flag set to true
var sortPick = false;  // Will order the picklist in sort sequence

var singleSelect1 = true;  // Allows an item to be selected once only
var sortSelect1 = true;  // Only effective if above flag set to true
var sortPick1 = false;  // Will order the picklist in sort sequence

function UpdateClock() {
   if (clockID) {
      clearTimeout(clockID);
      clockID  = 0;
   }

   //var tDate = new Date();

   //document.getElementById("dt").innerHTML = fixGreekMonth(tDate.toLocaleString());   
   document.getElementById("dt").innerHTML = moment().locale('el').format('dddd, D MMMM YYYY, h:mm:ss a'); 
   clockID = setTimeout("UpdateClock()", 1000);
}

function fixGreekMonth(dts) {

	var fixedDTS = "";
	
	var dtParts = dts.split(" ");
	fixedDTS = dtParts[0] + " " +
			   dtParts[1] + " " +
			   dtParts[2].substring(0, (dtParts[2].length-1)) + "υ " +	
			   dtParts[3] + " " +
			   dtParts[4] + " " +
			   dtParts[5];
			   
	
		
	// fixedDTS = dts.substring(0, (dts.length-1)) + "υ" 
	
	// alert(fixedDTS);

	return fixedDTS;
}

function StartClock() {
   //moment.locale('el');
   clockID = setTimeout("UpdateClock()", 1000);
   // window.status = "Η εφαρμογή είναι συμβατή με τον Microsoft Internet Explorer εκδ. 6 και πάνω ή με Mozilla FireFox εκδ. 2.x"
}

function StopClock() {
   if (clockID) {
      clearTimeout(clockID);
      clockID  = 0;
   }
   window.status = ""
}

function displayStatusInfo(displayed) {

    if (displayed) {
        window.status = "Για μέγιστη ποιότητα επιλέξτε ανάλυση οθόνης 1024 x 768 pixels";
    }else{
        window.status = "";
    } 
}

function showSessionExpiredWarning() {
    var msg = "Έχετε ανακατευθυνθεί στην σελίδα εισόδου επειδή η συνεδρία σας (session) έχει λήξει.\n\nΓια λόγους ασφαλείας παρακαλώ συνδεθείτε ξανά.\n\n";
    alert(msg);
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function getCookieValue (cookieName) {
    var exp = new RegExp (escape(cookieName) + "=([^;]+)");
    if (exp.test (document.cookie + ";")) {
        exp.exec (document.cookie + ";");
        return unescape(RegExp.$1);
    }else return false;
}


function sessionCookiesEnabled () {

    document.cookie ="testSessionCookie=Enabled";
    if (getCookieValue ("testSessionCookie")=="Enabled") {
        return true; 
    }else{
        return false;
    }  
}

function validateLoginForm(f) {

    if (f.user.value == "") {
        alert("Παρακαλώ εισάγετε το όνομα χρήστη.\n");
        f.user.focus();
		f.loginBtn.disabled = false;
		document.getElementById('ldr').style.display = 'none';
        return false;
    }

    if (f.pass.value == "") {
        alert("Παρακαλώ εισάγετε τον κωδικό πρόσβασης.\n");
        f.pass.focus();
		f.loginBtn.disabled = false;
		document.getElementById('ldr').style.display = 'none';
        return false;
    }

    f.loginBtn.disabled = true;
    return true;
}

function confirmLogout() {
    var msg = "";

    msg = "Είστε βέβαιος(α) ότι θέλετε να αποσυνδεθείτε από το Control Panel της ιστοσελίδας σας;\n\n";
    
    if (confirm(msg)) {
        return true;
    }else{
        return false;
    }
}

function confirmDeleteUser(uName) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να διαγράψετε τον χρήστη \'" + uName + "\'.\n\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα στον παραπάνω λογαριασμό τα εξής:\n\n";
    msg = msg + "\t- Διαγραφή όλων των στοιχείων του λογαριασμού.\n";
    msg = msg + "\t- Ανάκληση όλων των προνομίων πρόσβασης στις επιλογές του μενού πλοήγησης.\n";
    msg = msg + "\nΗ ενέργεια αυτή είναι μη αναστρέψιμη.\n";
    msg = msg + "\nθέλετε να προχωρήσετε στην οριστική διαγραφή;\n\n";
    
    if (confirm(msg)) {
        return true;
    }else{
        return false;
    }
}


function confirmDeleteBWMember(mName, cNumber) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να διαγράψετε τον λογαριασμό του μέλους \'" + mName + "\' με αριθμό κάρτας \'" + cNumber + "\'.\n\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα στον παραπάνω λογαριασμό τα εξής:\n\n";
    msg = msg + "\t- Διαγραφή όλων των στοιχείων του λογαριασμού.\n";
    msg = msg + "\t- Διαγραφή όλων των κινήσεων της κάρτας του (εάν έχει).\n";
    msg = msg + "\nΠΡΟΣΟΧΗ: Τα στοιχεία του μέλους πρέπει να διαγραφούν ΚΑΙ από την βάση του SoftOne.\n";
    msg = msg + "\nΗ ενέργεια αυτή είναι μη αναστρέψιμη.\n";
    msg = msg + "\nθέλετε να προχωρήσετε στην οριστική διαγραφή;\n\n";
    
    if (confirm(msg)) {
        return true;
    }else{
        return false;
    }
}

function confirmDeleteNewsletter(nlMonth, nlYear, nlLang) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να διαγράψετε το newsletter \'" + nlMonth + " " + nlYear + " (" + nlLang + ")\'.\n\n";
    msg = msg + "Η ενέργεια αυτή είναι μη αναστρέψιμη.\n";
    msg = msg + "\nθέλετε να προχωρήσετε στην οριστική διαγραφή του newsletter;\n\n";
    
    if (confirm(msg)) {
        return true;
    }else{
        return false;
    }
}

function confirmDeleteDestination(destName, lang) {
    var msg = "";

	if (lang == "el") {
		msg = msg + "Έχετε επιλέξει να διαγράψετε τον προορισμό \'" + destName + "\' από τον ταξιδιωτικό οδηγό της ελληνικής έκδοσης του site.\n\n";
	}else{
		msg = msg + "Έχετε επιλέξει να διαγράψετε τον προορισμό \'" + destName + "\' από τον ταξιδιωτικό οδηγό της αγγλικής έκδοσης του site.\n\n";
	}
    
    msg = msg + "Η ενέργεια αυτή είναι μη αναστρέψιμη.\n";
    msg = msg + "\nθέλετε να προχωρήσετε στην οριστική διαγραφή του προορισμού;\n\n";
    
    if (confirm(msg)) {
        return true;
    }else{
        return false;
    }
}

function confirmSuspendUser(e, uName) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να απενεργοποιήσετε τον λογαριασμό του χρήστη \'" + uName + "\'.\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα να μην μπορεί να συνδεθεί στο Control Panel.\n\n";
    msg = msg + "Θέλετε να προχωρήσετε στην απενεργοποίηση του παραπάνω λογαριασμού;\n\n";

    if (e.checked == false) {
        if (confirm(msg)) {
            e.checked = false;
        }else{
            e.checked = true;
        }
    }
}

function confirmSuspendImage(e, iName) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να απενεργοποιήσετε την εικόνα \'" + iName + "\'.\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα να μην ειναι πλέον διαθέσιμη σε νέα άρθρα.\n\n";
    msg = msg + "Θέλετε να προχωρήσετε στην απενεργοποίηση της παραπάνω εικόνας;\n\n";

    if (e.checked == false) {
        if (confirm(msg)) {
            e.checked = false;
        }else{
            e.checked = true;
        }
    }
}

function confirmSuspendDocument(e, dName) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να απενεργοποιήσετε τo έγγραφο \'" + dName + "\'.\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα να μην ειναι πλέον διαθέσιμο σε νέα άρθρα.\n\n";
    msg = msg + "Θέλετε να προχωρήσετε στην απενεργοποίηση του παραπάνω εγγράφου;\n\n";

    if (e.checked == false) {
        if (confirm(msg)) {
            e.checked = false;
        }else{
            e.checked = true;
        }
    }
}

function confirmSuspendTenderDocument(e, dName, tRef) {
    var msg = "";

    msg = msg + "Έχετε επιλέξει να απενεργοποιήσετε τo έγγραφο \'" + dName + "\' του διαγωνισμού \'" + tRef + "\'.\n";
    msg = msg + "Αυτό θα έχει ως αποτέλεσμα να μην εμφανίζεται στο site ως συνοδευτικό έγγραφο του διαγωνισμού.\n\n";
    msg = msg + "Θέλετε να προχωρήσετε στην απενεργοποίηση του παραπάνω εγγράφου;\n\n";

    if (e.checked == false) {
        if (confirm(msg)) {
            e.checked = false;
        }else{
            e.checked = true;
        }
    }
}


// --- Functions to handle menu selections //---
function toggleMenu(item, total) {

    var i;

    for (i=1;i<=total;i++) {

        if (i == item) {

            if (eval("document.getElementById('nSubMenu" + item + "').style.display == 'none'") ||
                eval("document.getElementById('nSubMenu" + item + "').style.display == ''") ) {

                if (eval("/up/.test(document.getElementById('nMenuItem" + item + "').innerHTML)")) {
                    eval("document.getElementById('nMenuItem" + item + "').innerHTML = document.getElementById('nMenuItem" + item + "').innerHTML.replace(/up/, 'down')");
                    eval("document.getElementById('nSubMenu" + item + "').style.display = 'none'");
                }else{
                    eval("document.getElementById('nMenuItem" + item + "').innerHTML = document.getElementById('nMenuItem" + item + "').innerHTML.replace(/down/, 'up')");
                    eval("document.getElementById('nSubMenu" + item + "').style.display = 'block'");
                }
                
                
            }else{
                eval("document.getElementById('nSubMenu" + item + "').style.display = 'none'");
                eval("document.getElementById('nMenuItem" + item + "').innerHTML = document.getElementById('nMenuItem" + item + "').innerHTML.replace(/up/, 'down')");
            }
        }else{
            eval("document.getElementById('nMenuItem" + i + "').innerHTML = document.getElementById('nMenuItem" + i + "').innerHTML.replace(/up/, 'down')");
            eval("document.getElementById('nSubMenu" + i + "').style.display = 'none'");
       }
    }

}

function toggleCursor(item, type) {
    eval("document.getElementById('nMenuItem" + item + "').style.cursor = '" + type + "'");
}

/* functions added by I. Petridis */


function isFloat(input) {

    if (/^[\d,\.]+$/.test(input)){
        return true;
    }
    return false;
}


function isInt(input) {

    if (/^[\d]+$/.test(input)){
        return true;
    }
    return false;
}

function isValidPhone(input) {

    if (/^[\d\s-]+$/.test(input)){
        return true;
    }
    return false;
}

function isValidMobile(input) {

    if (/^69[\d]{8}$/.test(input)){
        return true;
    }
    return false;
}

function isValidEmail(input) {

    if (/^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$/.test(input)){
        return true;
    }
    return false;
}

function isValidPassword(input) {
	
	if (/^[a-zA-Z\d,\.-_\/\+\$:\%\@!#]{8,12}$/.test(input)){
        return true;
    }
    return false;
}

function DateAdd(sInterval, iNum, tDate) {

  var aDate = tDate.split("/");
  var nDate = "";
  var nDay, nMonth;

  var dTemp = new Date(aDate[2],aDate[1]-1,aDate[0]);
  
  if (!sInterval || iNum == 0) return dTemp;
  switch (sInterval.toLowerCase()){
    case "ms":
      dTemp.setMilliseconds(dTemp.getMilliseconds() + iNum);
      break;
    case "s":
      dTemp.setSeconds(dTemp.getSeconds() + iNum);
      break;
    case "mi":
      dTemp.setMinutes(dTemp.getMinutes() + iNum);
      break;
    case "h":
      dTemp.setHours(dTemp.getHours() + iNum);
      break;
    case "d":
      dTemp.setDate(dTemp.getDate() + iNum);
      break;
    case "mo":
      dTemp.setMonth(dTemp.getMonth() + iNum);
      break;
    case "y":
      dTemp.setFullYear(dTemp.getFullYear() + iNum);
      break;
  }

  if (dTemp.getDate() < 10) {
     nDay = "0" + dTemp.getDate();
  }else{
     nDay = dTemp.getDate();
  }

  nMonth = dTemp.getMonth() + 1;

  if (nMonth < 10) {
     nMonth = "0" + nMonth;
  }

  nDate = nDay + "/" + nMonth + "/" + dTemp.getFullYear();
  return nDate;

}

function DateDiff(sInterval,date1,date2) {

    var diff = 0;
    var aDate1, sDate2;

    aDate1 = date1.split("/");
    aDate2 = date2.split("/");

    sDate = new Date(aDate1[2],aDate1[1]-1,aDate1[0]);
    eDate = new Date(aDate2[2],aDate2[1]-1,aDate2[0]);

    if (!sInterval) {
        diff = 0;
    }

    switch (sInterval.toLowerCase()) {
        case "ms":
            diff = Math.round((eDate-sDate)/1);
            //diff = ((sDate-eDate)/1);
            break;
        case "s":
            diff = Math.round((eDate-sDate)/1000);
            //diff = ((sDate-eDate)/1000);
            break;
        case "mi":
            diff = Math.round((eDate-sDate)/60000);
            //diff = ((sDate-eDate)/60000);
            break;
        case "h":
            diff = Math.round((eDate-sDate)/3600000);
            //diff = ((sDate-eDate)/3600000);
            break;
        case "d":
            diff = Math.round((eDate-sDate)/86400000);
            //diff = ((sDate-eDate)/86400000);
            break;      

    }
    return diff;
}

function togglePWD() {

    var d = document.getElementById("pass");
    var e = document.getElementById("smallItem");

    if ( (d.style.display == "none") ||
         (d.style.display == "") ) {
        d.style.display = "inline";
        e.innerHTML = "<img src=\"images/Login.gif\" border=\"0\" align=\"absmiddle\">Απόκρυψη Κωδικού";
    }else{
        d.style.display = "none";
        e.innerHTML = "<img src=\"images/Login.gif\" border=\"0\" align=\"absmiddle\">Εμφάνιση Κωδικού";
    }
}


function togglePubDate(s) {

    if (s.options[s.selectedIndex].value == "immediate") {
        document.getElementById("pubDateArea").style.display = "none";
        document.getElementById("pubDate").value = "";
    }else{
        document.getElementById("pubDateArea").style.display = "inline";
        document.getElementById("pubDate").value = "";
    }

}

function toggleExpDate(s) {

    if (s.options[s.selectedIndex].value == "neverexpires") {
        document.getElementById("expDateArea").style.display = "none";
        document.getElementById("expDate").value = "";
    }else{
        document.getElementById("expDateArea").style.display = "inline";
        document.getElementById("expDate").value = "";
    }

}

function toggleContentType(s) {

    if (s.options[s.selectedIndex].value == "1") {

        document.getElementById("contentType").options[0].selected = true;
        document.getElementById("contentType").disabled = false;
        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;
    }else if (s.options[s.selectedIndex].value == "2") {

        document.getElementById("contentType").options[1].selected = true;
        document.getElementById("contentType").disabled = true;
        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;
    }else{
        document.getElementById("contentType").options[0].selected = true;
        document.getElementById("contentType").disabled = false;
        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;
    }

}


function toggleContentBlock(s) {

    if (s.options[s.selectedIndex].value == "user-defined") {

        document.getElementById("user-defined").style.display = "block";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;

    }else if (s.options[s.selectedIndex].value == "external-redirect") {

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "block";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("sourceContentID").options[0].selected = true;
    }else if (s.options[s.selectedIndex].value == "source-content") {

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "block";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
    }else if (s.options[s.selectedIndex].value == "no-content") {

        document.getElementById("pageTypeID").options[2].selected = true;
        document.getElementById("contentType").disabled = true;
        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;

    }else{

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;
    }

}


function toggleContentBlock1(s) {

    if (s.options[s.selectedIndex].value == "user-defined") {

        document.getElementById("user-defined").style.display = "block";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;

    }else if (s.options[s.selectedIndex].value == "external-redirect") {

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "block";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("sourceContentID").options[0].selected = true;
    }else if (s.options[s.selectedIndex].value == "source-content") {

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "block";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
    }else{

        document.getElementById("user-defined").style.display = "none";
        document.getElementById("external-redirect").style.display = "none";
        document.getElementById("source-content").style.display = "none";

        // clear hidden form elements
        tinyMCE.get('pageBody').setContent('');
        document.getElementById("redirectURL").value = "";
        document.getElementById("sourceContentID").options[0].selected = true;
    }

}

function validateSourceContentID(e) {

    if ((e.options[e.selectedIndex].value == "") && (e.selectedIndex != 0)) {
        alert("Παρακαλώ επιλέξτε μια σελίδα περιεχομένων\n\n");
        e.options[0].selected = true;
    } 

}

function toggleSearchForm() {

    var f = document.getElementById("dynSearch");

    if ( (f.style.display == "none") ||
         (f.style.display == "") ) {
        f.style.display = "block";
    }else{
        f.style.display = "none";
    }

}

function toggleAddItemForm() {

    var f = document.getElementById("dynAddItem");

    if ( (f.style.display == "none") ||
         (f.style.display == "") ) {
        f.style.display = "block";
    }else{
        f.style.display = "none";
    }

}

// Adds a selected item into the picklist
function addToRelated() {
  var selectList = document.getElementById("storedDocumentIDs");
  var selectIndex = selectList.selectedIndex;
  var selectOptions = selectList.options;
  var pickList = document.getElementById("relatedDocumentIDs");
  var pickOptions = pickList.options;
  var pickOLength = pickOptions.length;
  // An item must be selected
  while (selectIndex > -1) {
    pickOptions[pickOLength] = new Option(selectList[selectIndex].text);
    pickOptions[pickOLength].value = selectList[selectIndex].value;
    // If single selection, remove the item from the select list
    if (singleSelect) {
      selectOptions[selectIndex] = null;
    }
    if (sortPick) {
      var tempText;
      var tempValue;
      // Sort the pick list
      while (pickOLength > 0 && pickOptions[pickOLength].value < pickOptions[pickOLength-1].value) {
        tempText = pickOptions[pickOLength-1].text;
        tempValue = pickOptions[pickOLength-1].value;
        pickOptions[pickOLength-1].text = pickOptions[pickOLength].text;
        pickOptions[pickOLength-1].value = pickOptions[pickOLength].value;
        pickOptions[pickOLength].text = tempText;
        pickOptions[pickOLength].value = tempValue;
        pickOLength = pickOLength - 1;
      }
    }
    selectIndex = selectList.selectedIndex;
    pickOLength = pickOptions.length;
  }
  //selectOptions[0].selected = true;
}

// Deletes an item from the picklist
function removeFromRelated() {
  var selectList = document.getElementById("storedDocumentIDs");
  var selectOptions = selectList.options;
  var selectOLength = selectOptions.length;
  var pickList = document.getElementById("relatedDocumentIDs");
  var pickIndex = pickList.selectedIndex;
  var pickOptions = pickList.options;
  while (pickIndex > -1) {
    // If single selection, replace the item in the select list
    if (singleSelect) {
      selectOptions[selectOLength] = new Option(pickList[pickIndex].text);
      selectOptions[selectOLength].value = pickList[pickIndex].value;
    }
    pickOptions[pickIndex] = null;
    if (singleSelect && sortSelect) {
      var tempText;
      var tempValue;
      // Re-sort the select list
      while (selectOLength > 0 && selectOptions[selectOLength].value < selectOptions[selectOLength-1].value) {
        tempText = selectOptions[selectOLength-1].text;
        tempValue = selectOptions[selectOLength-1].value;
        selectOptions[selectOLength-1].text = selectOptions[selectOLength].text;
        selectOptions[selectOLength-1].value = selectOptions[selectOLength].value;
        selectOptions[selectOLength].text = tempText;
        selectOptions[selectOLength].value = tempValue;
        selectOLength = selectOLength - 1;
      }
    }
    pickIndex = pickList.selectedIndex;
    selectOLength = selectOptions.length;
  }
}

// Adds a selected image to the image list of the photo gallery
function addToPhotoGallery() {
  var selectList = document.getElementById("storedImageIDs");
  var selectIndex = selectList.selectedIndex;
  var selectOptions = selectList.options;
  var pickList = document.getElementById("photoGalleryImageIDs");
  var pickOptions = pickList.options;
  var pickOLength = pickOptions.length;
  // An item must be selected
  while (selectIndex > -1) {
    pickOptions[pickOLength] = new Option(selectList[selectIndex].text);
    pickOptions[pickOLength].value = selectList[selectIndex].value;
    // If single selection, remove the item from the select list
    if (singleSelect) {
      selectOptions[selectIndex] = null;
    }
    if (sortPick) {
      var tempText;
      var tempValue;
      // Sort the pick list
      while (pickOLength > 0 && pickOptions[pickOLength].value < pickOptions[pickOLength-1].value) {
        tempText = pickOptions[pickOLength-1].text;
        tempValue = pickOptions[pickOLength-1].value;
        pickOptions[pickOLength-1].text = pickOptions[pickOLength].text;
        pickOptions[pickOLength-1].value = pickOptions[pickOLength].value;
        pickOptions[pickOLength].text = tempText;
        pickOptions[pickOLength].value = tempValue;
        pickOLength = pickOLength - 1;
      }
    }
    selectIndex = selectList.selectedIndex;
    pickOLength = pickOptions.length;
  }
  //selectOptions[0].selected = true;
}

// Deletes an image from the image list of a photo gallery
function removeFromPhotoGallery() {
  var selectList = document.getElementById("storedImageIDs");
  var selectOptions = selectList.options;
  var selectOLength = selectOptions.length;
  var pickList = document.getElementById("photoGalleryImageIDs");
  var pickIndex = pickList.selectedIndex;
  var pickOptions = pickList.options;
  while (pickIndex > -1) {
    // If single selection, replace the item in the select list
    if (singleSelect) {
      selectOptions[selectOLength] = new Option(pickList[pickIndex].text);
      selectOptions[selectOLength].value = pickList[pickIndex].value;
    }
    pickOptions[pickIndex] = null;
    if (singleSelect && sortSelect) {
      var tempText;
      var tempValue;
      // Re-sort the select list
      while (selectOLength > 0 && selectOptions[selectOLength].value < selectOptions[selectOLength-1].value) {
        tempText = selectOptions[selectOLength-1].text;
        tempValue = selectOptions[selectOLength-1].value;
        selectOptions[selectOLength-1].text = selectOptions[selectOLength].text;
        selectOptions[selectOLength-1].value = selectOptions[selectOLength].value;
        selectOptions[selectOLength].text = tempText;
        selectOptions[selectOLength].value = tempValue;
        selectOLength = selectOLength - 1;
      }
    }
    pickIndex = pickList.selectedIndex;
    selectOLength = selectOptions.length;
  }
}


// Adds a selected destination to the collection of daily excursion departure ports
function addToDepartureList() {
  var selectList = document.getElementById("deptStationIDs");
  var selectIndex = selectList.selectedIndex;
  var selectOptions = selectList.options;
  var pickList = document.getElementById("deDeptStationIDs");
  var pickOptions = pickList.options;
  var pickOLength = pickOptions.length;
  // An item must be selected
  while (selectIndex > -1) {
    pickOptions[pickOLength] = new Option(selectList[selectIndex].text);
    pickOptions[pickOLength].value = selectList[selectIndex].value;
    // If single selection, remove the item from the select list
    if (singleSelect) {
      selectOptions[selectIndex] = null;
    }
    if (sortPick) {
      var tempText;
      var tempValue;
      // Sort the pick list
      while (pickOLength > 0 && pickOptions[pickOLength].value < pickOptions[pickOLength-1].value) {
        tempText = pickOptions[pickOLength-1].text;
        tempValue = pickOptions[pickOLength-1].value;
        pickOptions[pickOLength-1].text = pickOptions[pickOLength].text;
        pickOptions[pickOLength-1].value = pickOptions[pickOLength].value;
        pickOptions[pickOLength].text = tempText;
        pickOptions[pickOLength].value = tempValue;
        pickOLength = pickOLength - 1;
      }
    }
    selectIndex = selectList.selectedIndex;
    pickOLength = pickOptions.length;
  }
  //selectOptions[0].selected = true;
}

// Deletes aa selected destination to the collection of daily excursion departure ports
function removeFromDepartureList() {
  var selectList = document.getElementById("deptStationIDs");
  var selectOptions = selectList.options;
  var selectOLength = selectOptions.length;
  var pickList = document.getElementById("deDeptStationIDs");
  var pickIndex = pickList.selectedIndex;
  var pickOptions = pickList.options;
  while (pickIndex > -1) {
    // If single selection, replace the item in the select list
    if (singleSelect) {
      selectOptions[selectOLength] = new Option(pickList[pickIndex].text);
      selectOptions[selectOLength].value = pickList[pickIndex].value;
    }
    pickOptions[pickIndex] = null;
    if (singleSelect && sortSelect) {
      var tempText;
      var tempValue;
      // Re-sort the select list
      while (selectOLength > 0 && selectOptions[selectOLength].value < selectOptions[selectOLength-1].value) {
        tempText = selectOptions[selectOLength-1].text;
        tempValue = selectOptions[selectOLength-1].value;
        selectOptions[selectOLength-1].text = selectOptions[selectOLength].text;
        selectOptions[selectOLength-1].value = selectOptions[selectOLength].value;
        selectOptions[selectOLength].text = tempText;
        selectOptions[selectOLength].value = tempValue;
        selectOLength = selectOLength - 1;
      }
    }
    pickIndex = pickList.selectedIndex;
    selectOLength = selectOptions.length;
  }
}

