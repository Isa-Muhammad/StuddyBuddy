//
//  cellViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 13/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseAuth


// add default items in list
var list = ["ASE","DISMOB","PDAM","RASS"]


class cellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    //Tells the data source to return the number of rows in a given section of a table view.Required.
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    //Asks the data source for a cell to insert in a particular location of the table view.Required.
    
    
    //delete item from list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    //refresh table view
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        //if Auth.auth().currentUser != nil {
          //  self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        //} 
        myTableView.reloadData()
    }
    
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Auth.auth().currentUser?.email)
        //authenticateUserAndConfigureView()

        // Do any additional setup after loading the view.
    }
    
    
    
    //Mark: - Selectors
   
    
    @IBAction func logOut(_ sender: Any) {
    try! Auth.auth().signOut()
        performSegue(withIdentifier: "logOutSeg", sender: self)
        
    }
    
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

