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
        
        
        
        
        //do {
          //  try Auth.auth().signOut()
        //}
        //catch let signOutError as NSError {
          //  print ("Error signing out: %@", signOutError)
            //performSegue(withIdentifier: "logOutSeg", sender: self)
        //}
        
        //let storyboard = UIStoryboard(name: "signInViewController", bundle: nil)
        //let initial = storyboard.instantiateInitialViewController()
        //UIApplication.shared.keyWindow?.rootViewController = initial
        //print("logout test")
    }
    
    //func handleSignOut(){
      //  let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        //alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (_) in
          //  self.signOut()
        //}))
        //alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //present(alertController, animated: true, completion: nil)
    //}
    
    //Mark: - API
    //func signOut(){
      //  do{
        //    try Auth.auth().signOut()
          //  let navController = UINavigationController(rootViewController: signInViewController())
            //self.present(navController, animated: true, completion: nil)
        //} catch let error {
          //  print("Failed to sign out with error...", error)
        //}
    //}
    
    //func authenticateUserAndConfigureView(){
      //  if Auth.auth().currentUser == nil {
        //    DispatchQueue.main.async {
            //}
       // }else{
         //   print("nothing")
           // performSegue(withIdentifier: "logout", sender: nil)
        //}
    //}

    
    // Mark: -Helper Functions
    
    //func configureViewComponents() {
      //  navigationItem.title = "Firebase Login"
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "units"), style: .plain, target: self, action: #selector(handleSignOut))
        //navigationItem.leftBarButtonItem?.tintColor = .white
        //navigationController?.navigationBar.barTintColor = UIColor.blue
    //}

    /*
    // MARK: - Navigation
     
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

