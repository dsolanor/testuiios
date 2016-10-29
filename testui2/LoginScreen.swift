//
//  File.swift
//  testui2
//
//  Created by David Solano on 24/10/16.
//  Copyright © 2016 David Solano. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    let inputsContainerView: UIView = {
        let view =  UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0/255, green: 5/255, blue: 15/255, alpha: 1)
        button.setTitleColor(UIColor.white, for: UIControlState())
        button.setTitle("Login", for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchDown)
        return button
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var inputsContainerHeight: NSLayoutConstraint?
    
    lazy var loginRegistrerSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(inputsContainerView)
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -25).isActive = true
        inputsContainerHeight = inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputsContainerHeight?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(emailTextField)
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        inputsContainerView.addSubview(passwordTextField)
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(loginRegistrerSegmentedControl)
        loginRegistrerSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegistrerSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegistrerSegmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -25).isActive = true
        loginRegistrerSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.backgroundColor = UIColor(red: 0/255, green: 30/255, blue: 70/255, alpha: 1)
        
        loginRegistrerSegmentedControl.selectedSegmentIndex = 1
        handleLoginRegisterChange()
    }
    func handleLoginRegisterChange(){
        let title = loginRegistrerSegmentedControl.titleForSegment(at: loginRegistrerSegmentedControl.selectedSegmentIndex)
        loginButton.setTitle(title, for: UIControlState())
        inputsContainerHeight?.constant = loginRegistrerSegmentedControl.selectedSegmentIndex == 0 ? 150 : 250
        
        //TODO: Hide name in login state
    }
    func handleLoginRegister(){
        if(loginRegistrerSegmentedControl.selectedSegmentIndex == 0){
            handleLogin()
        }else{
            handleRegister()
        }
        
    }
    func handleRegister(){
        guard let name = emailTextField.text, let email = emailTextField.text, let password = passwordTextField.text else{
            print("Form not valid")
            return
        }

    }
    func handleLogin(){
        print("Login")
//        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
//        guard let mainNavController = rootViewController as? MainNavController else { return }
//        mainNavController.viewControllers = [HomeController()]
//        dismiss(animated: true, completion: nil)
//        guard let email = emailTextField.text, let password = passwordTextField.text else{
//            print("Form not valid")
//            return
//        }

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
