
# BonreeAgent

## 安装指南

### Cocoapods方式

* 在工程**Podfile**文件中添加

```objective-c
pod 'bonreeAgent'
```

### 安装包方式

* 解压**bonreeAgent.framework.tar.gz**，将**bonreeAgent.framework**加入到项目中，如图所示:

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/Add.png)

* 在**BuildPhass** -> **Link Binary With Libraries**中添加**bonreeAgent.framework**，如图所示：

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/Link.png)

* 添加以下依赖库:
* libresolv.tbd（**必须引入**）
* libc++.tbd（**必须引入**）
* webKit.framework（如果项目支持iOS8之前版本需要添加）

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/Dependce.png)

* 在**Build Setting**中搜索**Other Linker Flags**, 添加编译标志**-ObjC**。如图所示:

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/OtherLinker.png)



### 使用

#### Objective-C

* 引入头文件: 在AppDelegate.m中导入头文件。

* 在application:didFinishLaunchingWithOptions中设置config地址与AppId，如图所示:

```objective-c
[BRSAgent setConfigAddress:@"https://sdkupload.bonree.com/config"];
[BRSAgent startWithAppID:@"40766f87-13a8-48d3-9c96-1ce7c3cde50f"];
```

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/OC.png)

#### Swift

* 在对应的桥接⽂件⾥bridging-header.h⾥导⼊头⽂件，如图所示:

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/Swift-H.png)

* AppDelegate.swift文件中设置config地址和AppId，如图所示:

![image](https://github.com/TuYuWang/NewBonreeAgent/raw/master/img/Swift.png)

运行后有日志 bonreeAgent config succeeded ,即表示嵌码成功,如下:

```objective-c
2019-06-21 13:55:40 +0000 [bonreeAgent] bonreeAgent config succeeded
```
## 获取的资源列表
- 可以被获取的资源
	- web
	- 设备信息
- 不能被获取的资源
	- JS错误（例：使用未定义变量，数组越界采集不到，数组移除null或者添加null 抓取不到）	
	-  崩溃（很难被触发，暂时无法通过改变js代码造成程序的崩溃，项目内swift数组越界会抓为信号4异常）
	- 轨迹
	- 手势
	- 网络请求（flutter中的请求抓取不到，自身config和upload可以抓取）
	- Image （加载网络图片抓不到）
    - 卡顿（例：while 1）
    - 交互
    - 视图