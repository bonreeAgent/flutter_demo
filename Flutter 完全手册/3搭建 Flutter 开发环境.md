# 搭建 Flutter 开发环境


搭建 Flutter 开发环境，有两部分：

### 1. Flutter SDK
Flutter 开发需要安装 Flutter SDK，这里会分别介绍 Flutter SDK 在 Windows、MacOS、Linux 三个平台上的安装过程。

### 2. Flutter IDE
安装完 Flutter SDK 后，想要开发 Flutter，还需要 IDE ，可以开发 Flutter 的 IDE 有两个：

* Android Studio
* VS Code

这两个 IDE，你可以根据自己的习惯选择一个。但是推荐使用 VS Code，因为其运行不会占用太多的内存，小巧方便，功能强大。


## 配置 Flutter 中国镜像
在搭建 Flutter 环境之前，因为众所周知的原因，有可能被墙，所以需要先为 Flutter 配置中国镜像。

### 中国镜像地址
国内有两个镜像可以用，一个就是官方 Flutter 社区的国内镜像，另一个是上海交通大学 Linux 用户组的镜像，建议用官方 Flutter 社区的国内镜像。

* Flutter 社区

    FLUTTER_STORAGE_BASE_URL: https://storage.flutter-io.cn

    PUB_HOSTED_URL: https://pub.flutter-io.cn

* 上海交通大学 Linux 用户组

    FLUTTER_STORAGE_BASE_URL: https://mirrors.sjtug.sjtu.edu.cn

    PUB_HOSTED_URL: https://dart-pub.mirrors.sjtug.sjtu.edu.cn


### 配置方法
需要设置两个环境变量：`PUB_HOSTED_URL` 和 `FLUTTER_STORAGE_BASE_URL`。

#### Windows
1. `计算机` -> `属性` -> `高级系统设置` -> `环境变量`，打开环境变量设置框。
2. 在用户变量下，选择`新建环境变量`，添加如下的两个环境变量和值：

    | 变量名 | 值 |
    | -- | -- |
    | FLUTTER_STORAGE_BASE_URL | https://storage.flutter-io.cn |
    | PUB_HOSTED_URL | https://pub.flutter-io.cn |

#### Linux
打开 `~/.bashrc`:
```
$vim ~/.bashrc
```
将镜像加入环境变量：
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```
保存后，在运行
```
$source ~/.bashrc
```
#### MacOS

在 `~/.bash_profile` 上添加：

```shell
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

保存文件后，在运行

```shell
$ source ~/.bash_profile
```

## Flutter SDK 安装 —  Windows

### 系统要求

开发环境必须满足以下最低要求：

- 操作系统： Windows 7 SP1（64位）及以上 
- 硬盘空间：400M（不包括 IDE 或工具的磁盘空间）
- 依赖工具：Flutter 依赖如下的工具：
  - [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell) 
  - [Git for Windows 2.x](https://git-scm.com/download/win)  

#### Windows PowerShell 5.0
Powershell 从 Windows7 时代开始内置于 Windows 系统当中，可以看作是微软对 cmd 的大升级，随着微软对 Win10 系统的不断升级，内置的默认命令行工具也逐渐从 cmd 迁移到了 PowerShell。

PowerShell 相对于 cmd 来说：

* 界面更美观
* 不仅完美支持传统 Windows 命令和 .net 库中的命令，也支持部分常用的 Linux 命令，功能更强大。

经过验证，可以不使用 PowerShell ，也不用升级 PowerShell 的版本，使用 cmd 完全没问题。

如果你想升级 PowerShell 到 5.0，可以自行搜索升级方法。

### 安装 Git
从[这里下载](https://git-scm.com/downloads) Git 的安装包安装。

安装完后，打开 cmd 验证，输入：
```shell
git --version
```
看到：
```shell
C:\Users\Administrator>git --version
2.13.0.windows.1
```
说明 Git 安装成功，Git 用于管理 Flutter 的源码。

### 搭建 Android 开发环境
为了 Flutter 可以编译成 Android APK，和运行在 Android 模拟器上，需要搭建 Android 开发环境。

1. 安装 [Android Studio](https://developer.android.com/studio)，Android Studio 安装成功后，会自带 Android SDK。
 
#### 配置 Android SDK 环境变量
打开 Android Studio，选择 `Confiure` -> 'SDK Manager'：

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f1e45b0afc8?w=1568&h=1138&f=jpeg&s=142405)

在打开的窗口中就能看到 Android SDK 的路径:

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f345c0331eb?w=2248&h=1616&f=jpeg&s=514678)

#### 创建 Android 模拟器
打开 Android Studio，选择 `Confiure` -> 'AVD Manager'：


![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70511c1d9ab4?w=1560&h=1116&f=jpeg&s=140309)

在打开的页面里点击 `Create Virtual Device...`：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70542acbb598?w=422&h=114&f=jpeg&s=15720)

在 `Phone` 里选择一个设备，这里选择 Pixel 2 XL：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad705e5f0daaaf?w=2224&h=1568&f=jpeg&s=345100)

然后一直点击 Next，就成功创建了 Android 模拟器。


1. `计算机` -> `属性` -> `高级系统设置` -> `环境变量`，打开环境变量设置框。
2. 在用户变量下，选择 `Path`，点击编辑,添加上 `;(替换成 Android SDK 路径)/tools;(替换成 Android SDK 路径)/platform-tools`

### 下载 Flutter SDK

1. 你可以在 [Flutter SDK](https://flutter.dev/docs/development/tools/sdk/archive?tab=windows) 的下载页面，选择你想要的版本，一般选择稳定版的，目前最新的稳定版是 [v1.5.4-hotfix.2](https://storage.googleapis.com/flutter_infra/releases/stable/windows/flutter_windows_v1.5.4-hotfix.2-stable.zip)。
2. 将 Flutter SDK 的 zip 包解压到一个目录下，例如   `E:\src\flutter`（目录随意，但是不要放在需要权限的目录下，例如 ` C:\Program Files\` ）

### 设置 Flutter SDK 的环境变量
1. `计算机` -> `属性` -> `高级系统设置` -> `环境变量`，打开环境变量设置框。
2. 在用户变量下，选择 `Path`，点击编辑：

    * 如果已经存在 `Path`变量，则在原有的值后面先加 `;`，然后将 Flutter SDK 的完整路径 `E:\src\flutter\bin` 添加上。
    * 如果没有 `Path` 变量，则新建一个名为 `Path` 的用户变量，然后将 Flutter SDK 的完整路径 `E:\src\flutter\bin` 添加上。
    
    编辑完成后，点击确定。

### 运行 flutter doctor

为了验证 Flutter 是否安装成功，在 cmd 运行：

```shell
flutter doctor
```

如果看到输出如下的结果：

```shell
C:\Users\Administrator>flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.5.4-hotfix.2, on Microsoft Windows [Version 6.1.7601], locale zh-CN)
[✓] Android toolchain - develop for Android devices (Android SDK 27.0.3)
[✓] Android Studio (version 3.1)
[!] Connected device 
    ! No devices available

! Doctor found issues in 1 categories.
```

说明，Flutter SDK 已经安装成功。但是也可能遇到 Flutter 的报错，请按照报错的提示修复，例如：

- Some Android licenses not accepted（Android证书的问题）

  运行 `flutter doctor --android-licenses` 修复
  
## Flutter SDK 安装 —  Linux

这里以 Ubuntu 为例。

### 系统要求

开发环境必须满足以下最低要求：

- 操作系统：Linux （64位）
- 硬盘空间：600M（不包括 IDE 或工具的磁盘空间）
- 工具：Flutter需要用到如下的命令行（Linux 自带，无需额外安装）：
  - bash
  - curl
  - git 2.x
  - mkdir
  - rm
  - unzip
  - which
  - xz-utils
- 共享库：Flutter test的命令需要用到如下的库（Linux 自带，无需额外安装）：
  - libGLU.so.1

这些工具 Ubuntu 默认已经安装，无需在进行操作。
### 安装 Android 开发环境
为了 Flutter 可以编译成 Android APK，和运行在 Android 模拟器上，需要搭建 Android 开发环境。

1. 安装 [Android Studio](https://developer.android.com/studio)，Android Studio 安装成功后，会自带 Android SDK。

#### 配置 Android SDK 环境变量
打开 Android Studio，选择 `Confiure` -> 'SDK Manager'：

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f1e45b0afc8?w=1568&h=1138&f=jpeg&s=142405)

在打开的窗口中就能看到 Android SDK 的路径:

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f345c0331eb?w=2248&h=1616&f=jpeg&s=514678)

在 `~/.bashrc` 上添加：
```
export ANDROID_HOME=/Users/****/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

#### 创建 Android 模拟器
打开 Android Studio，选择 `Confiure` -> 'AVD Manager'：


![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70511c1d9ab4?w=1560&h=1116&f=jpeg&s=140309)

在打开的页面里点击 `Create Virtual Device...`：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70542acbb598?w=422&h=114&f=jpeg&s=15720)

在 `Phone` 里选择一个设备，这里选择 Pixel 2 XL：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad705e5f0daaaf?w=2224&h=1568&f=jpeg&s=345100)

然后一直点击 Next，就成功创建了 Android 模拟器。

### 下载 Flutter SDK

1. 你可以在 [Flutter SDK](https://flutter.dev/docs/development/tools/sdk/archive?tab=linux) 的下载页面，选择你想要的版本，一般选择稳定版的，最新的稳定版是 [v1.5.4-hotfix.2](https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz)。
2. 选择一个目录，解压缩 Flutter SDK 的 zip 包，例如：
    ```shell
    $ cd ~/development
    $ tar xf ~/Downloads/flutter_linux_v1.0.0-stable.tar.xz
    ```


### 设置 Flutter SDK 的环境变量
打开 `~/.bashrc`:
```
$vim ~/.bashrc
```
将 Flutter SDK 的完整路径加入环境变量，添加：
```
export PATH=$PATH:~/development/flutter/bin
```
保存后，在运行
```
$source ~/.bashrc
```

### 运行 flutter doctor

为了验证 Flutter 是否安装成功，运行：


```shell
$ flutter doctor
```

如果看到输出如下的结果：

```shell
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.5.4-hotfix.2, on Linux, locale zh_CN.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK 27.0.3)
[✓] Android Studio (version 3.1)
[!] Connected device 
    ! No devices available

! Doctor found issues in 1 categories.
```

说明，Flutter SDK 已经安装成功。但是也可能遇到 Flutter 的报错，请按照报错的提示修复，例如：

- Some Android licenses not accepted（Android 证书的问题）

  运行 `flutter doctor --android-licenses` 修复

## Flutter SDK 安装 —  MacOS

### 系统要求

开发环境必须满足以下最低要求：

- 操作系统： macOS （64位）
- 硬盘空间：700M（不包括 IDE 或工具的磁盘空间）
- 依赖工具：Flutter需要用到如下的命令行（MacOS 自带，无需额外安装）：
  - bash
  - curl
  - git 2.x
  - mkdir
  - rm
  - unzip
  - which
  
这些工具 MacOS 默认已经安装，无需在进行操作。

### 安装 Android 开发环境
为了 Flutter 可以编译成 Android APK，和运行在 Android 模拟器上，需要搭建 Android 开发环境。

1. 安装 [Android Studio](https://developer.android.com/studio)，Android Studio 安装成功后，会自带 Android SDK。

#### 配置 Android SDK 环境变量
打开 Android Studio，选择 `Confiure` -> 'SDK Manager'：

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f1e45b0afc8?w=1568&h=1138&f=jpeg&s=142405)

在打开的窗口中就能看到 Android SDK 的路径:

![](https://user-gold-cdn.xitu.io/2019/5/21/16ad6f345c0331eb?w=2248&h=1616&f=jpeg&s=514678)

在 `~/.bash_profile` 上添加：
```
export ANDROID_HOME=/Users/****/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

#### 创建 Android 模拟器
打开 Android Studio，选择 `Confiure` -> 'AVD Manager'：


![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70511c1d9ab4?w=1560&h=1116&f=jpeg&s=140309)

在打开的页面里点击 `Create Virtual Device...`：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad70542acbb598?w=422&h=114&f=jpeg&s=15720)

在 `Phone` 里选择一个设备，这里选择 Pixel 2 XL：
![](https://user-gold-cdn.xitu.io/2019/5/21/16ad705e5f0daaaf?w=2224&h=1568&f=jpeg&s=345100)

然后一直点击 Next，就成功创建了 Android 模拟器。

### 安装 iOS 开发环境
为了 Flutter 可以编译成 iOS 安装包，和运行在 iOS 模拟器上，需要搭建 iOS 开发环境。

在 MacOS 需要先安装 Xcode：

1. Xcode 版本需要 9.0 及以上（下载地址 [web download](https://developer.apple.com/xcode/) 或者 [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835)）。

2. 在 Terminal 运行：

   ```shell
   $  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   ```

   目的是使用最新版的 Xcode。

3. 先打开 Xcode，同意 Xcode 的许可协议


    ![](https://user-gold-cdn.xitu.io/2019/4/8/169fc4f9ec134730?w=1204&h=908&f=jpeg&s=233926)
4. 然后在命令行运行：

   ```shell
   $ sudo xcodebuild -license
   ```
   
   会看到如下的内容
   ```
   ....
   By typing 'agree' you are agreeing to the terms of the software license agreements. Type 'print' to print them or anything else to cancel, [agree, print, cancel]
   ```
   
   然后输入 `agree` 回车。

   然后 Xcode 的协议就签署成功了。

安装完 Xcode 之后，就可以将 Flutter 编译成 iOS 安装包了，电脑上也能运行 iOS 的模拟器。


### 下载 Flutter SDK

1. 你可以在 [Flutter SDK](https://flutter.dev/docs/development/tools/sdk/archive?tab=macos) 的下载页面，选择你想要的版本，一般选择稳定版的，最新的稳定版是 [v1.5.4-hotfix.2](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.5.4-hotfix.2-stable.zip)。

2. 选一个路径来存放 Flutter SDK ，例如 `/Users/kk/sdk`， 在这个位置下解压缩 Flutter SDK 的 zip 包：

   ```shell
   $ cd /Users/kk/sdk
   $ unzip ~/Downloads/flutter_macos_v1.0.0-stable.zip
   ```

### 设置 Flutter SDK 的环境变量

   在 `~/.bash_profile` 上添加（没有 .bash_profile ,可以新建一个）：

   ```
   export FLUTTER_HOME=/Users/kk/sdk
   export PATH=$PATH:$FLUTTER_HOME/bin
   ```

   保存文件后，在运行

   ```shell
   $ source ~/.bash_profile
   ```



### 运行 flutter doctor

为了验证 Flutter 是否安装成功，运行：

```shell
$ flutter doctor
```

如果看到输出如下的结果：

```shell
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, v1.5.4-hotfix.2, on Mac OS X 10.13.6 17G2208, locale zh-Hans-CN)
[!] Android toolchain - develop for Android devices (Android SDK 28.0.3)
    ! Some Android licenses not accepted.  To resolve this, run: flutter doctor --android-licenses
[!] iOS toolchain - develop for iOS devices (Xcode 10.1)
    ✗ Verify that all connected devices have been paired with this computer in Xcode.
      If all devices have been paired, libimobiledevice and ideviceinstaller may require updating.
      To update with Brew, run:
        brew update
        brew uninstall --ignore-dependencies libimobiledevice
        brew uninstall --ignore-dependencies usbmuxd
        brew install --HEAD usbmuxd
        brew unlink usbmuxd
        brew link usbmuxd
        brew install --HEAD libimobiledevice
        brew install ideviceinstaller
[✓] Android Studio (version 3.1)
[✓] VS Code (version 1.30.2)
[✓] Connected device (1 available)

! Doctor found issues in 2 categories.
```

说明，Flutter SDK 已经安装成功。但是也可以看到 flutter 的报错，请按照报错的提示修复，例如：

- Android toolchain - develop for Android devices（Android证书的问题）

  运行`flutter doctor --android-licenses`修复

- iOS toolchain - develop for iOS devices（iOS的问题）
  
  ```
  [!] iOS toolchain - develop for iOS devices (Xcode 10.2)
    ✗ libimobiledevice and ideviceinstaller are not installed. To install with Brew, run:
        brew update
        brew install --HEAD usbmuxd
        brew link usbmuxd
        brew install --HEAD libimobiledevice
        brew install ideviceinstaller
    ✗ ios-deploy not installed. To install:
        brew install ios-deploy
    ✗ CocoaPods not installed.
        CocoaPods is used to retrieve the iOS platform side's plugin code that responds to your plugin usage on the Dart side.
        Without resolving iOS dependencies with CocoaPods, plugins will not work on iOS.
        For more info, see https://flutter.io/platform-plugins
      To install:
        brew install cocoapods
        pod setup
  ```
  
  这里列出了出现的问题，并且给出了解决方案，需要你按照提示运行相应的命令。
  
## Flutter IDE 


### Android Studio

我们知道 Android Studio 是用来开发 Android 的，但是也可以开发 Flutter。

#### 安装 Android Studio

版本要求：
- [Android Studio](https://developer.android.com/studio) 3.0 及以后

#### 安装 Flutter 插件

1. 打开 Android Studio
2. 打开 plugin preferences (MacOS 是：**Android Studio > Preferences > Plugins** ,Windows 和 Linux 是： **File > Settings > Plugins** )。如下图：

![](https://user-gold-cdn.xitu.io/2019/2/16/168f41b6ffb5de6a?w=2274&h=1620&f=jpeg&s=306432)
3. 点击 **Browse repositories**, 搜索 **Flutter** ,如下图
    
![](https://user-gold-cdn.xitu.io/2019/2/16/168f41e4a19f2401?w=1872&h=1580&f=jpeg&s=363315)
    
4. 选中 Flutter 插件并点击 **Install** 安装。

    ![](https://user-gold-cdn.xitu.io/2019/3/19/1699368972105e96?w=1652&h=1362&f=jpeg&s=330127)
4. 安装完之后，点击 **Restart Android Studio** ，重启 Android Studio 。

    ![](https://user-gold-cdn.xitu.io/2019/3/19/16993695f8f1b4c2?w=1652&h=1362&f=jpeg&s=317623)

5. Android Studio 重启后，点击 **File > New** ，如果看到了 **New Flutter Project..** ，说明 Flutter 插件已经安装完成。


    ![](https://user-gold-cdn.xitu.io/2019/3/19/169936afe968d07b?w=1286&h=254&f=jpeg&s=104009)



### VS Code
VS Code 是一个轻量级编辑器，支持 Flutter 的开发。

#### 安装 VS Code
版本要求：
- [VS Code](https://code.visualstudio.com/) 最新稳定版

#### 安装 Flutter 插件
1. 打开 VS Code。

2. 点击 **View > Command Palette…** 或者快捷键 **Shift+cmd+P**(MacOS) /**Ctrl+Shift+P**(Windows、Linux)，打开命令面板。

3. 输入 **install**, 选择 **Extensions: Install Extensions**，如下图：

    ![](https://user-gold-cdn.xitu.io/2019/2/16/168f4317aa5711ce?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

4. 在 **Extensions** 的搜索框里输入 **Flutter**,如下图：

    ![](https://user-gold-cdn.xitu.io/2019/2/16/168f442d0a5c25f8?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

5. 选择 **Flutter** 并点击 **Install**。

    ![](https://user-gold-cdn.xitu.io/2019/3/19/169936fdfca764a7?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)
6. 安装完后，在点击 **Reload**，重启 VS Code，如下图：

    ![](https://user-gold-cdn.xitu.io/2019/3/19/1699370e89aea497?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

7. 点击 **View > Command Palette…**，或者快捷键 **Shift+cmd+P**(MacOS) /**Ctrl+Shift+P**(Windows、Linux)，打开命令面板。输入 **Flutter** ，如果看到如下图的 Flutter 命令，说明安装成功：

    ![](https://user-gold-cdn.xitu.io/2019/2/16/168f449300e52630?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

```!
本小册中的 Flutter 代码都是使用 VS Code 开发的。而且本小册在使用 VS Code 的过程中都会对 VS Code 的功能进行说明，所以不用担心自己不会使用 VS Code。
```






