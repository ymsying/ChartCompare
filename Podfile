# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


target 'ChartApmDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DGChartsDemo
  # # 图标绘制
  pod 'DGCharts'
  pod 'FLCharts'
  pod 'AAInfographics', :git => 'https://github.com/AAChartModel/AAChartKit-Swift.git'
  pod 'Highcharts'
  pod 'XYChart'
  
#  pod 'YYKit'
#  pod 'GodEye', :configurations => ['Debug'], :git => 'git@github.com:zixun/GodEye.git'
  pod 'DoraemonKit', :subspecs => ['Foundation', 'Core', 'WithMultiControl']
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
