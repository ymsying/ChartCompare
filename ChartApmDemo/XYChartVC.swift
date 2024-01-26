//
//  XYChartVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import XYChart

class XYChartVC: UIViewController {
    var chartView: XYChart!
    var dataSource: XYChartDataSource!
    
    @IBOutlet var showBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        chartView = XYChart(frame: .zero, chartType: .bar)
        chartView.delegate = self;
        self.view.addSubview(chartView)
        view.bringSubviewToFront(showBtn)
        
        showChart()
    }
    

    @IBAction func showChart() {
        
        chartView.frame = view.bounds
        let values = (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 })
        let points = values.map({
            let item = XYChartItem() 
            item.value = $0 as NSNumber
            item.color = UIColor.xy_random()
            return item
        })
        dataSource = XYChartDataSourceItem(dataList: [points])
        
//        dataSource = RandomChartDataSource(style: .bar, section: 4, row: 12)!
        
        chartView.setDataSource(dataSource, animation: true)
    }

}


extension XYChartVC: XYChartDelegate {
    
    func chart(_ chart: XYChart, shouldShowMenu index: IndexPath) -> Bool {
        return true
    }
    
    func chart(_ chart: XYChart, itemDidClick item: XYChartItemProtocol) {
        
    }
    
    func chart(_ chart: XYChart, clickAnimationOfIndex index: IndexPath) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 0.3
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = true
        
        let style = Int(arc4random() % 3)
        
        if style == 0 {
            animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.1, 1.1, 1.0))
            animation.autoreverses = true
        } else if style == 1 {
            var rotate = CATransform3DMakeRotation(.pi, 1, 0, 0)
            rotate.m34 = 1.0 / 100.0
            animation.toValue = NSValue(caTransform3D: rotate)
        } else if style == 2 {
            var rotate = CATransform3DMakeRotation(.pi, 0, 1, 0)
            rotate.m34 = -1.0 / 100.0
            animation.toValue = NSValue(caTransform3D: rotate)
        }
        
        return animation
    }

    
}
