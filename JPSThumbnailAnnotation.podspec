Pod::Spec.new do |s|
  s.name     = 'JPSThumbnailAnnotation'
  s.version  = '1.0.0'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'A simple mapkit annotation for displaying images and details which use sdwebimage.'
  s.homepage = 'http://garixi.com'
  s.author   = { 'Garixi' => 'garixi@garixi.com' }
  s.source   = { :git => 'https://github.com/garixi/JPSThumbnailAnnotation.git', :tag => s.version.to_s }

  s.description = 'JPSThumbnailAnnotation is a simple mapkit annotation view for displaying images with clean design and animations.'

  s.source_files = 'JPSThumbnailAnnotation/*.{h,m}'
  s.frameworks   = 'QuartzCore', 'MapKit', 'CoreLocation'
  s.dependency   = 'SDWebImage'
  s.requires_arc = true
end
