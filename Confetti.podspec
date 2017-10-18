Pod::Spec.new do |s|
  s.name             = 'Confetti'
  s.version          = '0.0.1'
  s.summary          = 'Easy Particle Emitter'
  s.homepage         = 'https://github.com/efremidze/Confetti'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'efremidze' => 'efremidzel@hotmail.com' }
  s.source           = { :git => 'https://github.com/efremidze/Confetti.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Sources/*.swift'
end
