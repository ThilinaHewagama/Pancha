Pod::Spec.new do |s|
  s.name             = 'Pancha'
  s.version          = '0.0.1'
  s.summary          = 'Collection of reusable utility methods and classes.'
 
  s.description      = <<-DESC
  Collection of reusable utililty methods and classes
                       DESC
 
s.framework = 'Foundation'

  s.homepage         = 'https://github.com/ThilinaHewagama/Pancha'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thilina Hewagama' => 'thilina3001@gmail.com' }
  s.source           = { :git => 'https://github.com/ThilinaHewagama/Pancha.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.requires_arc = true
  s.source_files  = "Pancha/**/*.{swift}"
  #s.resource  = "Pancha/**/*.{png.jpeg.jpg.storyboard,xib}"
 
end