[SQLの窓 ダウンロード](https://winofsql.jp/download/WinOfSql105.zip)\
[SQLの窓 Document](https://winofsql.jp/help/cpp/help.htm)



## ODBC DSN の設定

<hr>

### "H-MDB"="Microsoft Access Driver (*.mdb, *.accdb)"
#### 販売管理.mdb
![image](https://user-images.githubusercontent.com/1501327/143729055-9dd4089f-bb09-4ba5-9887-d2330c028b1c.png)

<br>

### "H-ACCDB"="Microsoft Access Driver (*.mdb, *.accdb)"
#### 販売管理.accdb
![image](https://user-images.githubusercontent.com/1501327/143729063-3146eca0-8de5-4caa-8f0f-af64e55318a5.png)

<br>

### "H-S3-MDB"="Microsoft Access Driver (*.mdb, *.accdb)"
#### sqlite3.mdb
![image](https://user-images.githubusercontent.com/1501327/143729074-43664298-b0c3-467b-bb8b-89ea63e9d10f.png)

<br>

### "H-S3-ACCDB"="Microsoft Access Driver (*.mdb, *.accdb)"
#### sqlite3.accdb
![image](https://user-images.githubusercontent.com/1501327/143729102-6197f5c6-66b7-470b-9745-e166a7718a1d.png)

<br>

### "S3-LIGHTBOX"="SQLite3 ODBC Driver"
#### lightbox.sqlite3
![image](https://user-images.githubusercontent.com/1501327/143729112-96c59029-c430-44ec-9fae-f4ed1adae491.png)

<br>

### "H-XLS"="Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)"
#### 販売管理.xls
![image](https://user-images.githubusercontent.com/1501327/143678677-6f2d536c-b4ac-445b-a7a4-8837bd31618b.png)

<br>

### "H-XLSX"="Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)"
#### 販売管理.xlsx
![image](https://user-images.githubusercontent.com/1501327/143678811-07903abf-f945-49e3-b1eb-5fdf00f00b00.png)

<br>

### "H-CSV"="Microsoft Access Text Driver (*.txt, *.csv)"
#### csv フォルダ
![image](https://user-images.githubusercontent.com/1501327/143729156-49171bf5-280f-411c-9081-83fc199ca71c.png)

<hr>

![image](https://user-images.githubusercontent.com/1501327/142143780-91c9bf8d-1086-446a-b72f-3788f8465aea.png)



## 社員マスタのリセット

1. TRUNCATE TABLE 社員マスタ でデータクリア 

2. SQLの窓に販売管理C.mdb を開いてエクスポート

![image](https://user-images.githubusercontent.com/1501327/138387502-19d0bc7a-3884-43fb-a633-d67a51944aab.png)

※ 既に存在するのでそのままデフォルトで実行するとデータが追加される


## CSV 出力

1. MySQL の SQL での実行 UI

![image](https://user-images.githubusercontent.com/1501327/138387988-0cb9f291-f2a0-4328-9876-033346d2299c.png)

2. SQLの窓の処理として複数テーブルのエクスポート

![image](https://user-images.githubusercontent.com/1501327/138388199-b8392a3e-e7e1-44d9-8ea2-5154e84edf10.png)

![image](https://user-images.githubusercontent.com/1501327/138388301-6975b7e8-95cd-4efb-83f5-70c9f0cf816b.png)

3. 単独テーブルからエクスポート

![image](https://user-images.githubusercontent.com/1501327/138388487-575ea0a7-9b03-4885-90c1-3fef819e38af.png)

![image](https://user-images.githubusercontent.com/1501327/138388659-9c9dde2e-374f-4af6-a57a-ce80996ec496.png)

## 使用列の選択

![image](https://user-images.githubusercontent.com/1501327/138394907-aedc1826-0393-40bc-9e7c-8c23460e81e1.png)

1. 行の新規登録時に、データを絞れる

2. 自由な列でエクスポート可能

3. - MySQL => CSV
   - MySQL => Excel( 旧 )
   - MySQL => Access( 旧 )

## DSN での他のDB のアクセス

1. ODBC ドライバが必要
2. 32ビットと64ビットがある
3. 32ビットはダウンロードする必要があるかも
-
4. Oracle
5. PostgreSQL
-

## sa パスワード変更
```
sqlcmd -E -S .\SQLEXPRESS
```

```
ALTER LOGIN sa WITH PASSWORD = 'XXXXXXXXXXXX'
go
```

[SQLExpress 設定](https://winofsql.jp/matrix/ginpro/patio.cgi?mode=view&no=228)


## PostgreSQL エクスポート

```
pg_dump -d -U postgres lightbox > lightbox.sql
```

## SQLServer 経由で Access から

sqlcmd

```sql
sp_configure 'show advanced options', 1;
go
RECONFIGURE;
go
sp_configure 'Ad Hoc Distributed Queries', 1;
go
RECONFIGURE;
go
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
go
EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 
go
```

```sql
SELECT
    取引先コード
FROM
    OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=C:\app\workspace\販売管理.mdb')...取引データ;
```

[SQLServer の OPENDATASOURCE 関数による Excel の参照( Microsoft.Jet.OLEDB.4.0 と Microsoft.ACE.OLEDB.12.0 )](https://logicalerror.seesaa.net/article/131309317.html)

## MySQL CMD Export
```
mysqldump --host=localhost --user=root --password= lightbox > lightbox-backup.sql 
```

## MySQL CMD Import
```
mysql -h localhost -u root -D lightbox --password= < lightbox-backup.sql 
```

### MySQL csv Export
```
SELECT
    *
 FROM
    社員マスタ
 INTO OUTFILE
     'C:/app/workspace/subject-1101/subject-1008-mysql/data03.932'
    CHARACTER SET cp932
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n';
```

### MySQL csv Import
```
LOAD DATA INFILE
    'C:/app/workspace/subject-1101/subject-1008-mysql/data01.932'
 INTO TABLE 社員マスタ
    CHARACTER SET cp932
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n';
```

## PostgreSQL CMD Export
```
pg_dump -d lightbox -U postgres -Fp --inserts -f /app/workspace/postgres-backup.data
```
-d データーベース -U ユーザ -Fp テキストフォーマット --insert insert文でデータを出力 -f 出力ファイル

## PostgreSQL CMD Import
```
pg_restore -Fp -c -d lightbox /app/workspace/postgres-backup.data
```
-c 直前に削除 

### PostgreSQL csv Export
```
COPY 社員マスタ
    TO '/app/workspace/csv/postgres-export-syain.csv'
WITH
    CSV HEADER
    ENCODING 'sjis'
```

### PostgreSQL csv Import
```
COPY 社員マスタ
    FROM '/app/workspace/csv/postgres-export-syain.csv'
WITH
    CSV HEADER
    ENCODING 'sjis'
```

## SQLite3 CMD

### csv Export (1)
```
sqlite3 -csv -header lightbox.sqlite3 "select * from 社員マスタ" > syain.csv
```

### csv Export (2)
#### csvget.txt
```
.headers on
.mode csv
.output syain.csv
SELECT * FROM 社員マスタ;
.quit
```
```
sqlite3 lightbox.sqlite3 < csvget.txt
```
#### csv Import
```
.import csv_file_path table_name
```
### VBS Access csv Export
```vbscript
' https://docs.microsoft.com/ja-jp/office/vba/api/access.docmd.transfertext
' https://docs.microsoft.com/ja-jp/office/vba/api/access.actexttransfertype
Dim Access
Set Access = Wscript.CreateObject("Access.Application")
Access.OpenCurrentDatabase( "\app\workspace\販売管理.accdb" )
Access.DoCmd.TransferText 2,, "社員マスタ", "\app\workspace\csv\vbs-export-sain.csv", 1
```

## SQLServer CMD csv Export
```
bcp lightbox..[社員マスタ] out "\app\workspace\csv\bcp-export-syain.csv" -c -t , -r \n -S localhost\SQLEXPRESS -U sa -P trustno1
```
