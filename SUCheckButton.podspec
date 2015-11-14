Pod::Spec.new do |s|
  s.name             = "SUCheckButton"
  s.version          = "0.1.0"
  s.summary          = "light-weight check button in Swift."

  s.description      = <<-DESC
light-weight check button in Swift.
                       DESC

  s.homepage         = "https://github.com/sgr-ksmt/SUCheckButton"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Su-" => "su@sfidante.co.jp" }
  s.source           = { :git => "https://github.com/sgr-ksmt/SUCheckButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SUCheckButton' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
