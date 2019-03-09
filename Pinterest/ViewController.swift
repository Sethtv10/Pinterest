//
//  ViewController.swift
//  Pinterest
//
//  Created by Seth Treviño on 1/31/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
       
        //Add Subviews
         view.addSubview(loginImage)
       // view.addSubview(inputContainerView)
        view.addSubview(welcomLabel)
        view.addSubview(mailButton)
        view.addSubview(facebookButton)
        view.addSubview(googleButton)
        view.addSubview(starButton)
        view.addSubview(termsLabel)
        //Image View
        loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        loginImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        loginImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //Welcome label
        welcomLabel.topAnchor.constraint(equalTo: loginImage.bottomAnchor).isActive = true
        welcomLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        welcomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
       
        
        //Input Container View
   /*     inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
       */
        
        //Mail Button
        mailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mailButton.topAnchor.constraint(equalTo: welcomLabel.bottomAnchor, constant: 10).isActive = true
        mailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mailButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        //Facebook Button
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookButton.topAnchor.constraint(equalTo: mailButton.bottomAnchor, constant: 10).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: mailButton.widthAnchor).isActive = true
        
        //Google Button
        googleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 10).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        googleButton.widthAnchor.constraint(equalTo: mailButton.widthAnchor).isActive = true
        
        //Start Button
        starButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        starButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 30).isActive = true
        starButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        starButton.widthAnchor.constraint(equalTo: mailButton.widthAnchor).isActive = true
        
        
        
        //Term label
        termsLabel.topAnchor.constraint(equalTo: starButton.bottomAnchor, constant: 30).isActive = true
        termsLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        termsLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
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
    
    let  welcomLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Te Damos la bienvenida a Pinterest"
        view.textAlignment = .center
        view.textColor =  UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        return view
    }()
    
    let  termsLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Si continuas, aceptas las Condiciones de Servicio y la \nPolitica de privacidad de Pinterest"
        view.textAlignment = .left
        view.font = UIFont(name:"fontname", size: 8.0)
        view.textColor =  UIColor.init(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        return view
    }()
    
    let  inputContainerView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        return view
    }()
    
    let mailButton : UIButton = {
       let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 230/255, green: 0/255, blue: 35/255, alpha: 1)
        ub.setTitle("Continuar con Correo", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        return ub
    }()
    
    let facebookButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 66/255, green: 103/255, blue: 178/255, alpha: 1)
        ub.setTitle("Facebook", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    let googleButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
        ub.setTitle("Google", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    let starButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        ub.setTitle("Iniciar Sesion", for: .normal)
        ub.layer.cornerRadius = 6
        ub.layer.masksToBounds = true
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.setTitleColor(UIColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1), for: .normal)
        
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton(){
        print("hello word")
        
        
        if let pass = passTextField.text, let mail = mailTextField.text, let name = nameTextField.text{
             print(mail)
            print(pass)
            Auth.auth().createUser(withEmail: mail, password: pass) { (data:AuthDataResult?, error) in
                if error != nil{
                    print(error)
                }
                let user = data?.user
                if let uid = user?.uid {
                    let db = Database.database().reference(fromURL: "https://pinterest-fa297.firebaseio.com/")
                    let UserRef = db.child("users").child(uid)
                    UserRef.updateChildValues(["name": name, "mail": mail,"pass": pass])
                    let MessageRef = db.child("messages").child(uid)
                    MessageRef.updateChildValues(["user": name, "message": "Hola, este es un mensaje Default"])
                    let ref = db.child("users").child(uid)
                    ref.removeValue { error, _ in
                        
                        print(error)
                    }
                }
            }
        }
    }
    
    @objc func nextView(){
        var mail = MainView()
        self.navigationController?.pushViewController(mail, animated: true )
    }
    
    let nameTextField : UITextField = {
       let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Name"
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        ntf.leftView = paddingView
        ntf.leftViewMode = .always
        
        return ntf
    }()
    
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

