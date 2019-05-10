//
//  MarksViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 06/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class MarksViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultMessage: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var marksArray = [MarkModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate     = self
        self.tableView.dataSource   = self
        
        self.result.text            = "Result : 0.0"
        self.resultMessage.text     = "Result for 0% assessments"
        
        let markObj = MarkModel()
        self.marksArray.append(markObj)
        
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addRow(_ sender: Any) {
        
        let markObj = MarkModel()
        self.marksArray.append(markObj)
        
        let indexPath = IndexPath(row: self.marksArray.count - 1 , section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
    
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.marksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "marksCell") as! MarksCell
        cell.markObj = self.marksArray[indexPath.row]
        cell.callback = {
            print(self.marksArray[indexPath.row].marks)
            self.checkResult()
        }
        return cell
    }
    
    
    
    
    func checkResult(){
        
        let checkPercentage = self.marksArray.filter({$0.isDataAvailable == true}).map({$0.percentage!}).reduce(0, +)
        
        guard checkPercentage <= 100 else {
            self.result.text        = "Submission error?"
            self.resultMessage.text = "Your total percentage is greater than 100."
            return
        }
        
        
        var result : Double = 0.0
        let marks = self.marksArray.filter({$0.isDataAvailable == true})
        for mark in marks {
            result += mark.calculation
        }
        
        self.result.text            = "Result : \(String(result))"
        self.resultMessage.text     = "Result for \(String(checkPercentage))% assessments"
        
    }
    
    
}
