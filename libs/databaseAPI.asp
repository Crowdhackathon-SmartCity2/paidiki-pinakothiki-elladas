<!--METADATA
	TYPE="TypeLib"
	NAME="Microsoft ActiveX Data Objects 2.7 Library"
	UUID="{EF53050B-882E-4776-B643-EDA472E8E3F2}"
	VERSION="2.7"
-->
<%

Class databaseAPI

    'Private variables
    Private ProductName
    Private ProductVersion
    Private CopyrightInfo
    Private rs
    Private errState
    Private errMessage
	Private dbgMessage

    'Class constructor
    Private Sub Class_Initialize()
        ProductName = "Ipetridis Database API"
        ProductVersion = "3.0"
        CopyrightInfo = "Copyright (c) " & Year(Now) & " - Ioannis Petridis <ipetridis@gmail.com>. All rights reserved."
        errState = 0
        errMessage = ""
        dbgMessage = "" 
    End Sub

    'Class destructor
    Private Sub Class_Terminate()
        errState = 0
        errMessage = ""
        dbgMessage = ""
    End Sub

    'Properties

    'Property Name: ErrorState()
    'Usage        : Flag to denote that an error has occured
    '               0 everything is working fine, 1 an error occured
    Public Property Get ErrorState()
		ErrorState = errState
	End Property

    'Property Name: ErrorMessage()
    'Usage        : Retrieves the error message when an error occured
    Public Property Get ErrorMessage()
		ErrorMessage = errMessage
	End Property

    'Property Name: DebugMessage()
    'Usage        : Used to stored debuging info
    Public Property Get DebugMessage()
		DebugMessage = dbgMessage
	End Property


    'Class Methods

    'Opens a database connection
    Public Sub openDatabaseConnection(ByRef cObj, ByVal connectionString)

        On error resume next
        cObj.ConnectionString = connectionString
        cObj.Open
        On error goto 0

        If cObj.Errors.Count > 0 Then
            errState = 1
            Call dbErrorHandler(cObj, "connection", connectionString)
        Else
            errState = 0
            errMessage = ""
        End If

    End Sub

    'Routine that closes the database connection (if it is open)
    'It also destroys the connection object
    Public Sub closeDatabaseConnection(ByRef cObj)

        'close database connection
        If cObj.State = 1 Then
            cObj.Close
            Set cObj = Nothing
        ElseIf cObj.State = 0 Then 
            Set cObj = Nothing
        End If

    End Sub

    'Function to execute a select query and populate a recordset
    'Arguments: Database connection object
    '            reference to the recordset object to be populated
    '            statement to be executed
    '            ADO DB CommandType Enum value
    '            Two-dimensional array containing parameter list
    Public Sub executeSelectQuery(ByVal cObj, ByRef rsObj, ByVal stm, ByVal comdType, ByVal parArray)

        'Local variables
        Dim i
        Dim cmObj
        Dim paramObj

        'Initialise local variables
        Set cmdObj = Server.CreateObject("ADODB.Command")

        'Initialise the command object
        cmdObj.ActiveConnection = cObj
        cmdObj.CommandText = stm
        cmdObj.CommandType = comdType

        If Not IsNull(parArray) Then

            Set paramObj = cmdObj.Parameters

            For i = LBound(parArray) To UBound(parArray)
                dbgMessage = dbgMessage & parArray(i)(0) & " = " & parArray(i)(4) & vbCrLf
                paramObj.Append cmdObj.CreateParameter(parArray(i)(0), parArray(i)(1), parArray(i)(2), parArray(i)(3), parArray(i)(4))
            Next

        End If

        'Execute the query and trap any errors

        On error resume next
        Set rsObj = cmdObj.Execute
        On error goto 0

        If cObj.Errors.Count > 0 Then
            errState = 1
            Call dbErrorHandler(cObj, "statement", stm)
        Else
            errState = 0
            errMessage = ""
        End If

        Set cmdObj = Nothing
        Set paramObj = Nothing

    End Sub

    Public Sub closeRecordset(ByRef rsObj)

        If rsObj.State = 1 Then
            rsObj.Close
            Set rsObj = Nothing
        ElseIf rsObj.State = 0 Then
            Set rsObj = Nothing
        End If

    End Sub

    'Function to execute a non-select query
    'Arguments: Database connection object
    '           Statement to be executed
    '           ADO DB CommandType Enum value
    '           Two-dimensional array containing parameter list
    'Returns: -1 if an error occured or the number of affected rows
    Public Function executeNonSelectQuery(ByVal cObj, ByVal stm, ByVal comdType, ByVal parArray)

        Dim affectedRows

        'Local variables
        Dim i, k, cmObj, paramObj

        'Initialise local variables
        Set cmdObj = Server.CreateObject("ADODB.Command")

        'Initialise the command object
        cmdObj.ActiveConnection = cObj
        cmdObj.CommandText = stm
        cmdObj.CommandType = comdType

        Set paramObj = cmdObj.Parameters

        For i = LBound(parArray) To UBound(parArray)
			dbgMessage = dbgMessage & parArray(i)(0) & " , " & parArray(i)(4) & " , " & parArray(i)(1) & vbCrLf
            'dbgMessage = dbgMessage & "Name = " & parArray(i)(0) & ", Value = " & parArray(i)(4) & ", ADO DataType = " & parArray(i)(1) & ", Size = " & parArray(i)(3) & vbCrLf
            'paramObj.Append cmdObj.CreateParameter(parArray(i)(0), parArray(i)(1), parArray(i)(2), parArray(i)(3), parArray(i)(4))
		
			Set myParam = cmdObj.CreateParameter(parArray(i)(0), parArray(i)(1), parArray(i)(2), parArray(i)(3), parArray(i)(4))
			
			dbgMessage = dbgMessage & adNumeric & vbCrLf
			
			If parArray(i)(1) = adNumeric Then
				myParam.Precision = parArray(i)(3)		
				myParam.NumericScale = 2
			End If
			
			paramObj.Append myParam
			
		Next

        On error resume next
        cmdObj.Execute affectedRows, ,adExecuteNoRecords
        On error goto 0

        If cObj.Errors.Count <> 0 Then
            errState = 1
            Call dbErrorHandler(cObj, "statement", stm)
            affectedRows = -1
        Else
            errState = 0
            errMessage = ""
        End If

        Set cmdObj = Nothing
        Set paramObj = Nothing

        executeNonSelectQuery = affectedRows

    End Function

    'Function to execute a database transaction
    'Arguments: Database connection object,
    '           Multi-dimensonal array containing:
    '                            SQL Statement
    '                            ADODB CommandTypeEnum,
    '                            2-dimensonal array of parameters of each statement in of the transaction
    'Returns: True if the transaction was commited successfully, false otherwise
    Public Function executeDatabaseTransaction(ByVal cObj, ByVal transParams)

        Dim commitedOK, errorOccured, i, k
        commitedOK = False
        errorOccured = False

        'Begin a database transaction
        cObj.BeginTrans()

        'Go through the array of statement and execute them one by one
        For i=LBound(transParams) To UBound(transParams)

            Set cmdObj = Server.CreateObject("ADODB.Command")

            'Initialise the command object
            cmdObj.ActiveConnection = cObj
            cmdObj.CommandText = transParams(i)(0)
            cmdObj.CommandType = transParams(i)(1)

            Set paramObj = cmdObj.Parameters

            If Not IsNull(transParams(i)(2)) Then

                For k = LBound(transParams(i)(2)) To UBound(transParams(i)(2))
                    dbgMessage = dbgMessage & transParams(i)(2)(k)(0) & " = " & transParams(i)(2)(k)(4) & vbCrLf
                    paramObj.Append cmdObj.CreateParameter(transParams(i)(2)(k)(0), transParams(i)(2)(k)(1), transParams(i)(2)(k)(2), transParams(i)(2)(k)(3), transParams(i)(2)(k)(4))
                Next

            End If

            On error resume next
            cmdObj.Execute affectedRows, ,adExecuteNoRecords
            On error goto 0

            Set cmdObj = Nothing
            Set paramObj = Nothing

            If cObj.Errors.Count <> 0 Then
                Call dbErrorHandler(cObj, "transaction", transParams(i)(0))
                errorOccured = True
                Exit For
            Else
                errState = 0
                errMessage = ""
            End If
        Next

        If errorOccured Then
            cObj.RollbackTrans()
            commitedOK = False
        Else
            cObj.CommitTrans()
            commitedOK = True
        End If

        executeDatabaseTransaction = commitedOK

    End Function

    Public Function getLastInsertedID(ByVal cObj, ByVal tblName)

        Dim rs, lastID, stm

        Dim cmObj
        Dim paramObj

        'Initialise local variables
        Set cmdObj = Server.CreateObject("ADODB.Command")
        Set rs = Server.CreateObject("ADODB.Recordset")

        stm = "SELECT IDENT_CURRENT(?) AS LastInsertedID"

        'Initialise the command object
        cmdObj.ActiveConnection = cObj
        cmdObj.CommandText = stm
        cmdObj.CommandType = adCmdText

        Set paramObj = cmdObj.Parameters
        paramObj.Append cmdObj.CreateParameter("@TblName", adVarChar, adParamInput, 64, tblName)
        
        'Execute the query and trap any errors
        On error resume next
        Set rs = cmdObj.Execute
        On error goto 0

        If cObj.Errors.Count <> 0 Then
            errState = 1
            Call dbErrorHandler(cObj, "statement", stm)
            lastID = -1
        Else
            errState = 0
            errMessage = ""
            lastID = rs("LastInsertedID")
            rs.Close
        End If

        Set paramObj = Nothing 
        Set rs = Nothing
        Set cmdObj = Nothing

        getLastInsertedID = lastID

    End Function

    'Private Function
    'Handles Database generated errors
    Private Sub dbErrorHandler(ByVal cObj, ByVal dbAction, ByVal stm)

        Dim errLoop

        If dbAction = "connection" Then
            errMessage = errMessage & "<strong>Σφάλμα κατά την απόπειρα σύνδεσης με την βάση δεδομένων.</strong><br>" & vbCrLf
            errMessage = errMessage & "<strong>Συμβολοσειρά συνδεσης:</strong> " & stm & "<br>" & vbCrLf
        ElseIf dbAction = "statement" Then
            errMessage = errMessage & "<strong>Σφάλμα κατά την εκτέλεση μιας εντολής SQL.</strong><br>" & vbCrLf
            errMessage = errMessage & "<strong>Εντολή SQL που απέτυχε:</strong> " & stm & "<br>" & vbCrLf
        Else
            errMessage = errMessage & "<strong>Σφάλμα κατά την εκτέλεση μιας SQL Transaction.</strong><br>" & vbCrLf
            errMessage = errMessage & "<strong>SQL Transaction που απέτυχε:</strong> " & stm & "<br>" & vbCrLf
        End If

        For Each errLoop In cObj.Errors
            errMessage = errMessage & "<strong>Αριθμός Σφάλματος:</strong> " & errLoop.Number & "<br>" & vbCrLf
            errMessage = errMessage & "<strong>Περιγραφή:</strong> " & errLoop.Description & "<br>" & vbCrLf
            errMessage = errMessage & "<strong>Πηγή:</strong> " & errLoop.Source & ")" & "<br>" & vbCrLf
            errMessage = errMessage & "<strong>Κατάσταση SQL:</strong>  " & errLoop.SQLState & "<br>" & vbCrLf
            errMessage = errMessage & "<strong>Μητρικό Σφάλμα:</strong> " & errLoop.NativeError & "<br>" & vbCrLf

            If errLoop.HelpFile = "" Then
                errMessage = errMessage & "<strong>Αρχείο βοήθειας:</strong> Μη Διαθέσιμο.<br>" & vbCrLf & vbCrLf
            Else
                errMessage = errMessage & "<strong>Αρχείο βοήθειας:</strong> " & errLoop.HelpFile & "<br>" & vbCrLf
                errMessage = errMessage & "<strong>Περιεχόμενο βοήθειας:</strong> " & errLoop.HelpContext & "<br>"  & vbCrLf & vbCrLf
            End If
        Next

End Sub
    

End Class

%>
