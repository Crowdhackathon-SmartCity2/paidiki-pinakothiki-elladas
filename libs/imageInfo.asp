<%
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                             :::
':::  This function gets a string specifying what information    :::
':::  is required for a given URL                                :::
':::                                                             :::
':::  Passed:                                                    :::
':::       imgDataType => "size", "width" or "height"            :::
':::       strURL      => Full url to the image file             :::
':::  Returns:                                                   :::
':::       Required information (int) or -1 if something went    :::
':::       wrong                                                 :::
':::                                                             :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Function AnalyzeImageURL(imgDataType, strURL)
	Dim objXmlHTTP, strBinaryData, whatToReturn
	Dim strAsciiData, iImageWidth, iImageHeight
	Dim strColors, strType
	If (Not(BeginsWith(strURL, "http://"))) And (Not(BeginsWith(strURL, "https://"))) Then
		debugCode = debugCode & "Invalid URL! please provide full URL" & vbCrLf
        whatToReturn = -1
	End If
	Set objXmlHTTP = Server.CreateObject("Microsoft.XMLHTTP")
	On Error Resume Next
		objXmlHTTP.Open "GET", strURL, False
		objXmlHTTP.Send
		If Err.Number<>0 Then
			debugCode = debugCode & "URL does not exist or can't load the page" & vbCrLf
 			Set objXmlHTTP=Nothing
 			whatToReturn = -1
 		 End If
	On Error Goto 0
	strBinaryData = objXmlHTTP.ResponseBody
	Set objXmlHTTP=Nothing
	strAsciiData = RSBinaryToString(strBinaryData)
	If gfxSpex(strAsciiData, iImageWidth, iImageHeight, strColors, strType) = True Then
        If imgDataType = "size" Then
		    whatToReturn = LenB(strBinaryData)
        ElseIf imgDataType = "width" Then
		    whatToReturn = iImageWidth
        ElseIf  imgDataType = "height" Then
		    whatToReturn = iImageHeight
        Else
            whatToReturn = -1
        End If
	Else  
		whatToReturn = -1
	End If

    AnalyzeImageURL = whatToReturn
End Function

Function BeginsWith(strMain, strSub)
	BeginsWith = LCase(Left(strMain, Len(strSub)))=LCase(strSub)
End Function

Function RSBinaryToString(xBinary)
	'Antonin Foller, http://www.motobit.com
	'RSBinaryToString converts binary data (VT_UI1 | VT_ARRAY Or MultiByte string)
	'to a string (BSTR) using ADO recordset
	
	Dim Binary
	Dim RS, LBinary
	Const adLongVarChar = 201
	
	'MultiByte data must be converted To VT_UI1 | VT_ARRAY first.
	If vartype(xBinary)=8 Then Binary = MultiByteToBinary(xBinary) Else Binary = xBinary
		Set RS = CreateObject("ADODB.Recordset")
		LBinary = LenB(Binary)
		
		If LBinary>0 Then
			RS.Fields.Append "mBinary", adLongVarChar, LBinary
			RS.Open
			RS.AddNew
			RS("mBinary").AppendChunk Binary 
			RS.Update
			RSBinaryToString = RS("mBinary")
		Else  
			RSBinaryToString = ""
	End If
End Function

Function MultiByteToBinary(MultiByte)
	'© 2000 Antonin Foller, http://www.motobit.com
	' MultiByteToBinary converts multibyte string To real binary data (VT_UI1 | VT_ARRAY)
	' Using recordset
	Dim RS, LMultiByte, Binary
	Const adLongVarBinary = 205
	Set RS = CreateObject("ADODB.Recordset")
	LMultiByte = LenB(MultiByte)
	If LMultiByte>0 Then
		RS.Fields.Append "mBinary", adLongVarBinary, LMultiByte
		RS.Open
		RS.AddNew
		RS("mBinary").AppendChunk MultiByte & ChrB(0)
		RS.Update
		Binary = RS("mBinary").GetChunk(LMultiByte)
	End If
	MultiByteToBinary = Binary
End Function

':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                             :::
':::  This routine will attempt to identify any filespec passed  :::
':::  as a graphic file (regardless of the extension). This will :::
':::  work with BMP, GIF, JPG and PNG files.                     :::
':::                                                             :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::          Based on ideas presented by David Crowell          :::
':::                   (credit where due)                        :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                             :::
':::  This function gets a specified number of bytes from any    :::
':::  file, starting at the offset (base 1)                      :::
':::                                                             :::
':::  Passed:                                                    :::
':::       flnm        => Filespec of file to read               :::
':::       offset      => Offset at which to start reading       :::
':::       bytes       => How many bytes to read                 :::
':::                                                             :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Private Function GetBytes(flnm, offset, bytes)
	Dim startPos
	If offset=0 Then
		startPos = 1
	Else  
		startPos = offset
	End If
	if bytes = -1 then		' Get All!
		GetBytes = flnm
	else
		GetBytes = Mid(flnm, startPos, bytes)
	end if
End Function

':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                             :::
':::  Functions to convert two bytes to a numeric value (long)   :::
':::  (both little-endian and big-endian)                        :::
':::                                                             :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Private Function lngConvert(strTemp)
	lngConvert = clng(asc(left(strTemp, 1)) + ((asc(right(strTemp, 1)) * 256)))
end function

Private Function lngConvert2(strTemp)
	lngConvert2 = clng(asc(right(strTemp, 1)) + ((asc(left(strTemp, 1)) * 256)))
end function

':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
':::                                                             :::
':::  This function does most of the real work. It will attempt  :::
':::  to read any file, regardless of the extension, and will    :::
':::  identify if it is a graphical image.                       :::
':::                                                             :::
':::  Passed:                                                    :::
':::       flnm        => Filespec of file to read               :::
':::       width       => width of image                         :::
':::       height      => height of image                        :::
':::       depth       => color depth (in number of colors)      :::
':::       strImageType=> type of image (e.g. GIF, BMP, etc.)    :::
':::                                                             :::
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
function gfxSpex(flnm, width, height, depth, strImageType)
	dim strPNG 
	dim strGIF
	dim strBMP
	dim strType
	dim strBuff
	dim lngSize
	dim flgFound
	dim strTarget
	dim lngPos
	dim ExitLoop
	dim lngMarkerSize
	
	strType = ""
	strImageType = "(unknown)"
	
	gfxSpex = False
	
	strPNG = chr(137) & chr(80) & chr(78)
	strGIF = "GIF"
	strBMP = chr(66) & chr(77)
	
	strType = GetBytes(flnm, 0, 3)
	
	if strType = strGIF then				' is GIF
		strImageType = "GIF"
		Width = lngConvert(GetBytes(flnm, 7, 2))
		Height = lngConvert(GetBytes(flnm, 9, 2))
		Depth = 2 ^ ((asc(GetBytes(flnm, 11, 1)) and 7) + 1)
		gfxSpex = True
	elseif left(strType, 2) = strBMP then		' is BMP
		strImageType = "BMP"
		Width = lngConvert(GetBytes(flnm, 19, 2))
		Height = lngConvert(GetBytes(flnm, 23, 2))
		Depth = 2 ^ (asc(GetBytes(flnm, 29, 1)))
		gfxSpex = True
	elseif strType = strPNG then			' Is PNG
		strImageType = "PNG"
		Width = lngConvert2(GetBytes(flnm, 19, 2))
		Height = lngConvert2(GetBytes(flnm, 23, 2))
		Depth = getBytes(flnm, 25, 2)
		select case asc(right(Depth,1))
			case 0
				Depth = 2 ^ (asc(left(Depth, 1)))
				gfxSpex = True
			case 2
				Depth = 2 ^ (asc(left(Depth, 1)) * 3)
				gfxSpex = True
			case 3
				Depth = 2 ^ (asc(left(Depth, 1)))  '8
				gfxSpex = True
			case 4
				Depth = 2 ^ (asc(left(Depth, 1)) * 2)
				gfxSpex = True
			case 6
				Depth = 2 ^ (asc(left(Depth, 1)) * 4)
				gfxSpex = True
			case else
				Depth = -1
		end select
	else
		strBuff = GetBytes(flnm, 0, -1)		' Get all bytes from file
		lngSize = len(strBuff)
		flgFound = 0
		
		strTarget = chr(255) & chr(216) & chr(255)
		flgFound = instr(strBuff, strTarget)
		
		if flgFound = 0 then
			exit function
		end if
		
		strImageType = "JPG"
		lngPos = flgFound + 2
		ExitLoop = false
		
		do while ExitLoop = False and lngPos < lngSize
			do while asc(mid(strBuff, lngPos, 1)) = 255 and lngPos < lngSize
				lngPos = lngPos + 1
			loop
			
			if asc(mid(strBuff, lngPos, 1)) < 192 or asc(mid(strBuff, lngPos, 1)) > 195 then
				lngMarkerSize = lngConvert2(mid(strBuff, lngPos + 1, 2))
				lngPos = lngPos + lngMarkerSize  + 1
			else
				ExitLoop = True
			end if
		loop
		
		if ExitLoop = False then
			Width = -1
			Height = -1
			Depth = -1
		else
			Height = lngConvert2(mid(strBuff, lngPos + 4, 2))
			Width = lngConvert2(mid(strBuff, lngPos + 6, 2))
			Depth = 2 ^ (asc(mid(strBuff, lngPos + 8, 1)) * 8)
			gfxSpex = True
		end if
	end if
End Function
%>
