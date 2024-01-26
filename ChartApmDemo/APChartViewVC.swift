//
//  ChartViewVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import SwiftUICharts
import SwiftUI

// https://github.com/AppPear/ChartView

class APChartViewVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let points = (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 })
//        var chartView = SwiftUICharts.BarChartView(data: ChartData(points: points), title: "Title", form: ChartForm.small)
//        let hostingController = UIHostingController(rootView: chartView)
//        addChild(hostingController)
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(hostingController.view)
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        hostingController.didMove(toParent: self)
    }
    
    
    @IBAction func showChart() {
        
    }
}
