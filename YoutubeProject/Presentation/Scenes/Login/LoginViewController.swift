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
    @IBOutlet weak var eyePasswordButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    let correctUser = "fe.forioni@gmail.com"
    let correctPassword = "12345678"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        passwordTextField.isSecureTextEntry = true
        submitButton.layer.cornerRadius = 16
        configSubmitButton(enabled: true)
    }

    @IBAction func onPasswordTextFieldChange(_ sender: Any) {
        validateLoginTextField()
    }
    
    @IBAction func onUserNameTextFieldChange(_ sender: Any) {
        validateLoginTextField()
    }
    
    @IBAction func onEyeButtonTapped(_ sender: Any) {
        if passwordTextField.isSecureTextEntry {
            eyePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
            eyePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }

    func validateLoginTextField() {
        if passwordTextField.text?.isEmpty == false,
           loginTextField.text?.isEmpty == false,
           passwordTextField.text!.count >= 6 {
            configSubmitButton(enabled: true)
        } else {
            configSubmitButton(enabled: false)
        }
    }

    func configSubmitButton(enabled: Bool) {
        submitButton.isEnabled = enabled
        if submitButton.isEnabled {
            submitButton.backgroundColor = .red
        } else {
            submitButton.backgroundColor = .lightGray
        }
    }

    @IBAction func onSubmitButtonTapped(_ sender: Any){
        validateLoginTextField()
        if loginTextField.text == correctUser,
           passwordTextField.text == correctPassword {
            navigationController?.pushViewController(PlayerViewController(), animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "User name or password incorrect", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            navigationController?.present(alert, animated: true, completion: nil)
        }
    }
}
