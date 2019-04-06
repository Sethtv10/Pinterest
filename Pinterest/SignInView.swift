//
//  ViewController.swift
//  Pinterest
//
//  Created by Seth Treviño on 1/31/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//
import UIKit
import Firebase


class SigInView: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        
        //Add Subviews
        view.addSubview(loginImage)
        view.addSubview(inputContainerView)
        view.addSubview(firstButton)
       
        inputContainerView.addSubview(mailTextField)
        inputContainerView.addSubview(passTextField)
        
        //Image View
        
        loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        loginImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        loginImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //Input Container View
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        //Fisrt Button
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 10).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
       
        //Text View
        mailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
        mailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        mailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        //Text View
        passTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/2).isActive = true
        passTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passTextField.bottomAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let  inputContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    
    let firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 230/255, green: 0/255, blue: 35/255, alpha: 1)
        ub.setTitle("Register", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton(){
        print("hello word")
        
        
        if  let mail = mailTextField.text, let pass = passTextField.text{
            print(mail)
            print(pass)
            Auth.auth().signIn(withEmail: mail, password: pass) { (data:AuthDataResult?, error) in
                if error != nil{
                    print(error)
                }else{
                    let table = MainTableViewController();
                    self.navigationController?.pushViewController(table, animated: true )
                }
                let user = data?.user
    
            }
        }
    }
    

    
    let passTextField : UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Password"
        ntf.isSecureTextEntry = true
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        ntf.leftView = paddingView
        ntf.leftViewMode = .always
        
        return ntf
    }()
    
    let mailTextField : UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Mail"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        ntf.leftView = paddingView
        ntf.leftViewMode = .always
        
        
        return ntf
    }()
    
    let loginImage :  UIImageView = {
        let li =  UIImageView(frame: CGRect(x: 105, y: 150, width: 200, height: 200))
        li.image = UIImage(named:"image.png")
        
        
        
        return li
    }()
    
    
    
}
