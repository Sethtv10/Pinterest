//
//  ViewController.swift
//  Pinterest
//
//  Created by Seth Treviño on 1/31/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//

import UIKit
import Firebase

class PasswordView: UIViewController {
    
    var mail:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        
        //Add Subviews
        view.addSubview(askLabel)
        view.addSubview(passTextField)
        view.addSubview(nextButton)
        //Image View
        
        
        //label
        askLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        askLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        askLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        passTextField.topAnchor.constraint(equalTo: askLabel.topAnchor, constant: 50).isActive = true
        passTextField.heightAnchor.constraint(equalToConstant: 100).isActive = true
        passTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        
        //Mail Button
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 400).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        
        
        /*
         //Text View
         nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
         nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
         nameTextField.centerYAnchor.constraint(equalTo: inputContainerView.centerYAnchor).isActive = true
         //Text View
         mailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
         mailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
         mailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
         //Text View
         passTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
         passTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
         passTextField.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
         */
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let  askLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "¿Define una Contraseña?"
        view.textAlignment = .left
        view.textColor =  UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        view.font = UIFont(name:"fontname", size: 4.0)
        return view
    }()
    
    
    let nextButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 230/255, green: 0/255, blue: 35/255, alpha: 1)
        ub.setTitle("Siguiente", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return ub
    }()
    
    
    
    @objc func nextView(){
        let age = AgeView()
        age.pass = passTextField.text!
        age.mail = self.mail
        self.navigationController?.pushViewController(age, animated: true )
    }
    
    
    let passTextField : UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Contraseña"
        ntf.font = .systemFont(ofSize: 56)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        ntf.leftView = paddingView
        ntf.isSecureTextEntry = true
        
        ntf.leftViewMode = .always
        
        
        return ntf
    }()
    
    
    
    
    
}

