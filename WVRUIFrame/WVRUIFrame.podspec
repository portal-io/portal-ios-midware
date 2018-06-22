Pod::Spec.new do |s|
    s.name         = 'WVRUIFrame'
    s.version      = '0.1.6'
    s.summary      = 'WVRUIFrame files'
    s.homepage     = 'http://git.moretv.cn/whaley-vr-ios-midware/WVRUIFrame'
    s.license      = 'MIT'
    s.authors      = {'whaleyvr' => 'vr-iosdev@whaley.cn'}
    s.platform     = :ios, '9.0'

    SQKit   = { :spec_name => "SQKit",:source_files => ['WVRUIFrame/Core/SQKit/**/*'] }
    WVRUIFrameModel       = { :spec_name => "Model", :source_files => ['WVRUIFrame/Core/Model/**/*']}
    WVRUIFrameView        = { :spec_name => "View", :source_files => ['WVRUIFrame/Core/View/**/*'], :sub_dependency => [SQKit] }
    WVRUIFrameViewModel   = { :spec_name => "ViewModel" ,:source_files => ['WVRUIFrame/Core/ViewModel/**/*'], :sub_dependency => [SQKit] }
    WVRUIFramePresenter   = { :spec_name => "Presenter", :source_files => ['WVRUIFrame/Core/Presenter/**/*'], :sub_dependency => [WVRUIFrameView] }
    WVRAdapter            = { :spec_name => "Adapter", :source_files => ['WVRUIFrame/Core/Adapter/**/*'], :sub_dependency => [SQKit] }
    WVRAnnotation         = { :spec_name => "Annotation", :source_files => ['WVRUIFrame/Core/Annotation/**/*'], :sub_dependency => [WVRUIFramePresenter, WVRUIFrameViewModel] }
    
    $animations = [WVRUIFrameModel, WVRUIFrameView, WVRUIFrameViewModel, WVRUIFramePresenter, SQKit, WVRAdapter, WVRAnnotation]

    $animations.each do |spec|
        s.subspec spec[:spec_name] do |ss|

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
    s.source       = {:git => 'https://git.moretv.cn/whaley-vr-ios-midware/WVRUIFrame.git', :tag => s.version}
    s.source_files = "WVRUIFrame/Core/WVRUIFrameHeader.h"
    # s.subspec "Transformer" do |ss|
    #   ss.source_files = ["Pod/Classes/YTXGooeyCircleLayer.{h,m}", "Pod/Classes/YTXCountDownShowLayer.{h,m}"]
    # end
    s.requires_arc = true

end

    

    

    