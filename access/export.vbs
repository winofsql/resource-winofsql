Dim objCn 
Dim strConnection
Dim strQuery

Set objCn = CreateObject("ADODB.Connection")
strConnection = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\app\workspace\販売管理.accdb;"

On Error Resume Next
objCn.Open strConnection
If Err.Number <> 0 Then
	MsgBox( Err.Description )
	Wscript.Quit
End If
On Error GoTo 0

' strQuery = "select * into [Excel 8.0;DATABASE=c:\tmp\販売管理C.xls].商品マスタ from 商品マスタ"
' strQuery = "select * into [Excel 12.0 xml;DATABASE=c:\tmp\販売管理C.xlsx].商品マスタ from 商品マスタ"
' あらかじめ accdb を作成
' strQuery = "select * into [;DATABASE=C:\tmp\データベース1.accdb].商品マスタ from 商品マスタ"
' あらかじめ mdb を作成
' strQuery = "select * into [;DATABASE=C:\tmp\データベース1.mdb].商品マスタ from 商品マスタ"
' strQuery = "select * into [ODBC;Driver={MySQL ODBC 8.0 Unicode Driver};server=localhost;database=lightbox;uid=root;pwd=].商品マスタ_from_access from 商品マスタ"
' テーブル名は英数字で
' strQuery = "select * into [ODBC;Driver={SQLite3 ODBC Driver};Database=C:\tmp\販売管理.sqlite3].syohin from 商品マスタ"

objCn.Execute( strQuery )

objCn.Close

Set objRs = Nothing
Set objCn = Nothing
