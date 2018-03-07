#
# Be sure to run `pod lib lint StanwoodUITestingCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'StanwoodUITestingCore'
    s.version          = '0.1.1'
    s.summary          = 'StanwoodUITestingCore records view events.'
    
    s.description      = <<-DESC
    StanwoodUITestingCore records view events to draw a view hierarchy to support StanwoodUITesting tool
    DESC
    
    s.homepage         = 'https://github.com/stanwood/StanwoodUITestingCore_iOS'
    s.license          = { :type => 'Private', :file => 'LICENSE' }
    s.author           = { 'Tal Zion' => 'talezion@gmail.com' }
    s.source           = { :git => 'git@github.com:stanwood/StanwoodUITestingCore_iOS.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '10.0'
    
    s.source_files = 'StanwoodUITestingCore/Classes/**/*'
end
