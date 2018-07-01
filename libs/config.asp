<%

'-----------------------------------------------------------------
'   Application : Cpanel - Web site control Panel 
'   Version     : 2.0
'   File        : config.asp
'   Usage       : Application Configuration File
'   Copyright   : (c)2006 - 2008 RTel S.A. All rights reserved.
'-----------------------------------------------------------------

'Company Name
Const CompanyName = "Παιδική Πινακοθήκη Ελλάδας"

'Client Company
Const ClientCompany = "Αρχειακή Συλλογή Ελληνικής Παιδικής Ζωγραφικής"

'Application Name
Const ApplicationName = ""

'Application Dir
Const ApplicationDir = "/"

'Flag to denote whether the SQL Server
Const sqlServerVersion = 2014

'Database connection Strings
'Live Server
'Const DBConnStr = "8ltN5pzVkOHfbeAQl+JBFTCxrtL4yoJ4zDIcgC4+KQpE5QeqKT+2LWLK80s7FItcfcammCyRB4FEgPN46pw4cDyKDh8RF4hBlMHXLOuFxA3wVXWQFEjWLLkg7NX7qfbWuW5cAdrNtGw="
'Development
Const DBConnStr = "8ltN5pzVkOHfbeAQl+JBFTCxrtL4yoJ4zDIcgC4+KQpE5QeqKT+2LWLK80s7FItcfcammCyRB4FEgPN46pw4cDyKDh8RF4hBlMHXLOuFxA3wVXWQFEjWLLkg7NX7qfbWuW5cAdrNtGw="

'Default Administrator Name
Const defAdminName = "CPanel Administrator"
Const defAdminEmail = "ipetridis@rhodes-hospital.gr"

Const resPerPage = 10

'SMTP Server Configuration
Const SMTPServer    = "mailgate.1742.syzefxis.gov.gr"
Const SMTPPort      = 25

'Application Locale - Defaults to English - UK
Const appLocale = "en-gb"

'Boolean to denote whether to display debugging information at the bottom of each page.
Const debugEnabled  = True

Const maxScriptExecutionTime = 3600

Const validCharsForPasswords = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,.-_/+$:%@!#"
Const validCharsForUsernames = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_."
Const validCharsForEmails = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_@."

'Image resizing script location
Const resizeScript = "/cpanel/ImageResizer.aspx"

'maximum upload file size in bytes (4000K)
Const maxUploadBytes = 4096000

'WYSIWYG Editor
Const wysiwygResourceBase = "/cpanel/tinymce/lists"
Const wysiwygSnippetBase = "/cpanel/tinymce/snippets"

Const siteBaseRoot = "/"

'Tree image dir
Const treeImageBase = "images/tree"

Dim debugCode
debugCode = ""

%>
