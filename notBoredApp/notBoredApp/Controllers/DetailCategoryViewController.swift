//
//  DetailCategoryViewController.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import UIKit

class DetailCategoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var urlCategory: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = NetworkingProvider()
        
        print("VC detail")
    }
    
    
    @IBAction func tryAnotherTap(_ sender: Any) {
        
    }
    
    func loadData(cat: Category) {
        
    }

}
