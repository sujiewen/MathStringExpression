Pod::Spec.new do |s|
s.name         = "SMathStringExpression"
s.version      = "1.0.3"
s.summary      = "MathStringExpression"
s.description  = <<-DESC
MathStringExpression
DESC
s.homepage     = "https://github.com/sujiewen/MathStringExpression.git"
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "quxingyi" => "quxingyi@outlook.com" }
s.social_media_url   = "https://github.com/qddnovo/MathStringExpression"
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/sujiewen/MathStringExpression.git", :tag => "#{s.version}" }
s.source_files  = "MathStringExpression", "MathStringExpression/MathStringExpression/**/*.{h,m}"
s.requires_arc = true
end
