//
//  ViewController.swift
//  RegistrationApp
//
//  Created by Neha Tripathi on 08/01/18.
//  Copyright © 2018 Neha Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var pincodeTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        middleNameTextField.delegate = self
        lastNameTextField.delegate = self
        pincodeTextField.delegate = self
        ageTextField.delegate = self
        countryTextField.delegate = self
        addressTextView.delegate = self
        addressTextView.layer.borderWidth = 1
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func dismissKeyboard(){
        firstNameTextField.resignFirstResponder()
        middleNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        pincodeTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        countryTextField.resignFirstResponder()
        addressTextView.resignFirstResponder()
    }
}

extension ViewController{
    
    func scroll(sender : UIView){
        
        let rect = CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y + 271.0 , width: sender.frame.width, height: sender.frame.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
}

//MARK :- Text Field Delegate
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scroll(sender: textField)
    }
}

//MARK :- Text View Delegate
extension ViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        scroll(sender: textView)
    }
}

