Pod::Spec.new do |s|
  s.name             = "SUCheckButton"
  s.version          = "0.2.0"
  s.summary          = "light-weight check button in Swift."

  s.description      = <<-DESC
light-weight check button in Swift.
Equip @IBInspectable, @IBDesignable.
SUCheckButton is Subclass of UIControl.
                       DESC
  s.homepage         = "https://github.com/sgr-ksmt/SUCheckButton"
  s.screenshots     = "https://raw.githubusercontent.com/sgr-ksmt/SUCheckButton/master/screenshots/screenshot1.png"
  s.license          = 'MIT'
  s.author           = { "Suguru Kishimoto" => "melodydance.k.s@gmail.com" }
  s.source           = { :git => "https://github.com/sgr-ksmt/SUCheckButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
