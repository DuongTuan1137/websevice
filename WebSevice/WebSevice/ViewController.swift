//
//  ViewController.swift
//  WebSevice
//
//  Created by AnhDCT on 8/22/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var fristName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    @IBAction func post(_ sender: UIButton) {
       postData()
        nextList()
    }
    
    private func postData(){
        let link = "http://5d5f6548841f7f00140e3a0e.mockapi.io/api/contacts"
        guard let url = URL(string: link) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let newContact = Contacts(firstName: fristName.text ?? "" , lastName: lastName.text ?? "", email: email.text ?? "", phoneNumber: phoneNumber.text ?? "")
        do {
            let jsonBody = try JSONEncoder().encode(newContact)
            request.httpBody = jsonBody
        } catch{}
        let session = URLSession.shared.dataTask(with: request) { (data, res, error) in
            guard let data = data else {return}
            do{
                try JSONSerialization.jsonObject(with: data, options: [])
            } catch{
                print(error)
            }
           
        }
        session.resume()
    }
    private func nextList() {
        let vc = ListViewController(nibName: "ListViewController", bundle: nil)
        present(vc, animated: true, completion: nil)
    }
    
}

