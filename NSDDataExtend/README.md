## NSDDataExtend

常用的一些数据处理、转换的方法封装

## 使用方法

### 直接拷贝
1.  将github工程中的NSDDataExtend文件夹下的所有文件复制到您的工程中。
2.  将`#import "NSDDataExtend.h"`头文件放入到您的pch文件中，或者在需要使用界面布局的源代码位置。

### CocoaPods安装

如果您还没有安装cocoapods则请先执行如下命令：
```
$ gem install cocoapods
```

为了用CocoaPods整合NeeSUIKitCategory到您的Xcode工程, 请建立如下的Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

pod 'NSDDataExtend'
```
   
然后运行如下命令:

```
$ pod install
```

## 版本历史
具体请查看 **[CHANGELOG.md](CHANGELOG.md)**
