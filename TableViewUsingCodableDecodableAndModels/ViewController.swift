//  ViewController.swift
//  TableViewUsingCodableDecodableAndModels
//  Created by Ranjeet Raushan on 08/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.
import UIKit
struct Result: Codable{
    let userId: Int
    let id: Int
    let title:  String
    let completed:  Bool
}

class ViewController: UIViewController {
    @IBOutlet weak var taBleVw: UITableView!
    var result =  [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        taBleVw.delegate = self
        taBleVw.dataSource = self
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            do{
                self.result = try JSONDecoder().decode([Result].self, from: data!)
                DispatchQueue.main.async{
                    self.taBleVw.reloadData()
                }
            }
            catch{
                print("Error: \(error)")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = result[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "taBleVw", for: indexPath) as! taBleVw
        cell.lbl_title.text = "Title: \(model.title)"
        cell.lbl_title.backgroundColor = UIColor.orange
        cell.lbl_id.text = "Id: \(model.id)"
        cell.lbl_id.backgroundColor = UIColor.lightGray
        cell.lbl_userid.text = "UserId:\(model.userId)"
        cell.lbl_userid.backgroundColor = UIColor.green
        
        return cell
    }
}
