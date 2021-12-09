## XAMPP MySQL サービス化
![image](https://user-images.githubusercontent.com/1501327/145487390-b3e7ad95-3596-43f2-aca9-0885d3764d9a.png)

- **サービスを開始せずに ❎ ボタンでサービス登録**

![image](https://user-images.githubusercontent.com/1501327/145487874-b681f497-2496-4d85-8aec-f890c142e1cd.png)

- **サービスを止めて ✅ ボタンでサービス解除**

![image](https://user-images.githubusercontent.com/1501327/145488153-e7f76518-55c0-4f51-89d8-c5ca499be1a1.png)


## 外部からの接続
![image](https://user-images.githubusercontent.com/1501327/145489428-c99dbd51-cd3a-4d4c-b322-9be4a4194f88.png)
```sql
GRANT ALL PRIVILEGES ON *.* 
	TO ユーザ@'%'
	IDENTIFIED BY 'password'
	WITH GRANT OPTION
```
![image](https://user-images.githubusercontent.com/1501327/145489626-ffe8363f-1c20-433f-8b5c-4a50c3ce07d2.png)
