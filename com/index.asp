<html>
<head>
<title>Security Test Utility</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1253">

<SCRIPT LANGUAGE="JavaScript">

function copyToClipBoard() 
{

    var holdtext = document.getElementById("textToCopy").value;

    if (window.clipboardData) {
        window.clipboardData.setData('text',holdtext);
        alert("String was copied to clipboard!");
    }else{
        alert("String could not be copied to clipboard!");
    }

}

function getExtension(filename) {
    return filename.split('.').pop().toLowerCase();
}

function openFile(file) { 
    switch(getExtension(file)) {
        //if .jpg/.gif/.png do something
        case 'jpg': case 'gif': case 'png':
            /* handle */
            break;
        //if .zip/.rar do something else
        case 'zip': case 'rar':
            /* handle */
            break;

        //if .pdf do something else
        case 'pdf':
            /* handle */
            break;
    }
}

</SCRIPT> 

</head>
<body>
<%

Set secObj = Server.CreateObject("RTEL.WebSecurity")

Dim pwd, encryptedPWD, decryptedPWD, action


If Request.Form("action") <> "" Then
    action = Request.Form("action")
Else
    action = "form"
End If

If Request.Form("actionType") = "" Then
    Response.Write("actionType is not a form element<br>")
Else
    Response.Write("actionType is a form element<br>")
End If

If action = "encrypt" Then
    pwd = Trim(Request.Form("pwd"))

    If Request.Form("actionType") = "1" Then

%>

    <table width="100%" cellpadding="0" cellspacing="4" border=1">
    <tr>
        <td align="left" valign="middle" nowrap><strong>RAW STRING</strong></td>
        <td align="left" valign="middle"><%=pwd%></td>
    </tr>
    <tr>
        <td align="left" valign="middle" nowrap><strong>ENCRYPTED STRING</strong></td>
        <td align="left" valign="middle"><input type="text" name="encryptedString" id="textToCopy" value="<%=secObj.encryptData(pwd)%>" readonly style="border:1px solid white;background-color:#cccccc;color:#ff0000;font-weight:bold;width:700px">&nbsp;<input type="button" name="copyToCB" value="COPY TO CLIPBOARD" onClick="copyToClipBoard()"></td>
    </tr>
    <tr>
        <td align="left" valign="middle" nowrap><strong>DECRYPTED STRING</strong></td>
        <td align="left" valign="middle"><%=secObj.decryptData(secObj.encryptData(pwd))%></td>
    </tr>
    <tr>
        <td colspan="2" align="center" valign="middle"><input type="button" name="tryAgain" value="START OVER" onClick="window.location='index.asp';"></td>
    </tr>
    </table>
<%
    Else
%>
    <table width="100%" cellpadding="0" cellspacing="4" border=1">
    <tr>
        <td align="left" valign="middle" nowrap><strong>DECRYPTED STRING</strong></td>
        <td align="left" valign="middle"><input type="text" name="encryptedString" id="textToCopy" value="<%=secObj.decryptData(pwd)%>" readonly style="border:1px solid white;background-color:#cccccc;color:#ff0000;font-weight:bold;width:700px">&nbsp;<input type="button" name="copyToCB" value="COPY TO CLIPBOARD" onClick="copyToClipBoard()"></td>
    </tr>
    <tr>
        <td align="left" valign="middle" nowrap><strong>ENCRYPTED STRING</strong></td>
        <td align="left" valign="middle"><%=secObj.encryptData(secObj.decryptData(pwd))%></td>
    </tr>
    <tr>
        <td colspan="2" align="center" valign="middle"><input type="button" name="tryAgain" value="START OVER" onClick="window.location='index.asp';"></td>
    </tr>
    </table>
<%
    End If

Else
%>
    <form name="encode" action="index.asp" method="POST">
        <strong>String to Encode:</strong>&nbsp;<input type="text" name="pwd" value="" size="128">&nbsp;
        <input type="hidden" name="action" value="encrypt">
        <input type="hidden" name="actionType" value="">
        <input type="submit" name="encodeIt" value="ENCODE STRING" onClick="this.form.actionType.value=1"><input type="submit" name="decodeIt" value="DECODE STRING" onClick="this.form.actionType.value=2">
    </form>
<%
End If


Set secObj = Nothing


'Response.Write("Is ""a = a"" valid? " & validateStringEntry("a = a") & "<br>" & vbCrLf)
'Response.Write("Is ""dogo!!"" valid? " & validateStringEntry("dogo!!") & "<br>" & vbCrLf)
'Response.Write("Is ""NBy56D3#r$"" valid? " & validateStringEntry("NBy56D3#r$") & "<br>" & vbCrLf)

Dim testEmail

testEmail = "ipetridis@rtel.gr"

If isValidEmail(testEmail) Then
    Response.Write("["&testEmail&"] is a valid email address<br>"&vbCrLf)
Else
    Response.Write("["&testEmail&"] is NOT a valid email address<br>"&vbCrLf)
End If


Dim spliter

spliter = "1"

optSplit = Split(spliter, "#")

For i = LBound(optSplit) To UBound(optSplit)
    Response.Write("optSplit("&i&") is " & optSplit(i) & "<br>"&vbCrLf)
Next

a = "????"
b = Replace(a, "?", "?, ")
b = Left(b, Len(b) - 2)

Response.Write("a = ["& a &"] and b is [" & b & "]<br>"&vbCrLf)


Public Function validateStringEntry(ByVal stringExp)

    Dim allowedChars, isValid

    isValid = True

    allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.-_/+$:%@!#"

    If Len(stringExp) > 0 Then
        For i = 1 To Len(stringExp)
            Response.Write("Char 2 check is [" & Mid(stringExp, i, 1) & "] and found in pos " & InStr(1, allowedChars, Mid(stringExp, i, 1), 1) & "<br>" & vbCrLf)
            If InStr(1, allowedChars, Mid(stringExp, i, 1), 1) = 0 Then
                isValid = False
                Exit For
            End If    
        Next
    End If
    
    validateStringEntry = isValid

End Function


Function isValidEmail(sEmail)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,3}$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sEmail)

    ' Execute the search test.
    If Not regEx.Test(sEmail) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidEmail = isValid

End Function 


%>
</body>
</html>
