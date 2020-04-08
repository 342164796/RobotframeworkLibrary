# ApiTest安装

## 获取文件

- 安装git客户端



- 执行以下命令，获取安装文件

```
git clone git@github.com:342164796/RobotframeworkLibrary.git
```

## 安装python

- 进入Install目录，双击安装文文件python-2.7.10

> 请根据自身OS，选择合适的python版本（32 -> python-2.7.10.msi，64 -> python-2.7.10.amd64.msi）

## 安装wx-Python

- 进入Install目录，双击安装文件

> 请根据已安装的python版本，选择对应的wx-python版本（32 -> wxPython2.8-win32-unicode-2.8.12.1-py27.exe, 64 -> wxPython2.8-win64-unicode-2.8.12.1-py27.exe）

## 安装pip

- 启用pip：在cmd下执行以下命令

```
python -m ensurepip
```

## 安装robot-framework

- 进入Install目录，双击执行init.bat

## 其他

- 将目录下的sitecustomize.py，copy到site-packages目录

> 假设我的python安装路径在D:\Python27，则将sitecustomize.py复制到D:\Python27\Lib\site-packages目录下

- 其他帮助文档可参考Doc目录下《安装说明.docx》
- 测试用例创建文档可参考Doc目录下《测试用例创建说明.docx》和《测试用例编写说明.docx》
