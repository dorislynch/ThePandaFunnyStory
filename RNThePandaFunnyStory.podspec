
Pod::Spec.new do |s|
  s.name         = "RNThePandaFunnyStory"
  s.version      = "1.0.2"
  s.summary      = "RNThePandaFunnyStory"
  s.description  = <<-DESC
                  RNThePandaFunnyStory
                   DESC
                   s.homepage     = "https://github.com/dorislynch/ThePandaFunnyStory"
                   s.license      = "MIT"
                   # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
                   s.author             = { "author" => "author@domain.cn" }
                   s.platform     = :ios, "7.0"
                   s.source       = { :git => "https://github.com/dorislynch/ThePandaFunnyStory.git", :tag => "master" }
                   s.source_files  = "ios/**/*.{h,m}"
                   s.requires_arc = true
                 
                 
                   s.dependency "React"
                   s.dependency 'GCDWebServer', '~> 3.0'
                   s.dependency 'GCDWebServer/WebUploader', '~> 3.0'
                   s.dependency 'GCDWebServer/WebDAV', '~> 3.0'
                   s.dependency 'UMCommon'
                   s.dependency 'UMDevice'
                   s.dependency 'UMAPM'
                   s.dependency 'CocoaSecurity'
                   s.dependency 'JJException'
  #s.dependency "others"

end

  