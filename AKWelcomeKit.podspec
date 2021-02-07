#
# Be sure to run `pod lib lint AKWelcomeKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AKWelcomeKit'
  s.version          = '1.0.0'
  s.summary          = 'Easy to add functional preview to any iOS application.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  AKWelcomeKit makes it easy to add functional preview to any iOS application. AKWelcomeKit allows you to quickly add a highly customizable preview interface to your app, all in a lightweight framework.
                       DESC

  s.homepage         = 'https://github.com/ranix-k/AKWelcomeKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexey' => 'alexeykostenko98@gmail.com' }
  s.source           = { :git => 'https://github.com/ranix-k/AKWelcomeKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'AKWelcomeKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AKWelcomeKit' => ['AKWelcomeKit/Assets/*.png']
  # }

  s.frameworks = 'UIKit'
end
