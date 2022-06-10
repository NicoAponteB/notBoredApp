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
        
        if value == "0" || value == "00" {
            return "Your participants number must be greater than 0"
        }
            
        return nil
    }
    
    @IBAction func startButtton(_ sender: Any) {
        
        let vc = ActivitiesViewController()
        
        vc.participant = participantsTextField.text ?? "error"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func tapTermsAndConditions(_ sender: Any) {
        self.present(TermsViewController(), animated: true)
    }
}
