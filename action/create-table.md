![image](https://user-images.githubusercontent.com/1501327/143729973-4eb72537-18fa-4ab8-bfc7-39760ae93a49.png)

![image](https://user-images.githubusercontent.com/1501327/143729981-8a0aef0b-b139-4ec2-9566-9b4808f7d353.png)

```sql
drop table if exists [社員マスタ_名称];
create table [社員マスタ_名称] (
	[社員コード] VARCHAR(4)
	,[氏名] VARCHAR(50)
	,[フリガナ] VARCHAR(50)
	,[所属] VARCHAR(4)
	,[所属名] VARCHAR(50)
	,[性別] INT
	,[給与] INT
	,[手当] INT
	,[管理者] VARCHAR(4)
	,[管理者名] VARCHAR(50)
	,[生年月日] DATETIME
	,primary key([社員コード])
)
;
```

この後、SQLの窓で社員マスタのデータをコピーした後、このテーブルの所属名と管理者名を非表示にして貼り付けて更新する。
