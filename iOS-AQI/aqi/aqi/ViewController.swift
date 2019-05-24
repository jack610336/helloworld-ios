//
//  ViewController.swift
//  aqi
//
//  Created by Jack on 2018/12/4.
//  Copyright © 2018年 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aqiTabelView: UITableView!
    
    var timer: Timer!
    var refreshControl: UIRefreshControl!
    var aqiArray :[AQI]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aqiTabelView.dataSource = self
        aqiTabelView.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateData), for: UIControl.Event.valueChanged)
        aqiTabelView.addSubview(refreshControl)
        
        //MARK: - fetch data in the first time
        getData()
        
    }
}


//MARK: - Fetch AQI Data
extension ViewController {
    
    func getData() {
        if let url = URL(string: AQI_URL!) {
            
            let task = URLSession.shared.dataTask(with: url)
            {(data, response, error) in
                
                let decoder = JSONDecoder()
                
                if let data = data , let result = try? decoder.decode([AQI].self, from: data){
                    
                    self.aqiArray = result
                    DispatchQueue.main.async {
                        self.aqiTabelView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }
    
    @objc func updateData() {
        
        DispatchQueue.main.async {
            self.getData()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.refreshControl.endRefreshing()
            }
        }
    }
}


//MARK: - TableView Setting
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if aqiArray != nil {
            return self.aqiArray!.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if aqiArray != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "aqiCell", for: indexPath) as! AqiTableViewCell
            aqiArray?.reverse()
            cell.cityName.text = aqiArray![indexPath.row].SiteName!
            cell.aqiValue.text = aqiArray![indexPath.row].AQI!
            if cell.aqiValue.text == ""{
                cell.aqiValue.text = "暫無資料"
            }
            let aqi:Int = Int(aqiArray![indexPath.row].AQI!) ?? -1
            cell.aqiCellView.backgroundColor = backgroundColor(aqiIndex: aqi)
            return cell
        }else{
            
            let errorCell = tableView.dequeueReusableCell(withIdentifier: "errorCell", for: indexPath)
            
            return errorCell
        }

    }
    
    
    
}


//MARK: - methods
extension ViewController {
    
    func backgroundColor(aqiIndex: Int) -> UIColor {
        if aqiIndex >= 0 && aqiIndex <= 50 {
            return UIColor(named: "Color_Good")!
        }else if aqiIndex > 50  && aqiIndex <= 100{
            return UIColor(named: "Color_Moderate")!
        }else if aqiIndex > 100 && aqiIndex <= 150{
            return UIColor(named: "Color_Warning")!
        }else if aqiIndex > 150 && aqiIndex <= 200 {
            return UIColor(named: "Color_Unhealthy")!
        }else if aqiIndex > 200 && aqiIndex <= 300 {
            return UIColor(named: "Color_VeryUnheathly")!
        }else if aqiIndex > 300 {
            return UIColor(named: "Color_Hazardius")!
        }else if aqiIndex == -1 {
            return UIColor(named: "Color_Error")!
        }else {
            return UIColor(named: "Color_Error")!
        }
    }
}
