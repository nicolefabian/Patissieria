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
    
    @IBAction func loginButton(_ sender: UIButton) {
//        let email = emailTextField.text!
//        let pass = passwordTextField.text!
//
//        // get value from UserDefaults (compressed version from register)
//        let data = UserDefaults.standard.value(forKey: "users") as! Data
//        // decompress value when you get data from UserDefaults
//        let user = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! Users
//        // check if input has the correct pair of username and password from user defaults
//        if(email == user.email && pass == user.password)
//        {
//            // for validation: print user info
//            print(user.firstName)
//            print(user.lastName)
//            print(user.birthdate)
//            print(user.email)
//            print(user.password)
//            showMessage(message: "Successfully Logged in.", buttonCaption: "Close", controller: self)
//        }
//        // if input is wrong (based on user default), show pop-up screen
//        else
//        {
//            showMessage(message: "Email or password is incorrect.", buttonCaption: "Try again", controller: self)
//        }
    }
    
//    // MARK: Frontend functions
//    // dismiss keyboard when user clicks outside textbox
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//    
//    // dismiss keyboard when user clicks return in keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        textField.resignFirstResponder()
//        return true
//    }

}
