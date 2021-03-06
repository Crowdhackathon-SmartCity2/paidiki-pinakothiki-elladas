<%

Class securityAPI

	Private ProductName
    Private ProductVersion
    Private CopyrightInfo
	Private EncryptionChars
	
	Private Sub Class_Initialize()
        ProductName = "Ipetridis Security API"
        ProductVersion = "1.0"
        CopyrightInfo = "Copyright (c) " & Year(Now) & " - Ioannis Petridis (ipetridis@gmail.com). All rights reserved."
		EncryptionChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    End Sub
	
	Private Sub Class_Terminate()
        EncryptionChars = ""
    End Sub
	
	' Functions for encoding string to Base64
	Public Function encryptData( ByVal strIn )
		Dim c1, c2, c3, w1, w2, w3, w4, n, strOut
		For n = 1 To Len( strIn ) Step 3
			c1 = Asc( Mid( strIn, n, 1 ) )
			c2 = Asc( Mid( strIn, n + 1, 1 ) + Chr(0) )
			c3 = Asc( Mid( strIn, n + 2, 1 ) + Chr(0) )
			w1 = Int( c1 / 4 ) : w2 = ( c1 And 3 ) * 16 + Int( c2 / 16 )
			If Len( strIn ) >= n + 1 Then 
				w3 = ( c2 And 15 ) * 4 + Int( c3 / 64 ) 
			Else 
				w3 = -1
			End If
			If Len( strIn ) >= n + 2 Then 
				w4 = c3 And 63 
			Else 
				w4 = -1
			End If
			strOut = strOut + MimeEncode( w1 ) + MimeEncode( w2 ) + _
					  MimeEncode( w3 ) + MimeEncode( w4 )
		Next
		EncryptData = strOut
	End Function

	Private Function MimeEncode( byVal intIn )
		If intIn >= 0 Then 
			MimeEncode = Mid( EncryptionChars, intIn + 1, 1 ) 
		Else 
			MimeEncode = ""
		End If
	End Function	


	' Function to decode string from Base64
	Public Function decryptData( byVal strIn )
		Dim w1, w2, w3, w4, n, strOut
		For n = 1 To Len( strIn ) Step 4
			w1 = MimeDecode( Mid( strIn, n, 1 ) )
			w2 = MimeDecode( Mid( strIn, n + 1, 1 ) )
			w3 = MimeDecode( Mid( strIn, n + 2, 1 ) )
			w4 = MimeDecode( Mid( strIn, n + 3, 1 ) )
			If w2 >= 0 Then _
				strOut = strOut + _
					Chr( ( ( w1 * 4 + Int( w2 / 16 ) ) And 255 ) )
			If w3 >= 0 Then _
				strOut = strOut + _
					Chr( ( ( w2 * 16 + Int( w3 / 4 ) ) And 255 ) )
			If w4 >= 0 Then _
				strOut = strOut + _
					Chr( ( ( w3 * 64 + w4 ) And 255 ) )
		Next
		DecryptData = strOut
	End Function

	Private Function MimeDecode( byVal strIn )
		If Len( strIn ) = 0 Then 
			MimeDecode = -1 : Exit Function
		Else
			MimeDecode = InStr( EncryptionChars, strIn ) - 1
		End If
	End Function
	
End Class

%>