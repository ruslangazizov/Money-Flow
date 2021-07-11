//
//  StatisticsViewController.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 06.07.2021.
//
import Foundation
import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var chartView: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var monthButton: UIBarButtonItem!
    
    @IBOutlet weak var getbackButton: UIButton!
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var monthPicker: UIPickerView!
    
    @IBOutlet weak var visualeffectView: UIVisualEffectView!
    
    @IBOutlet weak var currentChart: UILabel!
    
    var effect: UIVisualEffect!
    
    var months: [String] = ["Расходы за всё время","Январь", "Февраль" ,"Март" ,"Апрель" ,"Май" ,"Июнь" ,"Июль", "Август" , "Сентябрь", "Октябрь" ,"Ноябрь" , "Декабрь"]
    
    var selectedMonth: String!
    

    

    
    
    let pieChartView = PieChartView()
    
//    var expenseOperations: [ExpenseInfo] = [ExpenseInfo(categoryName: "Транспорт", name: "Шина", date: "25.06.2021", icon:"🚘" , cost: 1000),
//                                           ExpenseInfo(categoryName: "Продукты", name: "Бургер", date: "12.05.2021", icon:"🍔" , cost:600),
//                                           ExpenseInfo(categoryName: "Шоппинг", name: "Одежда", date: "05.06.2021", icon:"🛍" , cost: 6000),
//                                           ExpenseInfo(categoryName: "Здоровье", name: "Таблетки", date: "21.06.2021", icon:"💊" , cost: 1500),
//                                           ExpenseInfo(categoryName: "Кафе", name: "Завтрак", date: "22.06.2021", icon:"🍽" , cost: 1000),
//                                           ExpenseInfo(categoryName: "Дом", name: "Стол", date: "14.03.2021", icon:"🏠" , cost: 5000)]
//
//    
    
    
    
    @IBAction func monthButtonAction(_ sender: Any) {
        animateIn()
        
    
    
    }
    
    @IBAction func getbackButtonAction(_ sender: Any) {
        
    animateOut()
        
    
    }
    
    func animateIn() {
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        
        popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
        } )
        
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupView.alpha = 0
            self.visualeffectView.effect = nil
        }){ (success: Bool) in
            self.popupView.removeFromSuperview()
            
        }
    }

    func makeNumberMonth(month:String) -> String {
        switch month {
        case "Январь":
            return "01"
        case "Февраль":
            return "02"
        case "Март":
            return "03"
        case "Апрель":
            return "04"
        case "Май":
            return "05"
        case "Июнь":
            return "06"
        case "Июль":
            return "07"
        case "Август":
            return "08"
        case "Сентябрь":
            return "09"
        case "Октябрь":
            return "10"
        case "Ноябрь":
            return "11"
        case "Декабрь":
            return "12"
        default:
            return "01"
        }
    }
    func drawCurrentChart(month:String)  {
        if month == "Расходы за всё время" {
            
            var myImage = UIImage(named: "Заглушка")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            chartView.layer.cornerRadius = 13
            
            
            let padding: CGFloat = 40
            let height = chartView.frame.height - padding

            pieChartView.frame = CGRect(
              x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
            )

            pieChartView.segments = makeLabelledSegmentArray()
            
            
            pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
            pieChartView.tintColor.rgbaComponents

            chartView.addSubview(pieChartView)
            chartView.layer.cornerRadius = 13
            
            tableView.reloadData()
        } else {
        
        var count: CGFloat = 0
        var chartElements:[LabelledSegment] = []
        
        var temporary: [ExpenseInfo] = []
        
        temporary = DataBase.getExpensesArrayIn(category: "Транспорт")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), name: "🚘", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        
        temporary = DataBase.getExpensesArrayIn(category: "Шоппинг")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), name: "🛍", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Продукты")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🍌", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Здоровье")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1), name: "💊", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Кафе")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), name: "🍽", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Дом")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🏠", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        if chartElements.count > 0{
            
            var myImage = UIImage(named: "Заглушка")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            chartView.layer.cornerRadius = 13
            
//            print("zashel v prorosovku")
            
            let padding: CGFloat = 40
            let height = chartView.frame.height - padding
            
            pieChartView.frame = CGRect(
              x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
            )
            pieChartView.segments.removeAll()

            let answer =  chartElements
             .sorted{ $0.value > $1.value }
            
            
            
            pieChartView.segments = answer
            
            
            pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
            pieChartView.tintColor.rgbaComponents

            chartView.addSubview(pieChartView)
            

            tableView.reloadData()
//            tableView.delegate = self
//            tableView.dataSource = self
        
        } else {
            
            pieChartView.segments.removeAll()
            
            
            
            var myImage = UIImage(named: "Заглушка")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            
            
             myImage = UIImage(named: "Пусто")!
             myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            
            tableView.reloadData()

            
        }
            
        }
         
        
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        //
        super.viewDidLoad()

        monthPicker.dataSource = self
        monthPicker.delegate = self
        
        effect = visualeffectView.effect
        
        visualeffectView.effect = nil
        
        popupView.layer.cornerRadius = 13
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let padding: CGFloat = 40
        let height = chartView.frame.height - padding

        pieChartView.frame = CGRect(
          x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
        )

        pieChartView.segments = makeLabelledSegmentArray()
        
        
        pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
        pieChartView.tintColor.rgbaComponents

        chartView.addSubview(pieChartView)
        chartView.layer.cornerRadius = 13
        
        currentChart.text = "Расходы за всё время (\(Int(DataBase.getTotalExpenses()))$)"
        


        // Do any additional setup after loading the view.
    }
    
    func makeLabelledSegmentArray() -> [LabelledSegment] {
        var array: [LabelledSegment] = []
        
        
       var k = DataBase.getTotalExpensesIn(category: "Транспорт")
        if k > 0 {
            array.append(LabelledSegment(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), name: "🚘", value: k))
        }
        
         k = DataBase.getTotalExpensesIn(category: "Шоппинг")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), name: "🛍", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Продукты")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🍌", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Здоровье")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1), name: "💊", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Кафе")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), name: "🍽", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Дом")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🏠", value: k))
         }
        
       let answer =  array
        .sorted{ $0.value > $1.value }
        
        
     return answer
        
    }
    
    
    func findOverall (array: [LabelledSegment]) -> CGFloat {
        var answer: CGFloat = 0
        
        for i in array {
           answer += i.value
        }
        return answer
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StatisticsViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pieChartView.segments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let k = findOverall(array: pieChartView.segments)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsTableViewCell", for: indexPath) as?
                StatisticsTableViewCell else {return UITableViewCell() }
        cell.setData(expense: pieChartView.segments[indexPath.row], overall: k )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
}

extension StatisticsViewController: UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        months.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return months[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let  month = months[row]
        let k = makeNumberMonth(month: month)
        if month == "Расходы за всё время" {
            currentChart.text = "\(month)  \(Int(DataBase.getTotalExpenses()))$ "
            selectedMonth = month
        } else{
            currentChart.text = "\(month) (Потрачено: \(Int(DataBase.getMonthExpensesIn(month: k)))$) "
            selectedMonth = month
        }
        
        drawCurrentChart(month: selectedMonth)

    }
    
    
    
}






//let rectSize = CGRect(x: 0,y: 0,width: 400,height: 400)
//        let centrePointOfChart = CGPoint(x: rectSize.midX,y: rectSize.midY)
//        let radius: CGFloat = 100
//        let piePieces = [(UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: 250, endAngle: 360),UIColor.brown),
//                         (UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: 0, endAngle: 200),UIColor.orange),
//                         (UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: 200, endAngle: 250),UIColor.lightGray)]
//
//        pieChart(pieces: piePieces, viewRect: CGRect(x: 35, y: 50, width: 400, height: 400))
//
//        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//        let image = renderer.image { ctx in pieChart(pieces: piePieces, viewRect: CGRect(x: 0,y: 0,width: 400,height: 400)).drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//        }
//        chartView.image = image
//
//        chartView.image = UIImage(named: "Car") ?? UIImage()
//
//        chartView.image = image
//
//        chartView.image = UIImage(named: "Car") ?? UIImage()
//
