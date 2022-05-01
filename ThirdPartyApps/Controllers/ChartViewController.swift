import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var myView: UIView!
    
    private let lineChart = LineChartView()
    private let barChart = BarChartView()
    private let pieChart = PieChartView()
    private let barsChart = BarChartView()
    
    private let labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
    private let numOfX = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChart.delegate = self
        barChart.delegate = self
        pieChart.delegate = self
        barsChart.delegate = self
        
        addLineChart()
        addBarChart()
        addPieChart()
        addBarsChart()
        
        lineChart.isHidden = false
        barChart.isHidden = true
        pieChart.isHidden = true
        barsChart.isHidden = true
    }
    
    private func addLineChart() {
        var entries = [ChartDataEntry]()
        
        for i in 1...numOfX {
            entries.append(ChartDataEntry(x: Double(i), y: Double.random(in: 10...50)))
        }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        lineChart.data = LineChartData(dataSet: set)
        
        lineChart.frame = myView.bounds
        lineChart.clipsToBounds = true
        myView.addSubview(lineChart)
    }
    
    private func addBarChart() {
        var entries = [BarChartDataEntry]()
        
        for i in 1...numOfX {
            entries.append(BarChartDataEntry(x: Double(i), y: Double.random(in: 10...50)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        barChart.data = BarChartData(dataSet: set)
        
        barChart.frame = myView.bounds
        barChart.clipsToBounds = true
        myView.addSubview(barChart)
    }
    
    private func addPieChart() {
        var entries = [ChartDataEntry]()
        
        for i in 1...numOfX {
            entries.append(ChartDataEntry(x: Double(i), y: Double.random(in: 10...50)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        pieChart.data = PieChartData(dataSet: set)
        
        pieChart.frame = myView.bounds
        pieChart.clipsToBounds = true
        myView.addSubview(pieChart)
    }
    
    private func addBarsChart() {
        var data1 = [BarChartDataEntry]()
        var data2 = [BarChartDataEntry]()
        
        for i in 1...numOfX {
            data1.append(BarChartDataEntry(x: Double(i), y: Double.random(in: 10...50)))
            data2.append(BarChartDataEntry(x: Double(i), y: Double.random(in: 10...50)))
        }
        
        let set1 = BarChartDataSet(entries: data1, label: "Green")
        set1.colors = [.systemRed]
        
        let set2 = BarChartDataSet(entries: data2, label: "Blue")
        set2.colors = [.systemBlue]
        
        barsChart.data = BarChartData(dataSets: [set1, set2,])
        barsChart.legend.orientation = .vertical
        barsChart.legend.verticalAlignment = .bottom
        barsChart.legend.horizontalAlignment = .center
        barsChart.legend.yOffset = 10
        
        barsChart.xAxis.centerAxisLabelsEnabled = true
        barsChart.xAxis.labelPosition = .bottom
        barsChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.labels)
        barsChart.xAxis.granularity = 1
        
        let groupSpace = 0.3        // the space between two groups
        let barSpace = 0.05         // the space between two adjacent bars
        let barWidth = 0.3          // the width of the bars
        
        let groupCount = self.labels.count
        let startYear = 0
        
        barsChart.barData?.barWidth = barWidth
        barsChart.xAxis.axisMinimum = Double(startYear)
        
        let gg = barsChart.barData!.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        barsChart.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
        
        barsChart.xAxis.drawGridLinesEnabled = false
        barsChart.barData?.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        
        barsChart.frame = myView.bounds
        barsChart.clipsToBounds = true
        myView.addSubview(barsChart)
    }
    
    @IBAction func showLineChart(_ sender: Any) {
        lineChart.isHidden = false
        barChart.isHidden = true
        pieChart.isHidden = true
        barsChart.isHidden = true
    }
    
    @IBAction func showBarChart(_ sender: Any) {
        lineChart.isHidden = true
        barChart.isHidden = false
        pieChart.isHidden = true
        barsChart.isHidden = true
    }
    
    @IBAction func showPieChart(_ sender: Any) {
        lineChart.isHidden = true
        barChart.isHidden = true
        pieChart.isHidden = false
        barsChart.isHidden = true
    }
    
    @IBAction func showBarsChart(_ sender: Any) {
        lineChart.isHidden = true
        barChart.isHidden = true
        pieChart.isHidden = true
        barsChart.isHidden = false
    }
}
