//
//  ClickedImageView.swift
//  Pinterest
//
//  Created by Seth Treviño on 4/25/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//

import UIKit

class ClikedImageView: UIViewController{
        
        var image: UIImage? {
            didSet {
                if let image = image {
                    imageView.image = image
                }
            }
        }
        
        var height : CGFloat?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            view.addSubview(imageView)
            
            if let height = height {
                imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
                imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
                imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
        
        let imageView : UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
}
