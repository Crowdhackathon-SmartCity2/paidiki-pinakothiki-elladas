<%

'-----------------------------------------------------------------
'   Application : ΑΣΕΠΣ Website
'   Version     : 1.0
'   File        : coreLibs.asp
'   Usage       : Core Application Library Functions
'   Copyright   : (c)2015 Ioannis Petridis <ipetridis@gmail.com> All rights reserved.
'-----------------------------------------------------------------

Function buildGeographicalLocationList(ByVal cnxObj, ByRef dbAPI, ByVal selectedVal)

    Dim rs, stm, listCode

    listCode = ""

    stm = "SELECT GeoLocations FROM GeographicalLocations ORDER BY GeoLocations ASC"

    Set rs = Server.CreateObject("ADODB.Recordset")

    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Null)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
    Else

        While Not rs.EOF

            If rs("GeoLocations") = selectedVal Then 
                listCode = listCode & "                    <option value=""" & rs("GeoLocations") & """ selected>" & rs("GeoLocations") & "</option>" & vbCrLf
            Else
                listCode = listCode & "                    <option value=""" & rs("GeoLocations") & """>" & rs("GeoLocations") & "</option>" & vbCrLf
            End If 'Selected ID

            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    buildGeographicalLocationList = listCode

End Function 

Function buildArtWorkThemeList(ByVal cnxObj, ByRef dbAPI, ByVal selectedVal)

    Dim rs, stm, listCode

    listCode = ""

    stm = "SELECT ArtWorkTheme FROM Themes ORDER BY ArtWorkTheme ASC"

    Set rs = Server.CreateObject("ADODB.Recordset")

    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Null)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
    Else

        While Not rs.EOF

            If rs("ArtWorkTheme") = selectedVal Then 
                listCode = listCode & "                    <option value=""" & rs("ArtWorkTheme") & """ selected>" & rs("ArtWorkTheme") & "</option>" & vbCrLf
            Else
                listCode = listCode & "                    <option value=""" & rs("ArtWorkTheme") & """>" & rs("ArtWorkTheme") & "</option>" & vbCrLf
            End If 'Selected ID

            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    buildArtWorkThemeList = listCode

End Function

Function buildPaintingMediumList(ByVal cnxObj, ByRef dbAPI, ByVal selectedVal)

    Dim rs, stm, listCode

    listCode = ""

    stm = "SELECT PaintingMedium FROM PaintingMediums ORDER BY PaintingMedium ASC"

    Set rs = Server.CreateObject("ADODB.Recordset")

    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Null)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
    Else

        While Not rs.EOF

            If rs("PaintingMedium") = selectedVal Then 
                listCode = listCode & "                    <option value=""" & rs("PaintingMedium") & """ selected>" & rs("PaintingMedium") & "</option>" & vbCrLf
            Else
                listCode = listCode & "                    <option value=""" & rs("PaintingMedium") & """>" & rs("PaintingMedium") & "</option>" & vbCrLf
            End If 'Selected ID

            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    buildPaintingMediumList = listCode

End Function

''''''''''''''''''''''''''''''''''''''''''''''''





%>
