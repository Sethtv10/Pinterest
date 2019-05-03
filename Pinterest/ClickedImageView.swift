//
//  ClickedImageView.swift
//  Pinterest
//
//  Created by Seth Treviño on 4/25/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//

import UIKit

class ClikedImageView: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        //Add Subviews
        view.addSubview(loginImage)
        //Image View
        loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        loginImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        loginImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
    let loginImage :  UIImageView = {
        let li =  UIImageView(frame: CGRect(x: 105, y: 150, width: 200, height: 200))
        li.image = UIImage(named:"image.png")
        
        
        
        return li
    }()
}
