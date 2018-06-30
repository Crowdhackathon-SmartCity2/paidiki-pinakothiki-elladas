<!--#include virtual="/libs/config.asp"-->
<!--#include virtual="/libs/commonLibs.asp"-->
<!--#include virtual="/libs/coreLibs.asp"-->
<!--#include virtual="/libs/databaseAPI.asp"-->
<%

	Response.Expires = -1
	Response.Buffer = False
	Response.Codepage = 65001 
	Response.Charset = "utf-8"

    Dim dbAPI, connObj, secObj
    Dim responseText
    Dim qParams() 
	
	Dim sqlStm
	Dim singleResultBody
	
	sqlStm = ""
	singleResultBody = ""
	
	Dim artistFullName, artWorkTheme, paintingMedium
	Dim creationYearF, creationYearT, artistAgeF, artistAgeTo
	Dim	geoLocation, resPerPage, currPage
	
	'Get Form data
	currPage = CInt(Request("currPage"))
	resPerPage = CInt(Request("resPerPage"))
	artistFullName = Request("artistFullName")
	artWorkTheme = Request("artWorkTheme")
	paintingMedium = Request("paintingMedium")
	creationYearF = CInt(Request("creationYearFrom"))
	creationYearT = CInt(Request("creationYearTo"))
	artistAgeF = CInt(Request("artistAgeFrom"))
	artistAgeT = CInt(Request("artistAgeTo"))
	geoLocation = Request("geoLocation")
	
	resultBody = ""
	resultPane = ""
	resultPaging = ""
	
    responseText = ""

    Set dbAPI = New databaseAPI
    Set connObj = Server.CreateObject("ADODB.Connection")
    Set secObj = Server.CreateObject("RTEL.WebSecurity")
	
    'Enable recordset for paging
    connObj.CursorLocation = adUseClient

    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.CacheSize = resPerPage

    'Lets start be opening the database connection
    Call dbAPI.openDatabaseConnection(connObj, secObj.decryptData(DBConnStr))

    If dbAPI.ErrorState = 1 Then

		resultBody = "Η ενεργεια δεν μπορει να ολοκληρωθει."
		resultPane = "Δεν βρεθηκαν αποτελεσματα"
		resultPaging = "<select id=""results-paging"" class=""form-control input-sm"" style=""display:inline;width:60px;""><option value=""1"">1</option></select>"
	
        If debugEnabled Then resultBody = resultBody & "<br><strong>" & dbAPI.ErrorMessage & "</strong>" & vbCrLf End If
        
    Else

		sqlStm = sqlStm & "SELECT ArtWorkTheme, "
		sqlStm = sqlStm & "CreationYear, " 
		sqlStm = sqlStm & "PaintingMedium, "
		sqlStm = sqlStm & "CAST(PaintingWidth AS NVARCHAR(4)) + ' x ' + CAST(PaintingHeight AS NVARCHAR(4)) AS ArtWorkDimensions, "
		sqlStm = sqlStm & "ArtWorkFullsizeURL, "
		sqlStm = sqlStm & "ArtWorkThumbnailURL, " 
		sqlStm = sqlStm & "ArtistFullName, "
		sqlStm = sqlStm & "ArtistBYearUponCreation, " 
		sqlStm = sqlStm & "PlaceOfResidence "
		sqlStm = sqlStm & "FROM ArtWork "
		sqlStm = sqlStm & "WHERE (ShowInCollection = 1) AND "
        
		If artistFullName <> "" Then
			sqlStm = sqlStm & "(ArtistFullName LIKE CHAR(37) + N'" & artistFullName & "' + CHAR(37)) AND "
		End If 
		
		If paintingMedium <> "" Then
			sqlStm = sqlStm & "(PaintingMedium = N'" & paintingMedium & "') AND "
		End If 
		
		If artWorkTheme <> "" Then
			sqlStm = sqlStm & "(ArtWorkTheme = N'" & artWorkTheme & "') AND "
		End If 
		
		If creationYearF <> 0 Then
			sqlStm = sqlStm & "(CreationYear >= " & creationYearF & ") AND "
		End If
		
		If creationYearT <> 0 Then
			sqlStm = sqlStm & "(CreationYear <= " & creationYearT & ") AND "
		End If
		
		If artistAgeF <> 0 Then
			sqlStm = sqlStm & "(ArtistBYearUponCreation >= " & artistAgeF & ") AND "
		End If
		
		If artistAgeF <> 0 Then
			sqlStm = sqlStm & "(ArtistBYearUponCreation <= " & artistAgeT & ") AND "
		End If
		
		If geoLocation <> "" Then
			sqlStm = sqlStm & "(PlaceOfResidence = N'" & geoLocation & "') AND "
		End If 
		
        Call dbAPI.executeSelectQuery(connObj, rs, sqlStm, adCmdText, qParams)
        

        If dbAPI.ErrorState = 1 Then

			resultBody = "Η ενεργεια δεν μπορει να ολοκληρωθει."
			resultPane = "Δεν βρεθηκαν αποτελεσματα"
			resultPaging = "<select id=""results-paging"" class=""form-control input-sm"" style=""display:inline;width:60px;""><option value=""1"">1</option></select>"
	
			If debugEnabled Then resultBody = resultBody & "<br><strong>" & dbAPI.ErrorMessage & "</strong>" & vbCrLf End If
        

        Else

            If rs.BOF And rs.EOF Then

                resultBody = "Η ενεργεια δεν μπορει να ολοκληρωθει."
				resultPane = "Δεν βρεθηκαν αποτελεσματα"
				resultPaging = "<select id=""results-paging"" class=""form-control input-sm"" style=""display:inline;width:60px;""><option value=""1"">1</option></select>"
	
				If debugEnabled Then resultBody = resultBody & "<br><strong>" & dbAPI.ErrorMessage & "</strong>" & vbCrLf End If
        
				
            Else

                rs.MoveFirst
                rs.PageSize = resPerPage
                results = rs.RecordCount
                pages = CInt(rs.PageCount)
                rs.AbsolutePage = page

                startPos = rs.AbsolutePosition
                endPos = rs.AbsolutePosition + rs.PageSize - 1

                'Lets build the header

                
                For recCounter = startPos To endPos

                    If recCounter Mod 2 = 0 Then
                        className = "evenRow"
                    Else
                        className = "oddRow"
                    End If

                    If rs("IsEnabled") = 1 Then
                        light = "Green"
                        eSwitch = "Disable"
                        lightAltText = "Λογαριασμός Ενεργός"
                        eSwitchAltText = "Απενεργοποίηση Λογαριασμού"
                        eSwitchAction = 0
                    Else
                        light = "Red"
                        eSwitch = "Enable"
                        lightAltText = "Λογαριασμός Ανενεργός"
                        eSwitchAltText = "Ενεργοποίηση Λογαριασμού"
                        eSwitchAction = 1
                    End If                    

                    responseText = responseText & "<tr class=""" & className & """>" & vbCrLf
                    responseText = responseText & "<td class=""dataLS"" width=""4%""><img src=""images/" & light & ".gif"" alt=""" & lightText & """ border=""0""></td>" & vbCrLf
                    responseText = responseText & "<td class=""dataL"" width=""32%"">" & rs("FullName") & "</td>" & vbCrLf
                    responseText = responseText & "<td class=""dataC"" width=""32%"">" & rs("UserName") & "</td>" & vbCrLf
                    responseText = responseText & "<td class=""dataL"" width=""32%"">" & vbCrLf

                
                    If results > 1 Then
                        responseText = responseText & "<a href=""editCPanelUser.asp?action=form&expandMenu=" & expandMenu & "&CPanelUserID=" & rs("CPanelUserID") & """><img style=""margin-left:75px;"" src=""images/Edit.gif"" title=""Ενημέρωση Στοιχείων"" alt=""Ενημέρωση Στοιχείων"" border=""0""></a>&nbsp;" & vbCrLf
                        responseText = responseText & "<a href=""editCPanelUser.asp?action=delete&expandMenu=" & expandMenu & "&CPanelUserID=" & rs("CPanelUserID") & "&UserName=" & rs("UserName") & """ onClick=""return confirmDeleteUser('" & rs("UserName") & "')""><img src=""images/Trash.gif"" title=""Οριστική Διαγραφή Χρήστη"" alt=""Οριστική Διαγραφή Χρήστη"" border=""0""></a>" & vbCrLf

                    Else
                        responseText = responseText & "<a href=""editCPanelUser.asp?action=form&expandMenu=" & expandMenu & "&CPanelUserID=" & rs("CPanelUserID") & """><img style=""margin-left:97px;"" src=""images/Edit.gif"" title=""Ενημέρωση Στοιχείων"" alt=""Ενημέρωση Στοιχείων"" border=""0""></a>&nbsp;" & vbCrLf

                    End If

                    responseText = responseText & "</td>" & vbCrLf
                    responseText = responseText & "</tr>" & vbCrLf


                    rs.MoveNext
                    If rs.EOF Then Exit For

                Next

                'Print the footer
                If results = 1 Then
                    rHeader = results & " χρήστης"
                Else
                    rHeader = results & " χρήστες"
                End If

                responseText = responseText & "<tr class=""headerRow"">" & vbCrLf
                responseText = responseText & "<td class=""dataLS"" colspan=""2"">" & rHeader & "</td>" & vbCrLf
                responseText = responseText & "<td class=""dataR"" colspan=""2"">" & vbCrLf

                If page > 1 Then
                    responseText = responseText & "<img src=""images/first.gif"" alt=""Αρχική Σελίδα"" title=""Αρχική Σελίδα"" border=""0"" onMouseOver=""this.style.cursor='pointer';"" onMouseOut=""this.style.cursor='default';"" onClick=""fetchCPanelUsers(1, " & expandMenu & ", document.getElementById('q').value, document.getElementById('qt').options[document.getElementById('qt').selectedIndex].value)"">&nbsp;" & vbCrLf
                Else
                    responseText = responseText & "<img src=""images/first.gif"" alt=""Αρχική Σελίδα"" title=""Αρχική Σελίδα"" border=""0"">&nbsp;" & vbCrLf                    
                End If

                If page > 1 Then
                    responseText = responseText & "<img src=""images/prev.gif"" alt=""Προηγούμενη Σελίδα"" title=""Προηγούμενη Σελίδα"" border=""0"" onMouseOver=""this.style.cursor='pointer';"" onMouseOut=""this.style.cursor='default';"" onClick=""fetchCPanelUsers(" & prevpage & ", " & expandMenu & ", document.getElementById('q').value, document.getElementById('qt').options[document.getElementById('qt').selectedIndex].value)"">&nbsp;" & vbCrLf
                Else
                    responseText = responseText & "<img src=""images/prev.gif"" alt=""Προηγούμενη Σελίδα"" title=""Προηγούμενη Σελίδα""  border=""0"">&nbsp;" & vbCrLf
                End If          

                responseText = responseText & "Σελίδα:&nbsp;<select id=""navPage"" name=""page"" class=""fListBox"" onChange=""document.getElementById('dynLoader').style.display = 'block';document.getElementById('dynContent').style.display = 'none';fetchCPanelUsers(document.getElementById('navPage').options[document.getElementById('navPage').selectedIndex].value, " & expandMenu & ", document.getElementById('q').value, document.getElementById('qt').options[document.getElementById('qt').selectedIndex].value)"">" & vbCrLf

                For i = 1 To pages
                    If i = page Then
                        selected = " selected"
                    Else
                        selected = ""
                    End If
                    responseText = responseText & "<option value=""" & i & """" & selected & ">" & i & "</option>" & vbCrLf
                Next

                responseText = responseText & "</select>&nbsp;" & vbCrLf

                If page < pages Then
                    responseText = responseText & "<img src=""images/next.gif"" alt=""Επόμενη Σελίδα"" title=""Επομενη Σελίδα"" border=""0"" onMouseOver=""this.style.cursor='pointer';"" onMouseOut=""this.style.cursor='default';"" onClick=""document.getElementById('dynLoader').style.display = 'block';document.getElementById('dynContent').style.display = 'none';fetchCPanelUsers(" & nextpage & ", " & expandMenu & ", document.getElementById('q').value, document.getElementById('qt').options[document.getElementById('qt').selectedIndex].value)"">&nbsp;" & vbCrLf
                Else
                    responseText = responseText & "<img src=""images/next.gif"" alt=""Επόμενη Σελίδα"" title=""Επομενη Σελίδα""border=""0"">&nbsp;" & vbCrLf
                End If

                If page < pages Then
                    responseText = responseText & "<img src=""images/last.gif"" alt=""Τελευταία Σελίδα"" title=""Τελευταία Σελίδα"" border=""0"" onMouseOver=""this.style.cursor='pointer';"" onMouseOut=""this.style.cursor='default';"" onClick=""document.getElementById('dynLoader').style.display = 'block';document.getElementById('dynContent').style.display = 'none';fetchCPanelUsers(" & pages & ", " & expandMenu & ", document.getElementById('q').value, document.getElementById('qt').options[document.getElementById('qt').selectedIndex].value)"">&nbsp;" & vbCrLf
                Else
                    responseText = responseText & "<img src=""images/last.gif"" alt=""Τελευταία Σελίδα"" title=""Τελευταία Σελίδα"" border=""0"">&nbsp;" & vbCrLf                    
                End If

                responseText = responseText & "</td>" & vbCrLf
                responseText = responseText & "</tr>" & vbCrLf
                responseText = responseText & "</table>" & vbCrLf

            End If

            Call dbAPI.closeRecordset(rs)

        End If

    End If

    Call dbAPI.closeDatabaseConnection(connObj)

    Set dbAPI = Nothing
    Set secObj = Nothing

	responseText = responseText & resultBody & "|-|"
	responseText = responseText & resultPane & "|-|"
	responseText = responseText & resultPaging
    
    Response.Write(responseText)