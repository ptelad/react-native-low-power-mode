package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.description  = package['description']
  s.author       = package['author']
  s.homepage     = package['repository']['url']
  s.license      = package['license']
  s.platform     = :ios, '7.0'
  s.source       = { git: 'https://github.com/ptelad/react-native-low-power-mode.git', tag: 'master' }
  s.source_files = 'ios/**/*.{h,m}'
  s.requires_arc = true

  s.dependency 'React'
end