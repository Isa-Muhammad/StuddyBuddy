//
//  unitViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 19/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

var list2 = ["ASE", "PDAM", "RASS", "DISMOB", "FYP"]

class unitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var unitTableView: UITableView!
    
    
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list2.count)
    }
    //Tells the data source to return the number of rows in a given section of a table view.Required.
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellTwo")
        cell.textLabel?.text = list2[indexPath.row]
        
        return(cell)
        
    }
    //Asks the data source for a cell to insert in a particular location of the table view.Required.
    
    
    //delete item from list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list2.remove(at: indexPath.row)
            unitTableView.reloadData()
        }
    }
    
    //refresh table view
    override func viewDidAppear(_ animated: Bool)
    {
        unitTableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
