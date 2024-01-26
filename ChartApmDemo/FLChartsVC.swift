//
//  FLChartsVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import FLCharts

class FLChartsVC: UIViewController {
    
    var chartView: FLChart!
    
    @IBOutlet var showBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let barChartData = FLChartData(title: "Consumptions",
                                       data: monthsData,
                                       legendKeys: [
                                        Key(key: "1", color: .white(0.9)),
                                        Key(key: "2", color: .white(0.9)),
                                        Key(key: "3", color: .white(0.9))],
                                       unitOfMeasure: "kWh")
        barChartData.xAxisUnitOfMeasure = "months"
        barChartData.yAxisFormatter = .decimal(2)
        chartView = FLChart(data: barChartData, type: .bar(highlightView: BarHighlightedView(), config: FLBarConfig(radius: .corners(corners: [.layerMaxXMinYCorner, .layerMinXMaxYCorner], 3), width: 30)))
        chartView.config = FLChartConfig(granularityY: 40, averageView: FLAverageViewConfig(lineWidth: 5, primaryFont: .systemFont(ofSize: 14, weight: .heavy), secondaryFont: .systemFont(ofSize: 13, weight: .bold), primaryColor: .orange, secondaryColor: .orange, lineColor: .orange.withAlphaComponent(0.9)))
        //        chartView.cartesianPlane.yAxisPosition = .none
        //        chartView.shouldScroll = false
        self.view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        view.bringSubviewToFront(showBtn)
    }
    
    
    
    @IBAction func showChart() {
        
    }
    
    var monthsData: [MultiPlotable] {
        var list: [MultiPlotable] = []
        (0..<chartXCount).forEach { _ in
            list.append(MultiPlotable(name: "dec", values: [55, 66, 32]))
        }
        return list
    }
}
