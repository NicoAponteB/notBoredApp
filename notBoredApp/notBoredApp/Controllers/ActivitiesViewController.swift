//
//  ActivitiesViewController.swift
//  notBoredApp
//
//  Created by Nicolas Aponte Barrera on 8/06/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
//    var coordinator: ActivitiesViewCoordinator!
    var categories: [String] = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }


}

extension ActivitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
        }
        
        cell!.textLabel?.text = categories[indexPath.row]
        
        
        return cell!
                                            
    }
    
    
}
