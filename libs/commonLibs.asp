<%

'-----------------------------------------------------------------
'   Application : Web Control Panel
'   Version     : 1.0
'   File        : commonLibs.asp
'   Usage       : Common Application Library Functions
'   Copyright   : (c)2006 RTel S.A. All rights reserved.
'-----------------------------------------------------------------

Public Function checkIpRestrictions(ByVal clIp1, ByVal clIp2, ByVal clIp3)

    Dim noRestriction, clientIp
    
    clientIp = Request.ServerVariables("REMOTE_ADDR")

    If clIp1 <> "" Then
        If (StrComp(clIp1, clientIp) <> 0) Then
            isRestricted = True
        Else
            isRestricted = False
        End If
    ElseIf clIp2 <> "" Then
        If (StrComp(clIp2, clientIp) <> 0) Then
            isRestricted = True
        Else
            isRestricted = False
        End If
    ElseIf clIp3 <> "" Then
        If (StrComp(clIp3, clientIp) <> 0) Then
            isRestricted = True
        Else
            isRestricted = False
        End If
    Else
        isRestricted = False
    End If

    checkIpRestrictions = isRestricted

End Function

Public Function writeCopyRightNotice()

    Dim startYear
    startYear = 2011

    If startYear = Year(Now) Then
        writeCopyRightNotice = ApplicationName & "&nbsp;-&nbsp;&copy;" & startYear & " " & CompanyName & " All rights reserved."
    Else
        writeCopyRightNotice = ApplicationName & "&nbsp;-&nbsp;&copy;" & startYear & " - " & Year(Now) & " " & CompanyName & " All rights reserved."
    End If

End Function

Public Function getCurrentLoginTS()

    Dim pcLocale
    Dim logints

    pcLocale = GetLocale()

    SetLocale(2057)
    logints = FormatDateTime(Now(), 3)
    SetLocale(pcLocale)

    getCurrentLoginTS = logints

End Function

Public Function getCurrentTimeStamp(timeIncluded, formatID)

        Dim pcLocale
        Dim tstamp

        pcLocale = GetLocale()

        SetLocale(2057)
        If timeIncluded Then
            tstamp = FormatDateTime(Date(), formatID) & " " & Time()
        Else
            tstamp = FormatDateTime(Date(), formatID)
        End If

        SetLocale(pcLocale)

        getCurrentTimeStamp = tstamp

End Function

Function hideSensitiveData(ByVal theString)

    Dim hiddenString, stringLength, FirstLetter, LastLetter

    FirstLetter = Mid(theString,1,1)
    LastLetter = Mid(theString,Len(theString),1)
    stringLength = Len(theString)-2
    hiddenString = FirstLetter

    For i = 1 To stringLength
        hiddenString = hiddenString & "*"
    Next

    hiddenString = hiddenString & LastLetter

    hideSensitiveData = hiddenString

End Function



Function formatObjectDate(ByVal objDate, ByVal outputFormat)

    Dim iDate, iMonth, iYear, iHour, iMin
    Dim sDate, sMonth, sYear, sHour, sMin
    Dim shortMonths
    Dim fDate

    Set shortMonths = Server.CreateObject("Scripting.Dictionary")

    iDate = Day(objDate)
    iMonth = Month(objDate)
    iYear = Year(objDate)
    iHour = Hour(objDate)
    iMin = Minute(objDate)

    If iDate < 10 Then
        sDate = "0" & iDate
    Else
        sDate = iDate
    End If

    If iMonth < 10 Then
        sMonth = "0" & iMonth
    Else
        sMonth = iMonth
    End If

    sYear = iYear

    If iHour < 10 Then
        sHour = "0" & iHour
    Else
        sHour = iHour
    End If

    If iMin < 10 Then
        sMin = "0" & iMin
    Else
        sMin = iMin
    End If

    shortMonths.Add "01", "Jan"
    shortMonths.Add "02", "Feb"
    shortMonths.Add "03", "Mar"
    shortMonths.Add "04", "Apr"
    shortMonths.Add "05", "May"
    shortMonths.Add "06", "Jun"
    shortMonths.Add "07", "Jul"
    shortMonths.Add "08", "Aug"
    shortMonths.Add "09", "Sep"
    shortMonths.Add "10", "Oct"
    shortMonths.Add "11", "Nov"
    shortMonths.Add "12", "Dec"

    'Check the output format
    Select Case outputFormat

        Case "dd/mm/yyyy"
            fDate = sDate & "/" & sMonth & "/" & sYear
        Case "dd-mm-yyyy"
            fDate = sDate & "-" & sMonth & "-" & sYear
        Case "yyyy-mm-dd"
            fDate = sYear & "-" & sMonth & "-" & sDate
        Case "d Mon yyyy"
            fDate = CInt(sDate) & " " & shortMonths.Item(sMonth) & " " & sYear
        Case "Mon d, yyyy"
            fDate = shortMonths.Item(sMonth) & " " & CInt(sDate) & ", " & sYear
        Case "dd/mm/yyyy hh:ii"
            fDate = sDate & "/" & sMonth & "/" & sYear & " " & sHour & ":" & sMin
        Case "yyyy-mm-dd hh:ii"
            fDate = sYear & "-" & sMonth & "-" & sDate & " " & sHour & ":" & sMin
        Case Else 'default
            fDate = sDate & "/" & sMonth & "/" & sYear
    End Select

    formatObjectDate = fDate

End Function

Function formatStringDate(ByVal theDate, ByVal inputFormat, ByVal outputFormat)

    Dim fDate, rawDateParts, shortMonths, numMonths
    Dim dateParts(2)
    Dim dateTimeParts
    Set shortMonths = Server.CreateObject("Scripting.Dictionary")
    Set numMonths = Server.CreateObject("Scripting.Dictionary")

    shortMonths.Add "01", "Jan"
    shortMonths.Add "02", "Feb"
    shortMonths.Add "03", "Mar"
    shortMonths.Add "04", "Apr"
    shortMonths.Add "05", "May"
    shortMonths.Add "06", "Jun"
    shortMonths.Add "07", "Jul"
    shortMonths.Add "08", "Aug"
    shortMonths.Add "09", "Sep"
    shortMonths.Add "10", "Oct"
    shortMonths.Add "11", "Nov"
    shortMonths.Add "12", "Dec"

    numMonths.Add "Jan", "01"
    numMonths.Add "Feb", "02"
    numMonths.Add "Mar", "03"
    numMonths.Add "Apr", "04"
    numMonths.Add "May", "05"
    numMonths.Add "Jun", "06"
    numMonths.Add "Jul", "07"
    numMonths.Add "Aug", "08"
    numMonths.Add "Sep", "09"
    numMonths.Add "Oct", "10"
    numMonths.Add "Nov", "11"
    numMonths.Add "Dec", "12"


    'Check the input format
    Select Case inputFormat

        Case "dd/mm/yyyy"
            rawDateParts = Split(theDate, "/")
            dateParts(0) = rawDateParts(0)
            dateParts(1) = rawDateParts(1)
            dateParts(2) = rawDateParts(2)
        Case "dd/mm/yy"
            rawDateParts = Split(theDate, "/")
            dateParts(0) = rawDateParts(0)
            dateParts(1) = rawDateParts(1)
            dateParts(2) = rawDateParts(2)
        Case "dd-mm-yyyy"
            rawDateParts = Split(theDate, "-")
            dateParts(0) = rawDateParts(0)
            dateParts(1) = rawDateParts(1)
            dateParts(2) = rawDateParts(2)
        Case "yyyy-mm-dd"
            rawDateParts = Split(theDate, "-")
            dateParts(0) = rawDateParts(2)
            dateParts(1) = rawDateParts(1)
            dateParts(2) = rawDateParts(0)
        Case "d Mon yyyy"
            rawDateParts = Split(theDate, " ")
            If CInt(rawDateParts(0)) < 10 Then
                dateParts(0) = "0" & rawDateParts(0)
            Else
                dateParts(0) = rawDateParts(0)
            End If
            dateParts(1) = numMonths.Item(rawDateParts(1))
            dateParts(2) = rawDateParts(2)
        Case "dd Mon yyyy"
            rawDateParts = Split(theDate, " ")
            dateParts(0) = rawDateParts(0)
            dateParts(1) = numMonths.Item(rawDateParts(1))
            dateParts(2) = rawDateParts(2)
        Case "dd/mm/yyyy hh:ii"
            rawDateParts = Split(theDate, " ")
            dateTimeParts = Split(rawDateParts(0), "/")
            dateParts(0) = dateTimeParts(0)
            dateParts(1) = dateTimeParts(1)
            dateParts(2) = dateTimeParts(2)
        Case "yyyy-mm-dd hh:ii"
            rawDateParts = Split(theDate, " ")
            dateTimeParts = Split(rawDateParts(0), "-")
            dateParts(0) = dateTimeParts(2)
            dateParts(1) = dateTimeParts(1)
            dateParts(2) = dateTimeParts(0)
        Case Else 'no input format, return date as it is
            fDate = theDate
            formatStringDate = fDate
    End Select

    'Check the output format
    Select Case outputFormat

        Case "dd/mm/yyyy"
            fDate = dateParts(0) & "/" & dateParts(1) & "/" & dateParts(2)
        Case "dd/mm"
            fDate = dateParts(0) & "/" & dateParts(1)
        Case "dd-mm-yyyy"
            fDate = dateParts(0) & "-" & dateParts(1) & "-" & dateParts(2)
        Case "yyyy-mm-dd"
            fDate = dateParts(2) & "-" & dateParts(1) & "-" & dateParts(0)
        Case "d Mon yyyy"
            fDate = CInt(dateParts(0)) & " " & shortMonths.Item(dateParts(1)) & " " & dateParts(2)
        Case "Mon d, yyyy"
            If Len(dateParts(2)) = 4 Then
                fDate = shortMonths.Item(dateParts(1)) & " " & CInt(dateParts(0)) & ", " & dateParts(2)
            Else
                fDate = shortMonths.Item(dateParts(1)) & " " & CInt(dateParts(0)) & ", 20" & dateParts(2)
            End If
        Case "Mon dd yyyy"
            If Len(dateParts(2)) = 4 Then
                fDate = shortMonths.Item(dateParts(1)) & " " & dateParts(0) & " " & dateParts(2)
            Else
                fDate = shortMonths.Item(dateParts(1)) & " " & dateParts(0) & " 20" & dateParts(2)
            End If
        Case "yyyy-mm-dd hh:ii"
            fDate = dateParts(2) & "-" & dateParts(1) & "-" & dateParts(0) & " " & rawDateParts(1)
        Case "dd/mm/yyyy hh:ii"
            fDate = dateParts(0) & "/" & dateParts(1) & "/" & dateParts(2) & " " & rawDateParts(1)
        Case Else 'default
            fDate = dateParts(0) & "/" & dateParts(1) & "/" & dateParts(2)
    End Select

    formatStringDate = fDate

End Function

Function buildNumericList(ByVal fieldName, ByVal className, ByVal startPos, ByVal endPos, ByVal selectedValue)

    Dim htmlBlock, i, label

    htmlBlock = ""
    htmlBlock = htmlBlock & "<select name=""" & fieldName & """ class=""" & className & """>" & vbCrLf

    For i = startPos To endPos

        If i = 0 Then
            label = "Select..."
        Else
            label = i
        End If

        If i = selectedValue Then
            htmlBlock = htmlBlock & "   <option value=""" & i & """ selected>" & label & "</option>" & vbCrLf
        Else
            htmlBlock = htmlBlock & "   <option value=""" & i & """>" & label & "</option>" & vbCrLf
        End If

    Next

    htmlBlock = htmlBlock & "</select>" & vbCrLf

    buildNumericList = htmlBlock

End Function

Function buildDateTimeList(ByVal startPos, ByVal endPos, ByVal includeLeadingZero, ByVal pivotStep, ByVal selectedValue)

    Dim htmlBlock, i, label

    htmlBlock = ""
    
    For i = startPos To endPos Step pivotStep

        If includeLeadingZero Then
			If CInt(i) < 10 Then
				label = "0" & i
				val = "0" & i
			Else
				label = i
				val = i
			End If
		Else
			label = i
			val = i
		End If
		
        If i = CInt(selectedValue) Then
            htmlBlock = htmlBlock & "   <option value=""" & val & """ selected>" & label & "</option>" & vbCrLf
        Else
            htmlBlock = htmlBlock & "   <option value=""" & val & """>" & label & "</option>" & vbCrLf
        End If

    Next

    buildDateTimeList = htmlBlock

End Function

Function getFullMonth(ByVal nMonth, ByVal langOpt)

    Dim fMonthName

    fMonthName = ""

    Set elFullMonths = Server.CreateObject("Scripting.Dictionary")
    Set enFullMonths = Server.CreateObject("Scripting.Dictionary")

    enFullMonths.Add "1", "JANUARY"
    enFullMonths.Add "2", "FEBRUARY"
    enFullMonths.Add "3", "MARCH"
    enFullMonths.Add "4", "APRIL"
    enFullMonths.Add "5", "MAY"
    enFullMonths.Add "6", "JUNE"
    enFullMonths.Add "7", "JULY"
    enFullMonths.Add "8", "AUGUST"
    enFullMonths.Add "9", "SEPTEMBER"
    enFullMonths.Add "10", "OCTOBER"
    enFullMonths.Add "11", "NOVEMBER"
    enFullMonths.Add "12", "DECEMBER"

    elFullMonths.Add "1", "ΙΑΝΟΥΑΡΙΟΣ"
    elFullMonths.Add "2", "ΦΕΒΡΟΥΑΡΙΟΣ"
    elFullMonths.Add "3", "ΜΑΡΤΙΟΣ"
    elFullMonths.Add "4", "ΑΠΡΙΛΙΟΣ"
    elFullMonths.Add "5", "ΜΑΙΟΣ"
    elFullMonths.Add "6", "ΙΟΥΝΙΟΣ"
    elFullMonths.Add "7", "ΙΟΥΛΙΟΣ"
    elFullMonths.Add "8", "ΑΥΓΟΥΣΤΟΣ"
    elFullMonths.Add "9", "ΣΕΠΤΕΜΒΡΙΟΣ"
    elFullMonths.Add "10", "ΟΚΤΩΒΡΙΟΣ"
    elFullMonths.Add "11", "ΝΟΕΜΒΡΙΟΣ"
    elFullMonths.Add "12", "ΔΕΚΕΜΒΡΙΟΣ"

    If langOpt = "el" Then
        fMonthName = elFullMonths.Item(nMonth)
    Else
        fMonthName = enFullMonths.Item(nMonth)
    End If

    getFullMonth = fMonthName

End Function

Public Function imageFileExists(ByVal fullImagePath)

    Dim fileIsThere
    Dim fso

    Set fso = Server.CreateObject("Scripting.FileSystemObject")
		
    If fso.FileExists(fullImagePath) Then 
        fileIsThere = True
    Else
        fileIsThere = False
    End If

    Set fso = Nothing

    debugCode = debugCode & "fileIsThere = " & fileIsThere & vbCrLf  

    imageFileExists = fileIsThere

End Function

Public Sub deleteImageFile(ByVal fileToDelete)

    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")

    'Check whether the image file exists		
    If fso.FileExists(gif2Check) Then 
        fso.DeleteFile(fileToDelete)
    End If
    
    Set fso = Nothing

End Sub

Function createFormFieldsAsHidden(excludeList)

    Dim fieldName, fieldValue, hiddenList 

    hiddenList = ""
    
    For Each fieldName in Request.Form

        If Not isExcluded(fieldName, excludeList) Then
    	    For Each fieldValue in Request.Form(fieldName)
		        hiddenList = hiddenList & "                    <input type=""hidden"" name=""" & fieldName & """ value=""" & fieldValue & """>" & vbCrLf
	        Next
        End If
    Next

    createFormFieldsAsHidden = hiddenList

End Function

Function isExcluded(fName, exList)

    Dim exFields, found, i, excludeIt
    found = "no"

    exFields = Split(exList, "#")

    For i = LBound(exFields) To UBound(exFields)

        If exFields(i) = fName Then
            found = "yes"
            Exit For
        End If 

    Next

    If found = "yes" Then
        excludeIt = True
    Else
        excludeIt = False
    End If

    isExcluded = excludeIt

End Function

Public Function getFileSizeInKB(ByVal fileName)

    Dim fs, f, fSize
    Set fs=Server.CreateObject("Scripting.FileSystemObject")
    Set f=fs.GetFile(Server.MapPath(fileName))
    fSize = f.Size
    fSize = fSize / 1024
    Set f=nothing
    Set fs=nothing

    getFileSizeInKB = FormatNumber(fSize, 0)

End Function

Function formatDateStringForXLS(ByVal sVal)
        
	Dim fVal, aVal
	aVal = Split(sVal, "/")

    fVal = fVal & aVal(2) & "-"

    fVal = fVal & aVal(1) & "-"
    fVal = fVal & aVal(0)
    fVal = fVal & "T00:00:00.000"
    
    formatDateStringForXLS = fVal

End Function

Public Function validateStringEntry(ByVal stringExp, ByVal allowedChars)

    Dim isValid

    isValid = True

    If Len(stringExp) > 0 Then
        For i = 1 To Len(stringExp)
            debugCode = debugCode & "Char 2 check is [" & Mid(stringExp, i, 1) & "] and found in pos " & InStr(1, allowedChars, Mid(stringExp, i, 1), 1) & vbCrLf
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

Function isFloat(sNumber)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\d\,]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sNumber)

    ' Execute the search test.
    If Not regEx.Test(sNumber) Then
        isValid = False
    End If

    Set regEx = Nothing

    isFloat = isValid

End Function 

Function isValidMoney(sNumber)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\d\,\.]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sNumber)

    ' Execute the search test.
    If Not regEx.Test(sNumber) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidMoney = isValid

End Function

Function isInteger(sNumber)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\d]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sNumber)

    ' Execute the search test.
    If Not regEx.Test(sNumber) Then
        isValid = False
    End If

    Set regEx = Nothing

    isInteger = isValid

End Function 

Function isValidPhone(sNumber)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\d\s]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sNumber)

    ' Execute the search test.
    If Not regEx.Test(sNumber) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidPhone = isValid

End Function 

Function isValidURL(sURL)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    regEx.Pattern = "^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$"

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sURL)

    ' Execute the search test.
    If Not regEx.Test(sURL) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidURL = isValid

End Function

Function isValidRelativeURL(sURL)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    regEx.Pattern = "^([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])$"

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(sURL)

    ' Execute the search test.
    If Not regEx.Test(sURL) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidRelativeURL = isValid

End Function


Function isValidImageFormat(imgExt)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^gif|jpg|bmp|png$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(imgExt)

    ' Execute the search test.
    If Not regEx.Test(imgExt) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidImageFormat = isValid

End Function 

Function isPDF(fileExt)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^pdf$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(fileExt)

    ' Execute the search test.
    If Not regEx.Test(fileExt) Then
        isValid = False
    End If

    Set regEx = Nothing

    isPDF = isValid

End Function 

Function isValidDocumentFormat(fileExt)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^doc|pdf|txt|xls|csv|ppt|pps$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Set case sensitivity.
    retVal = regEx.Test(fileExt)

    ' Execute the search test.
    If Not regEx.Test(fileExt) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidDocumentFormat = isValid

End Function 



Function isValidIPAddress(ipaddr)

    Dim isValid, ipParts
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Execute the search test.
    If Not regEx.Test(ipaddr) Then
        isValid = False
    Else

        ipParts = Split(ipaddr, ".")

        If CInt(ipParts(0)) = 0 Then
            isValid = False
        Else
            For i = LBound(ipParts) To UBound(ipParts)
                If CInt(ipParts(i)) > 255 Then
                    isValid = False
                    Exit For
                End If
            Next
        End If

    End If

    Set regEx = Nothing

    isValidIPAddress = isValid

End Function

Function isValidPhone2(phonenum)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[\d\s\/-]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Execute the search test.
    If Not regEx.Test(phonenum) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidPhone2 = isValid

End Function

Function isValidPin(pinCode)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^\d\d\d\d+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Execute the search test.
    If Not regEx.Test(pinCode) Then
        isValid = False
    End If

    Set regEx = Nothing

    isValidPin = isValid

End Function

Function isLatin(str)

    Dim isValid
    Dim regEx, retVal
    Set regEx = New RegExp

    isValid = True

    ' Create regular expression:
    regEx.Pattern ="^[a-z\s\.-]+$" 

    ' Set pattern:
    regEx.IgnoreCase = true

    ' Execute the search test.
    If Not regEx.Test(str) Then
        isValid = False
    End If

    Set regEx = Nothing

    isLatin = isValid

End Function


Function buildNumberList(ByVal startVal, ByVal stopVal, ByVal pivot, ByVal defValue)

    Dim htmlBlock, selected

    htmlBlock = ""
    selected = "" 

    For i = startVal To stopVal Step pivot
        If i = CInt(defValue) Then
            selected = " selected"
        Else
            selected = ""
        End If

        htmlBlock = htmlBlock & "<option value=""" & i & """" & selected & ">" & i & "</option>" & vbCrLf
    Next

    buildNumberList = htmlBlock
End Function

Function buildMonthList(ByVal defValue)

    Dim htmlBlock, selected

    htmlBlock = ""
    selected = "" 

    For i = 1 To 12 Step 1
        If i = CInt(defValue) Then
            selected = " selected"
        Else
            selected = ""
        End If

        htmlBlock = htmlBlock & "<option value=""" & i & """" & selected & ">" & getFullMonth(CStr(i), "el") & "</option>" & vbCrLf
    Next

    buildMonthList = htmlBlock
End Function


Function emailFormData(ByVal sender, ByVal replyto, ByVal recipient, ByVal mailSubject, ByVal templateURL, ByVal templateData)

    'debugCode = debugCode & "URL: " & templateURL & vbCrLf

    Dim Mailer, xml
    Dim mailBody
	Dim sendResult(3)
	Dim secAPI

	Set secAPI = New securityAPI
	
    If replyto = "" Then
        replyto = sender
    End If

    Set xml = Server.CreateObject("MSXML2.ServerXMLHTTP")
    
    'Parse the template page
    'Trap any errors
	'Clear the error message queee
	Err.Clear 
	On error resume next
	
    xml.Open "GET", templateURL, False
    xml.Send
    mailBody = xml.ResponseText
    
    'debugCode = debugCode & "Mail Body: " & vbCrLf & mailBody & vbCrLf

    If Len(Err.Description) <> 0 Then
        sendResult(0) = "ERROR"
		sendResult(1) = "Unable to parse email template: " & templateURL & vbCrLf
		'sendResult(2) = sender
		'sendResult(3) = recipient
        emailFormData = sendResult
    End If

    For Each k In templateData.Keys
        mailBody = Replace(mailBody, "[" & k & "]", templateData.Item(k))
    Next

    'debugCode = debugCode & Len(mailBody) & vbCrLf

    'debugCode = debugCode & "To: " & ToAddr & vbCrLf
    'debugCode = debugCode & "From: " & fromAddr & vbCrLf
    'debugCode = debugCode & "ReplyTo: " & replyAddr & vbCrLf
    'debugCode = debugCode & "Subject: " & mailSubject & vbCrLf
    'debugCode = debugCode & "Mail Body: " & vbCrLf & mailBody & vbCrLf

    'Send the mail
    Set Mailer = Server.CreateObject("CDO.Message")
    
    'Construct the mail message
	Mailer.BodyPart.Charset = "utf-8"
    Mailer.To = recipient
    Mailer.From = sender
    Mailer.ReplyTo = replyto 
    Mailer.Subject = mailSubject
    Mailer.HTMLBody = mailBody
	Mailer.HTMLBodyPart.Charset = "utf-8"
	

    Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
    Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = SMTPServer
    Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
	Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = SMTPPort
    
	'If SMTP authentication is required
	If UseSMTPAuthentication Then
	
		Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic
		
		If Instr(1, sender, "noreply", 0) = 0 Then
			Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = secAPI.decryptData(SMTPUser1)
		Else
			Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = secAPI.decryptData(SMTPUser2)
		End If
		
		Mailer.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = secAPI.decryptData(SMTPPass)
	
	End If
	
	Mailer.Configuration.Fields.Update

	'Clear the error message queee
	Err.Clear 
	
	On error resume next
    Mailer.Send
    
    If Len(Err.Description) <> 0 Then
		sendResult(0) = "ERROR"
		sendResult(1) = Err.Description
		'sendResult(2) = sender
		'sendResult(3) = recipient
    Else
        sendResult(0) = "OK"
		sendResult(1) = ""
		'sendResult(2) = sender
		'sendResult(3) = recipient
    End If

    Set Mailer = Nothing
    Set xml = Nothing
	Set secAPI = Nothing
	
    emailFormData = sendResult

End Function

Function createImageThumbnail(ByVal originalFile, ByVal thumbnailFile, ByVal outputFormat, ByVal thumbWidth, ByVal thumbHeight, ByVal compressionLevel)

    Dim objXML, scriptURL, execCode, execStatus, execStatusText
    Dim created

    Set objXML = Server.CreateObject("MSXML2.ServerXMLHTTP")
    
    scriptURL = "http://" & Request.ServerVariables("SERVER_NAME") & resizeScript & "?image=" & originalFile & "&thumb=" & thumbnailFile & "&width=" & thumbWidth & "&height=" & thumbHeight & "&compression=" & compressionLevel

    debugCode = debugCode & "Script url: " & scriptURL & vbCrLf 

    On error resume next
    objXML.Open "GET", scriptURL, False
    objXML.Send
    execCode = objXML.responseText
    execStatus = objXML.status
    execStatusText = objXML.statusText
    On error goto 0

    If Err <> 0 Then
        debugCode = debugCode & "Unable to execute thumbnail creator." & vbCrLf
        debugCode = debugCode & "Reason: " & Err.Description & vbCrLf
        created = False
    Else

        Select Case execCode

            Case "0"
                created = True
                debugCode = debugCode & "Thumbnail " & thumbnailFile & " was created successfully." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case "100"
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: The original image file path is missing." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case "101"
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: The thumbnail image file path is missing." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case "102"
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: Invalid image dimensions." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case "103"
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: The original image file does not exist." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case "104"
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: Unable to load the original image file." & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf
            Case Else
                created = False 
                debugCode = debugCode & "Unable to create thumbnail " & thumbnailFile &  "." & vbCrLf
                debugCode = debugCode & "Reason: " & execCode & vbCrLf
                debugCode = debugCode & "Status: " & execStatus & vbCrLf
                debugCode = debugCode & "Status Text: " & execStatusText & vbCrLf

        End Select

    End If

    Set objXML=Nothing

    createImageThumbnail = created

End Function

Function removeHTML(ByRef strText )
	Dim RegEx

	Set RegEx = New RegExp

	RegEx.Pattern = "<[^>]*>"
	RegEx.Global = True

	removeHTML = RegEx.Replace(strText, "")
End Function


%>
