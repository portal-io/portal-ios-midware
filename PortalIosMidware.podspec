#
#  Be sure to run `pod spec lint PortalIosMidware.podspec' to ensure this is a
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

  s.name         = "PortalIosMidware"
  s.version      = "0.0.1"
  s.summary      = "UIFrame."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                    UIFrame  框架
                   DESC

  s.homepage     = "https://github.com/portal-io/portal-ios-midware"
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

  s.author             = { "qbshen" => "shen.qingbo@whaley.cn" }
  # Or just: s.author    = "qbshen"
  # s.authors            = { "qbshen" => "shen.qingbo@whaley.cn" }
  # s.social_media_url   = "http://twitter.com/qbshen"

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

  s.source       = { :git => "https://github.com/portal-io/portal-ios-midware.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.subspec 'WVRUIFrame' do |cur|
    SQKit   = { :spec_name => "SQKit",:source_files => ['WVRUIFrame/WVRUIFrame/Core/SQKit/**/*'] }
    WVRUIFrameModel       = { :spec_name => "Model", :source_files => ['WVRUIFrame/WVRUIFrame/Core/Model/**/*']}
    WVRUIFrameView        = { :spec_name => "View", :source_files => ['WVRUIFrame/WVRUIFrame/Core/View/**/*'], :sub_dependency => [SQKit] }
    WVRUIFrameViewModel   = { :spec_name => "ViewModel" ,:source_files => ['WVRUIFrame/WVRUIFrame/Core/ViewModel/**/*'], :sub_dependency => [SQKit] }
    WVRUIFramePresenter   = { :spec_name => "Presenter", :source_files => ['WVRUIFrame/WVRUIFrame/Core/Presenter/**/*'], :sub_dependency => [WVRUIFrameView] }
    WVRAdapter            = { :spec_name => "Adapter", :source_files => ['WVRUIFrame/WVRUIFrame/Core/Adapter/**/*'], :sub_dependency => [SQKit] }
    WVRAnnotation         = { :spec_name => "Annotation", :source_files => ['WVRUIFrame/WVRUIFrame/Core/Annotation/**/*'], :sub_dependency => [WVRUIFramePresenter, WVRUIFrameViewModel] }
    
    $animations = [WVRUIFrameModel, WVRUIFrameView, WVRUIFrameViewModel, WVRUIFramePresenter, SQKit, WVRAdapter, WVRAnnotation]

    $animations.each do |spec|
        cur.subspec spec[:spec_name] do |ss|

            # specname = spec[:spec_name]

            # sources = ["WVRUIFrame/Core/#{specname}/**/*"]

            # ss.source_files = sources

            if spec[:source_files]
              ss.source_files = spec[:source_files]
            end
            if spec[:sub_dependency]
              spec[:sub_dependency].each do |dep|
                  ss.dependency "WVRUIFrame/#{dep[:spec_name]}"
              end
            end
            if spec[:dependency]
                spec[:dependency].each do |dep|
                    ss.dependency dep[:name], dep[:version]
                end
            end

        end
    end
    cur.source_files = "WVRUIFrame/Core/WVRUIFrameHeader.h"
    cur.requires_arc = true
  end
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
