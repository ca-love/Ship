Pod::Spec.new do |s|
  s.name             = 'Ship'
  s.version          = '1.0.0'
  s.swift_version    = '5.10'
  s.summary          = 'Ship is a APIKit plugin that can inject common processing to requests on APIKit.'
  s.homepage         = 'https://github.com/cats-oss/Ship'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kyohei Ito' => 'ito_kyohei@cyberagent.co.jp' }
  s.source           = { :git => 'https://github.com/cats-oss/Ship.git', :tag => s.version.to_s }
  s.ios.deployment_target       = '16.0'
  s.tvos.deployment_target      = '16.0'
  s.osx.deployment_target       = '13.0'
  s.watchos.deployment_target   = '9.0'
  s.source_files     = 'Ship/**/*.{h,swift}'
  s.requires_arc     = true
  s.dependency "APIKit", "~> 5.4"
end
