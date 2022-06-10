//
//  DetailCategoryViewController.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import UIKit

class RandomDetailCategoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var Button: UIButton!
    
    var urlCustom: String = ""
    
    var urlCategory: String?
    
    var participants: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.titleLabel.text = ""
        self.activityLabel.text = "No activity found with the specified parameters"
        self.categoryLabel.text = ""
        self.participantsLabel.text = ""
        self.priceLabel.text = ""
        
        if priceLabel.text == "" {
            self.Button.isHidden = false
        }
        
    }

    
    @IBAction func pickAnother(_ sender: Any) {
        
        let randomUrl = Constants().url_base + "activity?participants=" + "\(String(describing: participants))"
        print(randomUrl)
        NetworkingProvider.shared.getCategory(url: randomUrl) { category in
            
            self.titleLabel.text = "\(category.type)"
            self.activityLabel.text = "\(category.activity)"
            self.participantsLabel.text = "Participants: \(category.participants)"
            
            let price = getPrice(price: category.price)
            self.priceLabel.text = price
            
            self.categoryLabel.isHidden = true
        
        
    } failure: { error in
        self.Button.isHidden = true
        print("error")
    }
    }
}
