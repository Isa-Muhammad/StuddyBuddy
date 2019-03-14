//
//  ViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 05/02/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        //http get request
        let d = URL(string:  "http://10.128.81.249:8080/")!
        let task = URLSession.shared.dataTask(with: d) {
            (data, res, error) in
            if error == nil {
               let a = (String(decoding: data!, as: UTF8.self))
                //print(a)
                DispatchQueue.main.async { // Correct
                    self.idLabel.text = "\(a)"
                }
            }
        }
        task.resume()
    }
    
    // Post data to server
    func postData() {
        let session = URLSession(configuration: .default)
        var datatask : URLSessionDataTask?
        let url = "http://10.128.81.249:8080/api/units"
        var myURL = URLComponents(string: url)
        myURL?.query = "id=\(String(describing: nameLabel.text!))"
        var request =  URLRequest(url: (myURL?.url)!)
        request.httpMethod = "POST"
        datatask = session.dataTask(with: request, completionHandler: {data, response, error in
            if error == nil {
                print(String(decoding: data!, as: UTF8.self))
                print("http://10.128.81.249:8080/api/units")
            }
        })
        datatask?.resume()
    }
    
    //onclick function to postb data
    @IBAction func onClick(_ sender: Any) {
        postData()
    }
    
}

