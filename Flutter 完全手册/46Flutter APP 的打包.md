# Flutter APP 的打包

在写完 Flutter APP 之后，接下来最重要的一步就是讲 APP 打包发布，那么 Flutter 的 APP 该如何打包呢？


## Flutter APP 的构建模式及构建方法
首先需要了解 Flutter 编译 APP 时的三种构建模式：

1. Debug
2. Release
3. Profile

在将每种构建模式的构建方法。

## 1. Debug
Debug 模式，顾名思义，就是在开发调试时使用的模式。Flutter APP 在 Debug 模式下运行，会在 App 的右上角看到一个 Debug 的标志，如下图：

![](https://user-gold-cdn.xitu.io/2019/3/2/1693eff591e728d7?w=944&h=227&f=png&s=24860)

前面讲 Hot Reload 的时候说到，Hot Reload 只能在 Debug 模式下使用。

Release 模式下没有没有这个标志。

在 Debug 模式下，为了方便调试，Flutter 增加了很多方便调试的功能：

1. Flutter 的断言（Assertions）功能是开的
2. Flutter 的 Dart Observatory 是开的，Dart  Observatory 是用于分析和调试 Dart 代码的工具，可以 debugger，也可以检测性能等，后面会详细介绍 Dart  Observatory 的使用。
3. Flutter 的一些扩展功能是开启的，例如监控性能的浮层等。
4. Dart 代码采用 JIT 编译，因此可以使用 Hot Reload，方便快速开发。



可以看到，在 Debug 模式下，一方面 Flutter 采用的是 JIT 编译，另一方面 开启了很多额外功能，因此性能会差一些，所以 Debug 模式只能用在开发阶段。

当 Flutter APP 已 Debug 模式运行时， 既可以运行在真机上，也可以运行在模拟器上。



#### Debug 构建方法
1. IDE
    
    * Android Stuido:
![](https://user-gold-cdn.xitu.io/2019/2/16/168f532e178ccf19?w=994&h=162&f=jpeg&s=52378)

    * VS Code:
    
        点击 **Debug > Start Debugging** 或 **Debug > Start Without Debugging**。

2. 命令行:
    ```
    $flutter run
    ```


## 2. Release
Release 模式，顾名思义，就是在发布 APP 时使用的模式。使用 Release 模式部署应用程序，可以达到最高的性能和最小的安装包大小。

在 Release 模式下，为了提高运行性能：

1. 断言（Assertions）功能关闭
2. 没有 Debugging 的信息
3. Debugging 的功能关闭
4. Dart 代码采用 AOT 编译。使用 AOT 编译成 Native  Arm Code，不仅可以使 Flutter APP 因更快速的启动，更快速的执行，而且使用 AOT 编译生成的 Native  Arm Code 的产物的大小也会小很多。
5. 一些扩展功能被关闭

所以，当你的 APP 要发布的时候，一定要使用 Release 模式。

Release 模式只能运行在真机上，不能运行在模拟器上。


#### Release 构建方法
要想构建 Release 包，首先得连接真机，因为 Release 模式只能运行在真机上。
1. IDE
    
    * Android Studio
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918bff11eb5328?w=1007&h=257&f=jpeg&s=56596)
        打开 **Edit Configurations...**，如下图：
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918c1a3aa8d965?w=2138&h=554&f=jpeg&s=152620)
        在 Additional arguments 这里加上  `--release`，构建出来的就是 Release 模式，为空的话，就是 Debug 模式。

        或者，直接运行 **Run** -> **Flutter Run 'main.dart' in Release Mode**：
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918e2b0a0565e3?w=678&h=754&f=jpeg&s=126879)

    * VS Code
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918c546b814f8a?w=540&h=342&f=jpeg&s=57690)
        选择 **Debug** ，点击 **Open Configurations** ，打开 **launch.json** ，如下：
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918cbf12861837?w=1414&h=578&f=jpeg&s=112545)
        增加下面这一行：
        ```
        "flutterMode": "release"
        ```
        完整的 **launch.json**  为：
        ```
        {
        // Use IntelliSense to learn about possible attributes.
        // Hover to view descriptions of existing attributes.
        // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
        "version": "0.2.0",
        "configurations": [

                {
                    "name": "Flutter",
                    "request": "launch",
                    "type": "dart",
                    "flutterMode": "release"
                }
            ]
        }
        ```
        
        然后在点击 **Debug > Start Without Debugging**。

2. 用命令行:
```
$flutter run --release
```
或者
```
$flutter build apk //构建Android Release包
$flutter build ios //构建iOS Release包
```

如果你没有连真机，而是连的模拟器，则会报如下的错误：

![](https://user-gold-cdn.xitu.io/2019/3/19/16996ace287f1bb4?w=914&h=182&f=jpeg&s=29989)

## 3. Profile
Profile 模式是专门监控性能的模式，在 Debug 模式下，开启了很多额外的功能，因此不能实际反应应用的性能，但在 Release 模式下，也没有监控的功能，所以就有了 Profile 模式。Profile 模式是 Debug 模式和 Release 模式的结合。

Profile 模式和 Release 模式更接近，都采用了 AOT 编译，所以都不能用 Hot Reload，但是 Profile 相对于 Release，保留了一定的调试能力，足以分析 Flutter 的性能：

1. 一些扩展的服务功能是打开的，例如监控性能的浮层等。
2. Tracing 是打开的，而且 Dart Observatory 也可以连接到进程。

而且为了更加准确的反应 Flutter 在真机上的运行性能，Profile 模式只能跑在真机上，不能运行在模拟器上。

#### Profile 构建方法

要想构建 Profile 包，首先得连接真机，因为 Profile 模式只能运行在真机上。
1. IDE
    
    * Android Studio
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918d8054dce65e?w=1814&h=426&f=jpeg&s=128303)
        按照 Release 的方法，这里参数改为 `--profile`
        
        或者，直接运行 **Run** -> **Flutter Run 'main.dart' in Profile Mode**：
        ![](https://user-gold-cdn.xitu.io/2019/3/20/16996b1f02e5f4ae?w=834&h=826&f=jpeg&s=163973)

    * VS Code
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918c546b814f8a?w=540&h=342&f=jpeg&s=57690)
        选择 **Debug** ，点击 **Open Configurations**，打开 **launch.json**，如下：
        ![](https://user-gold-cdn.xitu.io/2019/2/23/16918de333d2e438?w=1318&h=596&f=jpeg&s=117636)
        增加下面这一行：
        ```
        "flutterMode": "profile"
        ```
        完整的 **launch.json**  为：
        ```
        {
        // Use IntelliSense to learn about possible attributes.
        // Hover to view descriptions of existing attributes.
        // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
        "version": "0.2.0",
        "configurations": [

                {
                    "name": "Flutter",
                    "request": "launch",
                    "type": "dart",
                    "flutterMode": "profile"
                }
            ]
        }
        ```
        
        然后在点击 **Debug > Start Without Debugging**。        

2. 用命令行:
```
$flutter run --profile
```

# Flutter Android/iOS 安装包分析

## Flutter Android Debug 安装包分析

如果前面你连接了 Android 虚拟机或真机，并且按照前面几节的操作运行了 Flutter APP，那么在 Flutter 目录下，找到 `build/app/outputs/apk/debug/app-debug.apk` ,就是 Android 的 Debug 安装包，安装包里的内容如下图：

![](https://user-gold-cdn.xitu.io/2019/2/23/16918f02ccf3485c?w=2372&h=326&f=jpeg&s=86534)

#### lib目录下的 Flutter Engine so
lib 目录下是 Flutter Engine的so：
![](https://user-gold-cdn.xitu.io/2019/2/23/16918f13e87cba03?w=2390&h=292&f=jpeg&s=86020)
总共有三个平台的 so：
* x86_64
* x86
* arm64-v8a

1. so 的大小问题

    总大小是17.8M，占到整个apk安装包的71.4%，你可能会觉得好大，但是不用担心，因为Debug模式需要运行在模拟器上，所以才打入了x86_64和x86两个平台的so，所以会比较大，在Release模式下是不会打入x86_64和x86的，而且Google也在不断优化Flutter Engine的so大小。

2. assets 目录

    assets 目录下的都是 Flutter 生成的产物。
    ![](https://user-gold-cdn.xitu.io/2019/2/23/16918f96d1aa0eca?w=2358&h=454&f=jpeg&s=116813)

3. flutter_assets 目录
    * kernel_blob.bin：由Flutter代码生成
    * vm_snapshot_data：VM虚拟机数据段
    * isolate_snapshot_data：应用程序数据段
    * fonts：字体库
    * packages：Flutter资源库
    * FontManifest.json：字体的Manifest
    * AssetManifest.json：资源的Manifest


4. flutter_shared 目录

    icudtl.dat：该文件的作用是告诉Flutter如何使用unicode进行国际文本处理，用于国际化的。

#### classes.dex
Flutter 的 Android 代码编译成的 classes.dex。

#### res 目录
Flutter 的 Android 工程的资源文件。

## Flutter Android Release 安装包分析

连接了 Android 真机，构建 Release 模式，在 Flutter 目录下，找到 `build/app/outputs/apk/release/app-release.apk` ,就是 Android 的 Release 安装包，安装包里的内容如下图：


![](https://user-gold-cdn.xitu.io/2019/2/23/1691a66c1541e605?w=2396&h=300&f=jpeg&s=91944)

#### lib 目录下的 Flutter Engine so
lib 目录下是 Flutter Engine 的 so：

![](https://user-gold-cdn.xitu.io/2019/2/23/1691a6778d20ff7b?w=2330&h=218&f=jpeg&s=67804)

总共有两个平台的 so：
* arm64-v8a
* armeabi-v7a

***大小问题：***

总大小是 5.9M ，占到整个 apk 安装包的 75.3%，如果想要继续优化 so 的大小，可以只用 areabi-v7a 的 so。

#### assets 目录
assets 目录下的都是 Flutter 生成的产物。

![](https://user-gold-cdn.xitu.io/2019/2/23/1691a6a01ba9d4e1?w=2212&h=524&f=jpeg&s=134943)

* isolate_snapshot_data：应用程序数据段
* isolate_snapshot_instr： 应用程序指令段
* vm_snapshot_data：VM虚拟机数据段
* vm_snapshot_data： VM虚拟机数据段

1. flutter_assets 目录
    * fonts：字体库
    * packages：Flutter资源库
    * FontManifest.json：字体的Manifest
    * AssetManifest.json：资源的Manifest


2. flutter_shared 目录

    icudtl.dat：该文件的作用是告诉Flutter如何使用unicode进行国际文本处理，用于国际化的。

#### classes.dex
Flutter 的 Android 代码编译成的 classes.dex。

#### res 目录
Flutter 的 Android 工程的资源文件。


## Flutter iOS Debug 安装包分析

如果前面你连接了 iOS 模拟器或真机，并且按照前面几节的操作运行了 Flutter APP，那么在 Flutter 目录下，找到 `build/Debug-iphonesimulator/Runner` 或者 `build/iphonesimulator/Runner` ,就是 iOS 的 Debug 安装包，安装包里的内容如下图：


![](https://user-gold-cdn.xitu.io/2019/2/23/1691a723771e601b?w=1248&h=1102&f=jpeg&s=263430)

#### Frameworks 目录
Frameworks 目录下的 framework 有：
![](https://user-gold-cdn.xitu.io/2019/2/23/1691a743146eec59?w=498&h=116&f=jpeg&s=20231)

* App.frmework

    ![](https://user-gold-cdn.xitu.io/2019/2/23/1691a84a00b152d1?w=1242&h=196&f=jpeg&s=38772)
    Flutter 的 iOS 代码编译成的 framework。
    
    用 file 命令查看 App.frmework 支持的架构:
    
    ```
    $ file Runner.app/Frameworks/App.framework/App
    Runner.app/Frameworks/App.framework/App: Mach-O 64-bit dynamically linked shared library x86_64
    ```
    只支持 x86_64 一种架构。
    
* Flutter.frmework
    
    ![](https://user-gold-cdn.xitu.io/2019/2/23/1691a85156968e8f?w=1192&h=218&f=jpeg&s=42191)

    Flutter 的库和引擎。
    
    用 file 命令查看 Flutter.frmework 支持的架构:
    
    ```
    $ file Runner.app/Frameworks/Flutter.framework/Flutter
    Runner.app/Frameworks/Flutter.framework/Flutter: Mach-O universal binary with 1 architecture: [x86_64:Mach-O 64-bit dynamically linked shared library x86_64]
    Runner.app/Frameworks/Flutter.framework/Flutter (for architecture x86_64):	Mach-O 64-bit dynamically linked shared library x86_64
    ```
    只支持 x86_64 一种架构。
    
    * Flutter.framework 还有 icudtl.dat
    
        icudtl.dat：该文件的作用是告诉Flutter如何使用unicode进行国际文本处理，用于国际化的。

***大小问题：***

App.framework 总大小 26k，Flutter.framework 的总大小为 25.7M。Debug 模式下的大小没有参考意义，因为 Debug 不会是正式发布的包。

#### flutter_assets 目录
assets 目录下的都是 Flutter 生成的产物。

![](https://user-gold-cdn.xitu.io/2019/2/23/1691a82520a0f293?w=1262&h=358&f=jpeg&s=73981)

这里的产物是 iOS 和 Android 是一样的，只是路径有些不同。


* kernel_blob.bin：由Flutter代码生成
* vm_snapshot_data：VM虚拟机数据段
* isolate_snapshot_data：应用程序数据段
* fonts：字体库
* packages：Flutter资源库
* FontManifest.json：字体的Manifest
* AssetManifest.json：资源的Manifest

