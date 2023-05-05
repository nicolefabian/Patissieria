//
//  RegisterViewController.swift
//  Patisseria
//
//  Created by Alesson Abao on 4/05/23.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    // make birthdate text field have date picker
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // birthdateTextField will have date picker input
        
        
        // dismiss keyboard in every textfield input
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    // MARK: Date input
    func createToolbar() -> UIToolbar{
        // crete toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button part of toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneToolbarPressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    func createDatePicker(){
        // stype the datepicker
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthDateTextField.inputView = datePicker
        birthDateTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func doneToolbarPressed(){
        // remove time
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        // input the date in the text field
        self.birthDateTextField.text = dateFormatter.string(from: datePicker.date)
        // close when done button is pressed
        self.view.endEditing(true)
    }
    
    // MARK: Dismiss keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // dismiss keyboard when user clicks return in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
