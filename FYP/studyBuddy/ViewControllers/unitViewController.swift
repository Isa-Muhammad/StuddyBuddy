//
//  unitViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 19/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseDatabase

//var list2 = ["ASE", "PDAM", "RASS", "DISMOB", "FYP"]
var myIndex = 0

class unitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- Interface Builder
    @IBOutlet weak var unitTableView: UITableView!
    
    //MARK:- Properties
    var list: [Unit] = []
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //fetch deadlines
        self.fetchUnitsFromFirebase()
    }
    
    //MARK:- Methods
    func fetchUnitsFromFirebase() {
        self.list.removeAll()
        let unitRef = Database.database().reference(withPath: "units").child(User.currentUser.id!)
        unitRef.observeSingleEvent(of: .value, with: {(snapshot) in
            if snapshot.value != nil {
                var units: [Unit] = []
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                        let unit = Unit(snapshot: snapshot) {
                        units.append(unit)
                    }
                }
                self.list = units
                self.unitTableView.reloadData()
            } else {
                print("Fetching error!")
            }
        })
    }
    
    
    //MARK:- TableView Delegate and Datasource Methods
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.remove(at: indexPath.row)
            unitTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "tSeg", sender: self)
    }

}

