Pod::Spec.new do |s|
    s.name             = 'StanwoodUITestingCore'
    s.version          = '1.0.0'
    s.summary          = 'StanwoodUITestingCore records view events.'
    
    s.description      = <<-DESC
    StanwoodUITestingCore records view events to draw a view hierarchy to support StanwoodUITesting tool.
    DESC
    
    s.homepage         = 'https://github.com/stanwood/StanwoodUITestingCore_iOS'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Tal Zion' => 'talezion@gmail.com' }
    s.source           = { :git => 'https://github.com/stanwood/StanwoodUITestingCore_iOS.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '10.0'
    s.swift_version = '4.0'
    
    s.source_files = 'StanwoodUITestingCore/Classes/**/*'
end
