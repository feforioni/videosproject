//
//  LoginViewController.swift
//  YoutubeProject
//
//  Created by Felipe Lima on 27/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    let correctUser = "Felipe"
    let correctPassword = "12345678"

    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.layer.cornerRadius = 8
    }
    
    @IBAction func onSubmitButtonTapped(_ sender: Any) {
        resultLabel.isHidden = false
        if loginTextField.text == correctUser,
           passwordTextField.text == correctPassword {
            resultLabel.text = "Success"
            resultLabel.textColor = .green
        } else {
            resultLabel.text = "Fail"
            resultLabel.textColor = .red
        }
    
                
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
