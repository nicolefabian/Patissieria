//
//  RegisterViewController.swift
//  Patisseria
//
//  Created by Alesson Abao on 4/05/23.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // keyboard disable
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        birthdateTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        // datePicker in birthdateTextField
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        birthdateTextField.inputView = datePicker
        birthdateTextField.inputAccessoryView = createToolbar()
        // make future dates disabled
        datePicker.maximumDate = Date()
    }

    
    @IBAction func registerButton(_ sender: UIButton) {
        let fname = firstNameTextField.text!
        let lname = lastNameTextField.text!
        let bday = birthdateTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        
        // create a user object to store them in the user defaults
        let userObject = Users(firstName: fname, lastName: lname, birthdate: bday, email: email, password: password)
        // compress object
        let data = try! NSKeyedArchiver.archivedData(withRootObject: userObject, requiringSecureCoding: false)
        // put compressed object in UserDefaults
        UserDefaults.standard.set(data, forKey: "users")
        
        // let the user know that their info is stored in user defaults (local database)
        showMessage(message: "Registered Successfully.", buttonCaption: "Close", controller: self)
        // clear out the form for another registration
        resetForm()
    }
    
    // MARK: Frontend functions
    func resetForm(){
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        birthdateTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
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
    // MARK: Birthdate
    @objc func dateChange(datePicker: UIDatePicker){
        birthdateTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        
        return formatter.string(from: date)
    }
    
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // close when done button is pressed
        let doneButtonToolbar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButtonToolbar], animated: true)
        
        return toolbar
    }
    
    @objc func donePressed(){
        self.view.endEditing(true)
    }
    
}
