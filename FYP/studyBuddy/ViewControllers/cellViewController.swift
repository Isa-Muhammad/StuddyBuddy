//
//  cellViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 13/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import UserNotifications


class cellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //MARK:- Interface Builder
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK:- Properties
    var list: [Deadline] = []
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //User notification permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]){ (granted, error) in
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //fetch deadlines
        self.fetchDeadlinesFromFirebase()
    }
    
    //MARK:- Methods
    func fetchDeadlinesFromFirebase() {
        self.list.removeAll()
        let deadlineRef = Database.database().reference(withPath: "deadlines").child(User.currentUser.id!)
        deadlineRef.observeSingleEvent(of: .value, with: {(snapshot) in
            if snapshot.value != nil {
                var deadlines: [Deadline] = []
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                        let deadline = Deadline(snapshot: snapshot) {
                        deadlines.append(deadline)
                    }
                }
                self.list = deadlines
                self.myTableView.reloadData()
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
        cell.textLabel?.text = list[indexPath.row].date + " " + list[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    //MARK:- Selectors
    @IBAction func logOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            User.currentUser.logOut()
            StoryboardManager.segueToLogin()
        } catch let error {
            print(error)
        }
        
    }

}

