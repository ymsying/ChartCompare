//
//  AAChartVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import AAInfographics

class AAChartVC: UIViewController {
    @IBOutlet var aaChartView: AAChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        aaChartView.isScrollEnabled = false
    }
    
    @IBAction func showChart() {
         let  aaChartModel = AAChartModel()
 //            .title("执行由 JavaScript 字符串映射转换成的 js function 函数")//图形标题
 //            .subtitle("巧妙地将JavaScript字符串转换为function并执行")//图形副标题
//             .dataLabelsEnabled(true)//是否显示数字
             .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
         
        aaChartModel
            .chartType(.column)
            .stacking(.normal)
//            .dataLabelsEnabled(true)
//            .tooltipEnabled(false)
//            .categories([
//                "孤<br>岛<br>危<br>机",
//                "使<br>命<br>召<br>唤",
//                "荣<br>誉<br>勋<br>章",
//                "狙<br>击<br>精<br>英",
//                "神<br>秘<br>海<br>域",
//                "最<br>后<br>生<br>还<br>者",
//                "巫<br>师<br>3<br>狂<br>猎",
//                "对<br>马<br>之<br>魂",
//                "蝙<br>蝠<br>侠<br>阿<br>甘<br>骑<br>士<br> .",
//                "地<br>狱<br>边<br>境",
//                "闪<br>客",
//                "忍<br>者<br>之<br>印"
//            ])
//            .zoomType(.x)//‼️ 重要属性,需要支持 X 轴横向滚动
//            .yAxisMax(650)
            .series([
                AASeriesElement()
                    .name("伦敦")
//                    .data([82.89,67.54,62.07,59.43,67.02,67.09,35.66,71.78,81.61,78.85,79.12,72.30,
//                           82.89,67.54,62.07,59.43,67.02,67.09,35.66,71.78,81.61,78.85,79.12,72.30,
//                           82.89,67.54,62.07,59.43,67.02,67.09,35.66,71.78,81.61,78.85,79.12,72.30,
//                           82.89,67.54,62.07,59.43,67.02,67.09,35.66,71.78,81.61,78.85,79.12,72.30,])
                    .data((0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 }))
                    .dataLabels(AADataLabels()
                        .enabled(true)
                        .style(AAStyle()
                            .color("#555555")
                            .fontSize(11)
                        )
                    )
                ,
//                AASeriesElement()
//                    .name("东京")
//                    .dataLabels(AADataLabels()
//                        .enabled(true)
//                        .style(AAStyle()
//                            .color("#555555")
//                            .fontSize(11)
//                        )
//                    )
//                    .data([198.66,330.81,151.95,160.12,222.56,229.05,128.53,250.91,224.47,473.99,126.85,260.50])
//                ,
//                AASeriesElement()
//                    .name("总销量")
//                    .type(.line)
//                    .dataLabels(AADataLabels()
//                        .enabled(true)
//                        .style(AAStyle()
//                            .color("#555555")
//                            .fontSize(15)
//                        )
//                    )
//                    .data([281.55,398.35,214.02,219.55,289.57,296.14,164.18,322.69,306.08,552.84,205.97,332.79])
//                ,
            ])
        
        let aaOptions = aaChartModel.aa_toAAOptions()
//        aaOptions.tooltip?.followTouchMove(false)
//        aaOptions.xAxis?.minRange(2)
//        
        aaChartView.aa_drawChartWithChartOptions(aaOptions)
         
         
         
     }
}
