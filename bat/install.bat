REM access フォルダ
MOVE ..\access\*.* \app\workspace

REM csv フォルダ
mkdir \app\workspace\csv
MOVE ..\csv\*.* \app\workspace\csv

mkdir \app\workspace\csv\utf-8
MOVE ..\csv\utf-8\*.* \app\workspace\csv\utf-8

REM excel フォルダ
MOVE ..\excel\*.* \app\workspace

REM sqlite3
MOVE ..\sqlite3\*.* \app\workspace
