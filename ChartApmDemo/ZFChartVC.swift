//
//  ZFChartVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit

class ZFChartVC: UIViewController {

     var chartView: ZFBarChart!
     @IBOutlet var showBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.chartView = ZFBarChart(frame: view.bounds)
        self.chartView.dataSource = self;
        self.chartView.delegate = self;
        self.chartView.isResetAxisLineMaxValue = true;
        self.chartView.topicLabel?.text = "xx小学各年级人数";
        self.chartView.unit = "人";
        view.addSubview(chartView)
        
        view.bringSubviewToFront(showBtn)
    }
    
    @IBAction func showChart() {
        
        chartView.strokePath()
    }

}

extension ZFChartVC: ZFGenericChartDataSource {
    func nameArray(in chart: ZFGenericChart!) -> [String]! {
        return (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 }).map({ "\($0)" })
//        return ["一年级", "二年级", "三年级", "四年级", "五年级", "六年级"];
    }
    
    func valueArray(in chart: ZFGenericChart!) -> [Any]! {
        return (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 }).map({ "\($0)" })
//        return ["123", "256", "300", "283", "490", "236"];
    }
    
    func axisLineMaxValue(in chart: ZFGenericChart!) -> CGFloat {
        //return CGFloat(chartYMax)
        return 500
    }
    
    func axisLineMinValue(in chart: ZFGenericChart!) -> CGFloat {
        return CGFloat(0)
    }
    
    func axisLineSectionCount(in chart: ZFGenericChart!) -> UInt {
        return 10
    }
}


extension ZFChartVC: ZFBarChartDelegate {
//    func gradientColorArray(in barChart: ZFBarChart!) -> [ZFGradientAttribute]! {
//        
//        let attribute = ZFGradientAttribute()
//        attribute.colors = [UIColor.red, UIColor.white]
//        attribute.locations = [0.5, 0.99]
//        return [attribute]
//    }
    
}
