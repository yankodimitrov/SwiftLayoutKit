Pod::Spec.new do |s|

  s.name         = "SwiftLayoutKit"
  s.version      = "0.1.2"
  s.summary      = "An elegant and simple way to build your auto layout constraints"

  s.description  = <<-DESC
                   Produce auto layout constraints by expressing the relations between the layout attributes of your views or by using the visual format language.
                   DESC

  s.homepage     = "https://github.com/yankodimitrov/SwiftLayoutKit"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.author       = { "Yanko Dimitrov" => "yanko@yankodimitrov.com" }
  s.social_media_url   = "https://twitter.com/_yankodimitrov"

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/yankodimitrov/SwiftLayoutKit.git", :tag => "v#{s.version}" }
  s.source_files  = "SwiftLayoutKit/*.swift"
  
  s.requires_arc = true

end
