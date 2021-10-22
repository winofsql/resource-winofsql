# Subject ワークスペース用テンプレート

## 環境 => https://github.com/winofsql/vscode-template
ワークスペース テンプレート

#### 1 : subject-main.zip としてダウンロード

#### 2 : [7Zip](https://sevenzip.osdn.jp/) で解凍

#### 3 : -main を -9999 フォーマットで当日日付に変更

#### 4 : VSCode で フォルダとして中の zz-workspace-vbs フォルダを開く

#### 5 : Run Terminal Command で 設定から 『基本設定』 を実行

#### 6 : Run Terminal Command で 設定から 『設定ファイルのダウンロード』 を実行

#### 7 : Run Terminal Command で 設定から 『ワークスペース作成』 を実行

#### 8 : フォルダで開いた VSCode を閉じる

#### 9 : lightbox.code-workspace を エクスプローラから実行

#### 10 : zz-workspace-vbs フォルダと同じところに、言語用フォルダ( ※1 )を作成

#### 11 : Run Terminal Command で 設定から 『ワークスペース作成』 を実行

![image](https://user-images.githubusercontent.com/1501327/134792059-fea2d3a3-c180-4246-bc03-5f3a6814adaf.png)

拡張を指定フォルダに保存している場合は、vscode.bat を作成して **『その他のアプリ』** から選択
```
"D:\app2\Microsoft VS Code\Code.exe" --extensions-dir="D:\app2\vscode\extensions" %1
```

\
\
**※1 ▼ 以下の文字列を含むフォルダ**
```
java
cs
js
hta
php
ps
py
sql
vbs
wsh
```
