<%
Function buildOrgChartTree(ByVal cnxObj, ByRef dbAPI, ByVal expMenu)

    Dim stm, responseText, rs

    responseText = ""
    Set rs = Server.CreateObject("ADODB.Recordset")

    stm = "SELECT NodeID, NodeLabel, ParentNodeID FROM OrgChart ORDER BY ParentNodeID, DisplayOrder"

    Call dbAPI.executeSelectQuery(connObj, rs, stm, adCmdText, Null)
        
    If dbAPI.ErrorState = 1 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf        
    Else

        responseText = responseText & "<div class=""dtree"">" & vbCrLf
        responseText = responseText & "<script type=""text/javascript"">" & vbCrLf
        responseText = responseText & "<!--" & vbCrLf
        responseText = responseText & "d = new dTree('d');" & vbCrLf

        'Add root item
        responseText = responseText & "d.add(0,-1,'" & Replace(ClientCompany, "'", "\'") & "', 'javascript:document.getElementById(\'orgChartContent\').style.display=\'none\';document.getElementById(\'orgChartContentLoader\').style.display=\'inline\';fetchOrgChartItems(" & expMenu & ", \'list\', 0, 0, 0);');" & vbCrLf

        While Not rs.EOF

            nodeImg = "org-chart.png"
            nodeOpenImg = "org-chart.png"
            responseText = responseText & "d.add(" & rs("NodeID") & ", " & rs("ParentNodeID") & ", '" & Replace(rs("NodeLabel"), "'", "\'") & "', 'javascript:document.getElementById(\'orgChartContent\').style.display=\'none\';document.getElementById(\'orgChartContentLoader\').style.display=\'inline\';fetchOrgChartItems(" & expMenu & ", \'list\', 0, 0, " & rs("NodeID") & ");', '" & Replace(rs("NodeLabel"), "'", "\'") & "','','" & treeImageBase & "/" & nodeImg & "','" & treeImageBase & "/" & nodeOpenImg & "');" & vbCrLf
            

            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    responseText = responseText & "d.config.inOrder = true;" & vbCrLf
    responseText = responseText & "d.openAll();" & vbCrLf
	responseText = responseText & "document.write(d);" & vbCrLf
    responseText = responseText & "//-->" & vbCrLf
    responseText = responseText & "</script>" & vbCrLf
    responseText = responseText & "</div>" & vbCrLf

    buildSiteTree = responseText

End Function

Sub manageOrgChartNodeDisplayOrder(ByVal cnxObj, ByRef dbAPI, ByVal direction, ByVal nodeID, ByVal displayOrder)

    Dim stm, rs, savedOK, articleCategoryID
    Dim trans()

    'We need the page's parent item ID
    parentNodeID = fetchDataPiece(cnxObj, dbAPI, "SELECT ParentNodeID As dataPiece FROM OrgChart WHERE (NodeID  = ?)", Array(Array("@NodeID", adInteger, adParamInput, , CInt(nodeID))))

    If direction = "up" Then

        Set rs = Server.CreateObject("ADODB.Recordset")
        stm = "SELECT NodeID AS swapID FROM OrgChart WHERE (DisplayOrder = ?) AND (ParentNodeID = ?)"
        qDispOrder = CInt(displayOrder) - 1

        Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Array(Array("@DisplayOrder", adInteger, adParamInput, , qDispOrder), Array("@ParentNodeID", adInteger, adParamInput, , parentNodeID)))

        'rs.MoveFirst
        swapID = rs("swapID")
        Call dbAPI.closeRecordset(rs)

        'We will use a transaction to do the swap
        ReDim Preserve trans(1)

        trans(0) = Array("UPDATE OrgChart SET DisplayOrder = DisplayOrder - 1 WHERE (NodeID = ?)", adCmdText, Array(Array("@NodeID", adInteger, adParamInput, , nodeID)))
        trans(1) = Array("UPDATE OrgChart SET DisplayOrder = DisplayOrder + 1 WHERE (NodeID = ?)", adCmdText, Array(Array("@NodeID", adInteger, adParamInput, , swapID)))

        If dbAPI.ExecuteDatabaseTransaction(cnxObj, trans) = False Then
            debugCode = debugCode & dbAPI.ErrorMessage() & vbCrLf
            savedOK = False
        Else
            savedOK = True
        End If

    ElseIf direction = "down" Then

        Set rs = Server.CreateObject("ADODB.Recordset")
        stm = "SELECT NodeID AS swapID FROM OrgChart WHERE (DisplayOrder = ?) AND (ParentNodeID = ?)"
        qDispOrder = CInt(displayOrder) + 1

        Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Array(Array("@DisplayOrder", adInteger, adParamInput, , qDispOrder), Array("@ParentNodeID", adInteger, adParamInput, , parentNodeID)))

        'rs.MoveFirst
        swapID = rs("swapID")
        Call dbAPI.closeRecordset(rs)

        'We will use a transaction to do the swap
        ReDim Preserve trans(1)

        trans(0) = Array("UPDATE OrgChart SET DisplayOrder = DisplayOrder + 1 WHERE (NodeID = ?)", adCmdText, Array(Array("@NodeID", adInteger, adParamInput, , nodeID)))
        trans(1) = Array("UPDATE OrgChart SET DisplayOrder = DisplayOrder - 1 WHERE (NodeID = ?)", adCmdText, Array(Array("@NodeID", adInteger, adParamInput, , swapID)))

        If dbAPI.ExecuteDatabaseTransaction(cnxObj, trans) = False Then
            debugCode = debugCode & dbAPI.ErrorMessage() & vbCrLf
            savedOK = False
        Else
            savedOK = True
        End If

    End If
    
End Sub

Sub manageOrgChartNodePubStatus(ByVal cnxObj, ByRef dbAPI, ByVal nodeID)

    Dim stm, savedOK, currentPubStatus
    Dim tranStm()
    Dim trIndex
    Dim desNodeIDList
    Dim desNodeIDs

    trIndex = 0
    desNodeIDList = ""

    'We need the node's current pub status
    currentPubStatus = fetchDataPiece(cnxObj, dbAPI, "SELECT CAST (Published AS INT) As dataPiece FROM OrgChart WHERE (NodeID = ?)", Array(Array("@NodeID", adInteger, adParamInput, , CInt(nodeID))))

    If currentPubStatus = 1 Then
        newPubStatus = 0
    Else
        newPubStatus = 1
    End If

    'Handle the case where this item has children
    'If a request to unpublish it is due
    'We need to unpublish all descendant items
    'If we are publishing then only the current item is published

    ReDim Preserve tranStm(trIndex)

    If newPubStatus = 0 Then

        If hasChildNodes(cnxObj, dbAPI, CInt(nodeID)) Then

            tranStm(trIndex) = Array("UPDATE OrgChart SET Published = ? WHERE (NodeID = ?)", adCmdText, Array(Array("@Published" & trIndex, adBoolean, adParamInput, , newPubStatus), Array("@NodeID" & trIndex, adInteger, adParamInput, , CInt(nodeID))))
        
            Call getNodeDescendantList(cnxObj, dbAPI, desNodeIDList, CInt(nodeID))

            If Len(desNodeIDList) > 2 Then
                desNodeIDList = Left(desNodeIDList, Len(desNodeIDList) - 2)
            End If

            desNodeIDs = Split(desNodeIDList, ", ")

            'debugCode = debugCode & desNodeIDList & vbCrLf      

            For i = LBound(desNodeIDs) To UBound(desNodeIDs)
                trIndex = trIndex + 1
                ReDim Preserve tranStm(trIndex)
                tranStm(trIndex) = Array("UPDATE OrgChart SET Published = ? WHERE (NodeID = ?)", adCmdText, Array(Array("@Published" & trIndex, adBoolean, adParamInput, , newPubStatus), Array("@NodeID" & trIndex, adInteger, adParamInput, , CInt(desNodeIDs(i)))))
            Next

        Else

            tranStm(trIndex) = Array("UPDATE OrgChart SET Published = ? WHERE (NodeID = ?)", adCmdText, Array(Array("@Published", adBoolean, adParamInput, , newPubStatus), Array("@NodeID", adInteger, adParamInput, , CInt(nodeID))))
        
        End If

    Else

        tranStm(trIndex) = Array("UPDATE OrgChart SET Published = ? WHERE (NodeID = ?)", adCmdText, Array(Array("@Published", adBoolean, adParamInput, , newPubStatus), Array("@NodeID", adInteger, adParamInput, , CInt(nodeID))))

    End If
    
    If dbAPI.ExecuteDatabaseTransaction(cnxObj, tranStm) = False Then
        debugCode = debugCode & dbAPI.ErrorMessage() & vbCrLf
        debugCode = debugCode & "DEBUG = " & dbAPI.DebugMessage & vbCrLf
    Else
        debugCode = debugCode & "DEBUG = " & dbAPI.DebugMessage & vbCrLf
    End If
    
End Sub


Function getNextAvailableNodeDisplayOrder(ByVal cnxObj, ByRef dbAPI, ByVal pNodeID)

    Dim rs, stm, newOrder
    Dim qParams()
    newOrder = -1

    Set rs = Server.CreateObject("ADODB.Recordset")

        stm = "SELECT ISNULL(MAX(DisplayOrder) + 1, 1) As NextDisplayOrder FROM OrgChart WHERE (ParentNodeID = ?)"

        ReDim Preserve qParams(0)

        qParams(0) = Array("@ParentItemID", adInteger, adParamInput, , pNodeID)

        Call dbAPI.executeSelectQuery(connObj, rs, stm, adCmdText, qParams)

        If dbAPI.ErrorState = 1 Then
            debugCode = debugCode & dbAPI.ErrorMessage() & vbCrLf
            newOrder = -1
        Else
            newOrder = rs("NextDisplayOrder")
        End If


    dbAPI.closeRecordset(rs)

    getNextAvailableNodeDisplayOrder = newOrder

End Function

Function fetchChildNodesTotal(ByVal cnxObj, ByRef dbAPI, ByVal pNodeID)

    Dim stm, rs, childTotal
    Dim qParams(0)

    articleTotal = 0
    Set rs = Server.CreateObject("ADODB.Recordset")

    stm = "SELECT COUNT(NodeID) AS ChildTotal FROM OrgChart WHERE (ParentNodeID = ?)"

    qParams(0) = Array("@ParentItemID", adInteger, adParamInput, , pNodeID)

    Call dbAPI.executeSelectQuery(connObj, rs, stm, adCmdText, qParams) 

    If dbAPI.ErrorState = 1 Then
        ebugCode = debugCode & dbAPI.ErrorMessage() & vbCrLf
        childTotal = -1
    Else
        childTotal = rs("ChildTotal")
    End If

    Call dbAPI.closeRecordset(rs)

    fetchChildNodesTotal = childTotal

End Function

Sub getNodeLevel(ByVal cnxObj, ByRef dbAPI, ByRef levelCounter, ByVal nodeID)

    Dim parentNodeID
    parentNodeID = getParentNodeID(cnxObj, dbAPI, nodeID)

    If parentNodeID <> 0 Then
        levelCounter = levelCounter + 1
        Call getNodeLevel(cnxObj, dbAPI, levelCounter, parentNodeID) 
    End If

End Sub

Function getParentNodeID(ByVal cnxObj, ByRef dbAPI, ByVal nodeID)

    Dim parentItemID

    parentItemID = 0
    parentItemID = fetchDataPiece(cnxObj, dbAPI, "SELECT NodeID As dataPiece FROM OrgChart WHERE (NodeID  = ?)", Array(Array("@NodeID", adInteger, adParamInput, , CInt(nodeID))))

    getParentNodeID = parentItemID

End Function

Public Function hasChildNodes(ByVal cnxObj, ByRef dbAPI, ByVal parNodeID)

    Dim hasChilden

    If fetchChildNodesTotal(cnxObj, dbAPI, parNodeID) > 0 Then
        hasChilden = True
    Else
        hasChilden = False
    End If

    hasChildNodes = hasChilden

End Function

Sub getNodeDescendantList(ByVal cnxObj, ByRef dbAPI, ByRef idList, ByVal rootNodeID)

    Dim stm
    Dim rs
    Dim qParams(0)

    Set rs = Server.CreateObject("ADODB.Recordset")
    stm = "SELECT NodeID FROM OrgChart WHERE (ParentNodeID = ?)"

    qParams(0) = Array("@ParentItemID", adInteger, adParamInput, , CInt(rootNodeID))
       
    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, qParams)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
        Exit Sub
    Else

        If rs.EOF Then
            Exit Sub
        Else

            While Not rs.EOF
                idList = idList & rs("NodeID") & ", "

                If hasChildNodes(cnxObj, dbAPI, rs("NodeID")) Then
                    Call getItemDescendantList(cnxObj, dbAPI, idList, rs("NodeID"))
                End If

                rs.MoveNext
            WEnd

        End If

    End If

    Call dbAPI.closeRecordset(rs)

End Sub

Sub buildNodeAttachSelectList(ByVal cnxObj, ByRef dbAPI, ByRef listCode, ByVal rootNodeID, ByVal selectedID)

    Dim stm, indentString, nodeDepth
    Dim rs
    Dim qParams(0)

    Set rs = Server.CreateObject("ADODB.Recordset")
    stm = "SELECT NodeID, NodeLabel, DisplayOrder FROM OrgChart WHERE (ParentNodeID = ?) AND (Published = 1) ORDER BY DisplayOrder"

    qParams(0) = Array("@ParentNodeID", adInteger, adParamInput, , CInt(rootNodeID))
       
    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, qParams)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
        Exit Sub
    Else

        If rs.EOF Then
            Exit Sub
        Else

            While Not rs.EOF
                nodeDepth = 1
                Call getNodeLevel(cnxObj, dbAPI, nodeDepth, rs("NodeID"))
                indentString = String(nodeDepth, "--") & " "

                If rs("NodeID") = CInt(selectedID) Then 
                    listCode = listCode & "                    <option value=""" & rs("NodeID") & """ selected>" & indentString & rs("NodeLabel") & "</option>" & vbCrLf
                Else
                    listCode = listCode & "                    <option value=""" & rs("NodeID") & """>" & indentString & rs("NodeLabel") & "</option>" & vbCrLf
                End If 'Selected ID

                If hasChildNodes(cnxObj, dbAPI, rs("Node")) Then
                    Call buildNodeAttachSelectList(cnxObj, dbAPI, listCode, rs("NodeID"), selectedID)
                End If

                rs.MoveNext
            WEnd

        End If

    End If

    Call dbAPI.closeRecordset(rs)

End Sub

Function buildNodeColourList(ByVal cnxObj, ByRef dbAPI, ByVal selectVal)

    Dim rs, stm, listCode

    listCode = ""

    stm = "SELECT NodeColourID, NodeColourCode FROM OrgChartColours ORDER BY NodeColourID"

    Set rs = Server.CreateObject("ADODB.Recordset")

    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Null)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
    Else

        While Not rs.EOF

            If rs("NodeColourID") = CInt(selectVal) Then 
                listCode = listCode & "                    <option value=""" & rs("NodeColourID") & """ selected style=""background-color:" & rs("NodeColourCode") & ";color:#fff;font-weight:bold;"">" & rs("NodeColourCode") & "</option>" & vbCrLf
            Else
                listCode = listCode & "                    <option value=""" & rs("NodeColourID") & """ style=""background-color:" & rs("NodeColourCode") & ";color:#fff;font-weight:bold;"">" & rs("NodeColourCode") & "</option>" & vbCrLf
            End If 'Selected ID


            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    buildNodeColourList = listCode

End Function

Function buildNodeChildPlacementList(ByVal cnxObj, ByRef dbAPI, ByVal selectVal)

    Dim rs, stm, listCode

    listCode = ""

    stm = "SELECT ChildPlacementTypeID, ChildPlacementType, TypeLabel FROM OrgChartChildPlacementTypes ORDER BY ChildPlacementTypeID"

    Set rs = Server.CreateObject("ADODB.Recordset")

    Call dbAPI.executeSelectQuery(cnxObj, rs, stm, adCmdText, Null)
    debugCode = debugCode & dbAPI.DebugMessage & vbCrLf

    If dbAPI.ErrorState <> 0 Then
        debugCode = debugCode & dbAPI.ErrorMessage & vbCrLf
    Else

        While Not rs.EOF

            If rs("ChildPlacementTypeID") = CInt(selectVal) Then 
                listCode = listCode & "                    <option value=""" & rs("ChildPlacementTypeID") & """ selected>" & rs("TypeLabel") & "</option>" & vbCrLf
            Else
                listCode = listCode & "                    <option value=""" & rs("ChildPlacementTypeID") & """>" & rs("TypeLabel") & "</option>" & vbCrLf
            End If 'Selected ID


            rs.MoveNext
        WEnd

    End If

    Call dbAPI.closeRecordset(rs)

    buildNodeChildPlacementList = listCode

End Function

%>