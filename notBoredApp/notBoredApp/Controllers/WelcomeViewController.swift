//
//  WelcomeViewController.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 07/06/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var participantsTextField: UITextField!
    @IBOutlet weak var participantsLabelError: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var termsAndConditions: UIButton!
    
//    var coordinator: WelcomeViewCoordinator!
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 14),
          .foregroundColor: UIColor.black,
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeString = NSMutableAttributedString(
           string: "Terms and conditions",
           attributes: yourAttributes
        )
        termsAndConditions.setAttributedTitle(attributeString, for: .normal)
        
        defaultField()
    }
    
    func defaultField () {
        startButton.isEnabled = true
        
        participantsLabelError.isHidden = false
        participantsLabelError.text = ""
        participantsTextField.text = ""
    }
    
    @IBAction func validateFieldParticipants(_ sender: Any)
    {
        if let amountParticipants = participantsTextField.text {
            if let errorMensagge = invalidAmountParticipants(amountParticipants) {
                participantsLabelError.text = errorMensagge
                participantsLabelError.isHidden = false
                startButton.isEnabled = false
            } else
            {
                participantsLabelError.isHidden = true
                startButton.isEnabled = true
            }
        }
    }
    
    func invalidAmountParticipants(_ value: String) -> String? {
        
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
            return "Only numbers"
        }
        
        if value.count >= 3 {
            return "Your number can't be greater than three digits"
        }
        return nil
    }
    
    @IBAction func startButtton(_ sender: Any) {
        if participantsTextField.text == "" {
            participantsTextField.text = "0"
        }
        
        let vc = ActivitiesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        print("Amount of participants \(String(describing: participantsTextField.text))")
        
    }
    @IBAction func tapTermsAndConditions(_ sender: Any) {
        let vc = TermsViewController()
        self.present(vc, animated: true)
        
    }
}
