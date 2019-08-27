#
#  Be sure to run `pod spec lint NeeSUIKitCategory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "NSDExtendTool"
  s.version      = "2.1.7"
  s.summary      = "快速搭建APP,自用"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                  意在便利日常开发，将日常中经常用到的代码块封装归类，内部使用了JSONModel源码并根据个人需求进行了修改
                   DESC

  s.homepage     = "https://github.com/NeeSDev"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = { :type => "MIT", :file => "LICENSE" }

  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "NeeSDev" => "niwei.develop@gmail.com" }
  # Or just: s.author    = "NeeSDev"
  # s.authors            = { "NeeSDev" => "niwei.develop@gmail.com" }
  # s.social_media_url   = "http://twitter.com/NeeSDev"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "9.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/NeeSDev/NSDExtendTool.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.public_header_files  = "NSDExtendTool.h"
  s.source_files  = "NSDExtendTool.h"

  
  #NSDUIKitCategory
  s.subspec 'NSDUIKitCategory' do |ss|
    ss.public_header_files = 'NSDUIKitCategory/NSDUIKitCategory.h'
    ss.source_files = 'NSDUIKitCategory/NSDUIKitCategory.h'

    ss.subspec 'ControllerCategory' do |sss|
      sss.source_files = 'NSDUIKitCategory/ControllerCategory/*.{h,m}'
      sss.public_header_files = 'NSDUIKitCategory/ControllerCategory/*.h'
    end

    ss.subspec 'DataCategory' do |sss|
      sss.source_files = 'NSDUIKitCategory/DataCategory/*.{h,m}'
      sss.public_header_files = 'NSDUIKitCategory/DataCategory/*.h'
    end

    ss.subspec 'ViewCategory' do |sss|
      sss.source_files = 'NSDUIKitCategory/ViewCategory/*.{h,m}'
      sss.public_header_files = 'NSDUIKitCategory/ViewCategory/*.h'
    end
  end

  #NSDDataExtend
  s.subspec 'NSDDataExtend' do |ss|
    ss.public_header_files = 'NSDDataExtend/NSDDataExtend.h'
    ss.source_files = 'NSDDataExtend/NSDDataExtend.h'

    ss.subspec 'KeychainAccess' do |sss|
      sss.source_files = 'NSDDataExtend/KeychainAccess/*.{h,m}'
      sss.public_header_files = 'NSDDataExtend/KeychainAccess/*.h'
    end
  end

   #NSDCustomView
  s.subspec 'NSDCustomView' do |ss|
    # ss.public_header_files = 'NSDCustomView/NSDCustomView.h'
    # ss.source_files = 'NSDCustomView/NSDCustomView.h'

      #工程依赖的第三方库

    # ss.subspec 'CircleSlideView' do |sss|
      ss.source_files = 'NSDCustomView/**/*.{h,m}'
      ss.public_header_files = 'NSDCustomView/**/*.h'
    # end
  end

  #NSDProjectBase
  s.subspec 'NSDProjectBase' do |ss|
    ss.public_header_files = 'NSDProjectBase/NSDProjectBase.h'
    ss.source_files = 'NSDProjectBase/NSDProjectBase.h'  #工程依赖的第三方库

    ss.subspec 'ViewController' do |sss|
      sss.source_files = 'NSDProjectBase/ViewController/*.{h,m}'
      sss.public_header_files = 'NSDProjectBase/ViewController/*.h'
    end

    ss.subspec 'DataBase' do |sss|
      sss.source_files = 'NSDProjectBase/DataBase/*.{h,m}'
      sss.public_header_files = 'NSDProjectBase/DataBase/*.h'

      sss.requires_arc = false;
      sss.requires_arc = ['NSDProjectBase/DataBase/NSDStore.m']
    end

    ss.subspec 'HttpBase' do |sss|
      sss.source_files = 'NSDProjectBase/HttpBase/*.{h,m}'
      sss.public_header_files = 'NSDProjectBase/HttpBase/*.h'
    end

    ss.dependency 'NSDExtendTool/NSD_JSONModel'

  end

  #NSDUIKitSubclass
  s.subspec 'NSDUIKitSubclass' do |ss|
    ss.public_header_files = 'NSDUIKitSubclass/NSDUIKitSubclass.h'
    ss.source_files = 'NSDUIKitSubclass/NSDUIKitSubclass.h'

    ss.subspec 'TextView' do |sss|
      sss.source_files = 'NSDUIKitSubclass/TextView/*.{h,m}'
      sss.public_header_files = 'NSDUIKitSubclass/TextView/*.h'
    end
  end

  #NSDUIKitSubclass
  s.subspec 'NSD_JSONModel' do |ss|
    ss.public_header_files = 'NSD_JSONModel/JSONModelLib.h'
    ss.source_files = 'NSD_JSONModel/JSONModelLib.h'

    ss.subspec 'JSONModel' do |sss|
      sss.source_files = 'NSD_JSONModel/**/*.{h,m}'
      sss.public_header_files = 'NSD_JSONModel/**/*.h'
    end
  end


  s.dependency 'ReactiveObjC', '~> 3.1.0'  #工程依赖的第三方库
  s.dependency 'MyLayout', '~> 1.6.1'
  s.dependency "AFNetworking", "~> 3.2.1"  #工程依赖的第三方库

  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
