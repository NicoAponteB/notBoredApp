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
    
    var participant: String = ""

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    
    @IBAction func randomButtonTap(_ sender: Any) {
        
        let vcDetail = DetailCategoryViewController()
        let randomUrl = Constants().url_base + "activity?participants=" + "\(self.participant)"
        
        NetworkingProvider.shared.getCategory(url: randomUrl) { category in
            
            vcDetail.titleLabel.text = "Random"
            vcDetail.activityLabel.text = "\(category.activity)"
            vcDetail.participantsLabel.text = "Participants: \(category.participants)"
            
            let price = getPrice(price: category.price)
            
            vcDetail.priceLabel.text = price
            
            vcDetail.categoryLabel.text = "\(category.type)"
            
            print(category)
        } failure: { error in
            print("error")
        }
        
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
    
    func getCategory() {
//        DetailCategoryService().getDetailCategory
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

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let categoryString = categories[indexPath.row]
        let urlCategorySelected = Constants().url_base + Constants().url_category + "\(categoryString)" + Constants().url_participants + "\(self.participant)"
        let vcDetail = DetailCategoryViewController()
        
        NetworkingProvider.shared.getCategory(url: urlCategorySelected) { category in
            
            vcDetail.titleLabel.text = "\(category.type)"
            vcDetail.activityLabel.text = "\(category.activity)"
            vcDetail.participantsLabel.text = "Participants: \(category.participants)"
            
            let price = getPrice(price: category.price)
            vcDetail.priceLabel.text = price
            
            vcDetail.categoryLabel.isHidden = true

        } failure: { error in
            print("Error")
        }

        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}


