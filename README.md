## NSDExtendTool

个人快速构建APP，各种方法的封装，便利日常开发

依赖第三方列表：
* ['ReactiveObjC', '~> 3.1.0'](https://reactivecocoa.io)
* ['MyLayout', '~> 1.6.1'](https://github.com/youngsoft/MyLinearLayout)
* ['AFNetworking', '~> 3.2.1'](https://github.com/AFNetworking/AFNetworking)

使用并修改的第三方源码：
* ['JSONModel', ~> '1.8.0'](http://www.jsonmodel.com)

## 使用方法

### 直接拷贝
1.  将github工程中的想要用到的功能对应文件夹下的所有文件复制到您的工程中。
2.  将与文件夹同名的头文件放入到您的pch文件中，或者在需要使用界面布局的源代码位置。

### CocoaPods安装

如果您还没有安装cocoapods则请先执行如下命令：
```
$ gem install cocoapods
```

为了用CocoaPods整合NSDExtendTool到您的Xcode工程, 请建立如下的Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'

pod 'NSDExtendTool'
```
   
然后运行如下命令:

```
$ pod install
```

## 版本历史
具体请查看 **[CHANGELOG.md](CHANGELOG.md)**
