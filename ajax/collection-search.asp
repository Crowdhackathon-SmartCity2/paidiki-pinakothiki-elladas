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
	
	Dim artistFullName
	Dim artWorkTheme
	Dim paintingMedium
	Dim creationYearF
	Dim creationYearT
	Dim artistAgeF
	Dim artistAgeT
	Dim	geoLocation
	Dim currPage
	
	'Get Form data
	
	artistFullName = Request("artistFullName")
	artWorkTheme = Request("artWorkTheme")
	paintingMedium = Request("paintingMedium")
	creationYearF = CInt(Request("creationYearFrom"))
	creationYearT = CInt(Request("creationYearTo"))
	artistAgeF = CInt(Request("artistAgeFrom"))
	artistAgeT = CInt(Request("artistAgeTo"))
	geoLocation = Request("geoLocation")
	
	If Request("page") <> "" Then
        page = CInt(Request("page"))
    Else
        page = 1
    End If
	
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
		
		sqlStm = Left(sqlStm, Len(sqlStm) - 4)
		
        Call dbAPI.executeSelectQuery(connObj, rs, sqlStm, adCmdText, Null)
        

        If dbAPI.ErrorState = 1 Then

			resultBody = "Η ενεργεια δεν μπορει να ολοκληρωθει."
			resultPane = "Δεν βρεθηκαν αποτελεσματα"
			resultPaging = "<select id=""results-paging"" class=""form-control input-sm"" style=""display:inline;width:60px;""><option value=""1"">1</option></select>"
	
			If debugEnabled Then resultBody = resultBody & "<br><strong>" & dbAPI.ErrorMessage & "</strong>" & vbCrLf End If
        

        Else

            If rs.BOF And rs.EOF Then

                resultBody = "Δεν βρέθηκαν αποτελέσματα για τα κριτήρια που ορίσατε."
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

                For recCounter = startPos To endPos

                    resultBody = resultBody & "" & vbCrLf
					resultBody = resultBody & "<div style=""float:left;"" class=""col-md-3"">" & vbCrLf
					resultBody = resultBody & "<div class=""thumbnail"">" & vbCrLf
					resultBody = resultBody & "<a href=""" & rs("ArtWorkFullsizeURL") & """ data-toggle=""lightbox"" data-gallery=""collection"" data-title=""" & rs("ArtistFullName") & ", " & rs("PlaceOfResidence") & ", " & rs("ArtistBYearUponCreation") & " ΕΤΩΝ"" data-footer=""<address><strong>Θέμα: </strong>" & rs("ArtWorkTheme") & "<br /><strong>Μέσο: </strong>" & rs("PaintingMedium") & "<br /><strong>Διαστάσεις: </strong>" & rs("ArtWorkDimensions") & " cm</address>""><img src=""" & rs("ArtWorkThumbnailURL") & """></a>" & vbCrLf
					resultBody = resultBody & "</div>" & vbCrLf
					resultBody = resultBody & "</div>" & vbCrLf
					

                    rs.MoveNext
                    If rs.EOF Then Exit For

                Next

                'Print the footer
                If results = 1 Then
                    resultPane = resultPane & "Βρέθηκε " & results & " έργο."
                Else
                    resultPane = resultPane & "Βρέθηκαν " & results & " έργα."
                End If

                'Fix the paging
				resultPaging = resultPaging & "Σελίδα:&nbsp;" & vbCrLf
				resultPaging = resultPaging & "<select id=""results-paging"" name=""results-paging"" class=""form-control input-sm"" style=""display:inline;width:60px;"">" & vbCrLf
				resultPaging = resultPaging & buildNumberList(1, pages, 1, page)
				resultPaging = resultPaging & "</select>" & vbCrLf

            End If

            Call dbAPI.closeRecordset(rs)

        End If

    End If

    Call dbAPI.closeDatabaseConnection(connObj)

    Set dbAPI = Nothing
    Set secObj = Nothing

	responseText = responseText & resultBody & "==="
	responseText = responseText & resultPane & "==="
	responseText = responseText & resultPaging
    
    Response.Write(responseText)
	
%>