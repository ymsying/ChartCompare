//
//  SwiftUIChartsVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import SwiftUICharts
import SwiftUI

//https://github.com/willdale/SwiftUICharts

class WLSwiftUIChartsVC: UIViewController {

    @IBOutlet weak var btnShow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let points = (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 }).map({
            BarChartDataPoint(value: $0)
        })
        var chartView = SwiftUICharts.BarChart(chartData: BarChartData(dataSets: BarDataSet(dataPoints: points, legendTitle: "title")))
        let hostingController = UIHostingController(rootView: chartView)
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        hostingController.didMove(toParent: self)
        
        view.bringSubviewToFront(btnShow)
    }
    
    @IBAction func showChart() {
        
    }
}
