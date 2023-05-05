//
//  LoginViewController.swift
//  Patisseria
//
//  Created by Alesson Abao on 4/05/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // dismiss keyboard when user clicks outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // dismiss keyboard when user clicks return in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
