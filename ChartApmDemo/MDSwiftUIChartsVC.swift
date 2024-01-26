//
//  MDSwiftUIChartsVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/26.
//

import UIKit
import SwiftUI
import SwiftUICharts

class MDSwiftUIChartsVC: UIViewController {

//    var chartView: BarChartView!
//    
//    let highIntensity = Legend(color: .orange, label: "High Intensity", order: 5)
//    let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
//    let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
//    let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
//    let low = Legend(color: .gray, label: "Low", order: 1)
//    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        
//        let list = [low, warmUp, fatBurning, buildFitness, highIntensity]
//        
//        let values = (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 })
//        let points = values.map({
//            DataPoint(value: $0, label: "", legend: list[values.count % list.count])
//        })
//        chartView = SwiftUICharts.BarChartView(dataPoints: points)
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
