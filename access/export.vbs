Dim objCn 
Dim strConnection
Dim strQuery

Set objCn = CreateObject("ADODB.Connection")
strConnection = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\app\workspace\�̔��Ǘ�.accdb;"

On Error Resume Next
objCn.Open strConnection
If Err.Number <> 0 Then
	MsgBox( Err.Description )
	Wscript.Quit
End If
On Error GoTo 0

' strQuery = "select * into [Excel 8.0;DATABASE=c:\tmp\�̔��Ǘ�C.xls].���i�}�X�^ from ���i�}�X�^"
' strQuery = "select * into [Excel 12.0 xml;DATABASE=c:\tmp\�̔��Ǘ�C.xlsx].���i�}�X�^ from ���i�}�X�^"
' ���炩���� accdb ���쐬
' strQuery = "select * into [;DATABASE=C:\tmp\�f�[�^�x�[�X1.accdb].���i�}�X�^ from ���i�}�X�^"
' ���炩���� mdb ���쐬
' strQuery = "select * into [;DATABASE=C:\tmp\�f�[�^�x�[�X1.mdb].���i�}�X�^ from ���i�}�X�^"
' strQuery = "select * into [ODBC;Driver={MySQL ODBC 8.0 Unicode Driver};server=localhost;database=lightbox;uid=root;pwd=].���i�}�X�^_from_access from ���i�}�X�^"
' �e�[�u�����͉p������
' strQuery = "select * into [ODBC;Driver={SQLite3 ODBC Driver};Database=C:\tmp\�̔��Ǘ�.sqlite3].syohin from ���i�}�X�^"

objCn.Execute( strQuery )

objCn.Close

Set objRs = Nothing
Set objCn = Nothing
