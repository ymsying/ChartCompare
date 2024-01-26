//
//  HighCharVC.swift
//  ChartApmDemo
//
//  Created by Progremer on 2024/1/25.
//

import UIKit
import Highcharts

class HighCharVC: UIViewController {

    
    var configuration: [String: Any] = [
        "title":"Calories (Burned)",
        "subtitle": "",
        "unit": "kcal",
        "chartType": "column",
        "icon": "ic_whatshot",
        "exporting": false]
    
    var chartType: String!
    var data: [String : Any]!
    @IBOutlet weak var btnShow: UIButton!
    
    @IBOutlet var chartView: HIChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.chartView = HIChartView(frame: CGRect(x: 5.0, y: 5.0, width: self.view.frame.size.width - 20, height: 240.0))
        self.chartView.backgroundColor = UIColor.lightGray
//        self.chartView.viewController = self
        var tmpOptions = self.configuration
        tmpOptions["exporting"] = true
        do {
            let sourceName = "DataCaloriesOut"
            if let sourcePath = Bundle.main.path(forResource: sourceName, ofType: "json"),
                let sourceData = try? Data(contentsOf: URL(fileURLWithPath: sourcePath)),
                let sourceJson = try JSONSerialization.jsonObject(with: sourceData) as? [String: Any] {
                self.data = sourceJson
            }
        } catch {
            print("Error deserializing JSON: \(error)")
        }
        
//        let series = self.data["day"] as! [Int]
        view.bringSubviewToFront(btnShow)
    }
   
    @IBAction func showChart() {
        var tmpOptions = self.configuration
        let series = (0..<chartXCount).map({ _ in Double(arc4random_uniform(UInt32(chartYMax))) + 10 })
        self.chartView.options = OptionsProvider.provideOptions(forChartType: tmpOptions, series: series, type: "day")
    }
}

class OptionsProvider {
    
    class func provideOptions(forChartType options: [String: Any], series: [Any], type: String) -> HIOptions {
        var categories = [String]()
        var step: NSNumber?
        
        if type == "day" {
//            categories = ["12AM", "", "3AM", "", "6AM", "", "9AM", "", "12PM", "", "3PM", "", "6PM", "", "9PM", "", "12AM"]
            step = 1
        }
        
        if options["chartType"] as? String == "column" {
            let hioptions = HIOptions()
            
            let chart = HIChart()
            chart.backgroundColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 1], stops: [[0, "rgb(66, 218, 113)"], [1, "rgb(80, 140, 200)"]])
            chart.borderRadius = 6
            chart.type = (options["chartType"] as! String)
            chart.panning = HIPanning()
            chart.panning.enabled = true
            chart.panning.type = "x"
            chart.events = HIEvents()
            hioptions.chart = chart
            
            let exporting = HIExporting()
            exporting.enabled = (options["exporting"] as! NSNumber)
            hioptions.exporting = exporting
            
            let navigation = HINavigation()
            navigation.buttonOptions = HIButtonOptions()
            navigation.buttonOptions.theme = HITheme()
            navigation.buttonOptions.theme.fill = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
            hioptions.navigation = navigation
            
            let plotOptions = HIPlotOptions()
            plotOptions.column = HIColumn()
            plotOptions.column.color = HIColor(rgba: 255, green: 255, blue: 255, alpha: 0.6)
            plotOptions.column.borderRadius = HIBorderRadiusOptionsObject()
            plotOptions.column.borderRadius.radius = 2
            plotOptions.column.borderWidth = 0
            hioptions.plotOptions = plotOptions
            
            let credits = HICredits()
            credits.enabled = false
            hioptions.credits = credits
            
            let title = HITitle()
            title.text = (options["title"] as! String)
            title.align = "left"
            title.style = HICSSObject()
            title.style.fontFamily = "Arial"
            title.style.fontSize = "14px"
            title.style.color = "rgba(255, 255, 255, 0.6)"
            title.y = 16
            hioptions.title = title
            
            let subtitle = HISubtitle()
            subtitle.text = (options["subtitle"] as! String)
            if !subtitle.text.isEmpty {
                subtitle.text = subtitle.text + " total"
            }
            subtitle.align = "left"
            subtitle.style = HICSSObject()
            subtitle.style.fontFamily = "Arial"
            subtitle.style.fontSize = "10px"
            subtitle.style.color = "rgba(255, 255, 255, 0.6)"
            subtitle.y = 28
            hioptions.subtitle = subtitle
            
            let tooltip = HITooltip()
            tooltip.headerFormat = ""
//            tooltip.followTouchMove = false
            hioptions.tooltip = tooltip
            
            let xaxis = HIXAxis()
            xaxis.tickColor = HIColor(rgba: 255, green: 255, blue: 255, alpha: 0.0)
            xaxis.lineColor = HIColor(rgba: 255, green: 255, blue: 255, alpha: 0.3)
            xaxis.labels = HILabels()
            xaxis.labels.style = HICSSObject()
            xaxis.labels.style.color = "rgb(255, 255, 255)"
            xaxis.labels.style.textOutline = "10px Arial"
            xaxis.labels.step = step
//            xaxis.categories = categories
//            xaxis.min = 6
//            xaxis.max = 11
            hioptions.xAxis = [xaxis]
            
            let yaxis = HIYAxis()
            yaxis.lineWidth = 1
            yaxis.gridLineWidth = 0
            yaxis.lineColor = HIColor(rgba: 255, green: 255, blue: 255, alpha: 0.3)
            yaxis.labels = HILabels()
            yaxis.labels.style = HICSSObject()
            yaxis.labels.style.color = "rgb(255, 255, 255)"
            yaxis.labels.style.textOutline = "10px Arial"
            yaxis.labels.x = -5
            yaxis.title = HITitle()
            yaxis.title.text = ""
            hioptions.yAxis = [yaxis]
            
            let column = HIColumn()
            column.tooltip = HITooltip()
            column.tooltip.headerFormat = ""
            column.tooltip.valueSuffix = " kcal"
            column.showInLegend = false
            column.data = series
            column.name = (options["title"] as! String)
            hioptions.series = [column]
            
            return hioptions
        }
        
        
        return HIOptions()
    }
}
