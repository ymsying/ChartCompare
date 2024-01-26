//
//  DGChartVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/25.
//

import UIKit
import DGCharts
import DoraemonKit

class DGChartVC: UIViewController {

    @IBOutlet var chartView: BarChartView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DoraemonFPSOscillogramWindow.shareInstance().show()
        DoraemonCPUOscillogramWindow.shareInstance().show()
        DoraemonMemoryOscillogramWindow.shareInstance().show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        chartView.chartDescription.enabled = false
                
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        
        // ChartYAxis *leftAxis = chartView.leftAxis;
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        
        chartView.rightAxis.enabled = false
        
//        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        
        chartView.maxVisibleCount = 60
        
        
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
//        xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        leftAxisFormatter.negativeSuffix = " $"
        leftAxisFormatter.positiveSuffix = " $"
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.labelFont = .systemFont(ofSize: 10)
        rightAxis.labelCount = 8
        rightAxis.valueFormatter = leftAxis.valueFormatter
        rightAxis.spaceTop = 0.15
        rightAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4
//        chartView.legend = l
    }
    
    @IBAction func updateChartData() {
        
        let count = chartXCount
        let range = chartYMax
        self.setDataCount(count, range: range)
    }
    
    func setDataCount(_ count: Int, range: Int) {
        let start = 1
        
        let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(UInt32(mult))) + 10
            let entry: BarChartDataEntry
            if i == 3 {
                entry = BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
            } else {
                entry = BarChartDataEntry(x: Double(i), y: val)
            }
            return entry
//            let material = ChartColorTemplates.material()
//            let color = material[i % material.count]
//            return ColorBarChartDataEntry(color: color, entry: entry)
        }
        
        var set1: BarChartDataSet! = nil
        if let set = chartView.data?.first as? BarChartDataSet {
            set1 = set
            set1.replaceEntries(yVals)
//            set1.replaceEntries(yVals.map({ $0.entry }))
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
        } else {
//            set1 = BarChartDataSet(entries: yVals.map({ $0.entry }), label: "The year 2017")
            set1 = BarChartDataSet(entries: yVals, label: "The year 2017")
//            set1.colors = ChartColorTemplates.material()
//            set1.colors = yVals.map({ $0.color })
            set1.drawValuesEnabled = false
            
            let data = BarChartData(dataSet: set1)
            data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
            data.barWidth = 0.9
            chartView.data = data
        }
        
//        chartView.setNeedsDisplay()
    }

}
//
//class ColorBarChartDataEntry {
//    let color: NSUIColor
//    let entry: BarChartDataEntry
//    init(color: UIColor, entry: BarChartDataEntry) {
//        self.color = color
//        self.entry = entry
//    }
//}
