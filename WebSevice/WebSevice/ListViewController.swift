//
//  ListViewController.swift
//  WebSevice
//
//  Created by AnhDCT on 8/23/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var labelEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
        
        // Do any additional setup after loading the view.
    }
    private func getApi(){
        guard let url = URL(string: "http://5d5f6548841f7f00140e3a0e.mockapi.io/api/contacts") else {return}
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            do {
                guard let data = data else {return}
                let json =  try JSONDecoder().decode( [Contacts].self, from: data)
                print(json)
                DispatchQueue.main.async {
                    self.labelEmail.text = json.last?.email
                }
            } catch{
            }
        }.resume()
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
