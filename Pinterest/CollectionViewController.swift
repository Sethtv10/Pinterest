//
//  MainTableViewTableViewController.swift
//  Pinterest
//
//  Created by Seth Treviño on 4/4/19.
//  Copyright © 2019 Seth Treviño. All rights reserved.
//

import UIKit

struct Celda {
    
    var id : Int
    var title : String
    var text : String
    var image : String
    
}
let imagenes: [UIImage] = [#imageLiteral(resourceName: "imageold")]

class CollectionViewController: UICollectionViewController {
    
    var headlines = [
        Celda(id: 1, title: "Adrian Sandoval", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        Celda(id: 2, title: "Luna Artea", text: "Licenciatura en Diseño Grafico.", image: "image.png"),
        Celda(id: 3, title: "Alejandro Loza", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        Celda(id: 4, title: "Seth Treviño", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        self.collectionView.register(PinCell.self, forCellWithReuseIdentifier: "Cell")
        
    
        self.title = "Alumnos"
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headlines.count
    }
    
    override func numberOfSections(in tableView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PinCell
        let headline = headlines[indexPath.row]
        cell.newImage = UIImage(named: headline.image)
       
        cell.newLabel = headline.title
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PinCell
        let clicked = ClikedImageView()
        clicked.loginImage.image = cell.imageViewCell1.image
        self.navigationController?.pushViewController(clicked, animated: true)
        
    }
    
    
}


class PinCell : UICollectionViewCell {
    
    var newImage: UIImage?{
        didSet{
            if let newImage = newImage {
                imageViewCell1.image = newImage
            }
        }
    }
    
    var newLabel: String?{
        didSet{
            if let newLabel = newLabel {
                labelView1.text = newLabel
            }
        }
    }
    
    override init(frame: CGRect) {
       super.init(frame: frame)
       setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    
    lazy var imageViewCell1 : UIImageView = {
        let imageViewCell = UIImageView()
        imageViewCell.image = UIImage(named: "image.png")
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.isUserInteractionEnabled = true
        
        return imageViewCell
    }()
   
    
    lazy var labelView1 : UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textAlignment = .center
        labelView.font = UIFont(name:"fontname", size: 8.0)
        return labelView
    }()
    
    //Imagen de puntitos
    let imageViewOptions : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.image = #imageLiteral(resourceName: "puntos")
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        return imageView3
    }()
    
    @objc func tappedMe()
    {
        let clicked = ClikedImageView()
        
    }
    
    func setUpViews(){
        self.addSubview(imageViewCell1)
        self.addSubview(labelView1)
        
        let originalWidth = imageViewCell1.image!.size.width
        let originalHeight = imageViewCell1.image!.size.height
        let newImageWidth = self.frame.width
        let newImageHeight = (newImageWidth * originalHeight) / originalWidth
        
        imageViewCell1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageViewCell1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageViewCell1.widthAnchor.constraint(equalToConstant: newImageWidth).isActive = true
        imageViewCell1.heightAnchor.constraint(equalToConstant: newImageHeight).isActive = true
        
        
        imageViewCell1.isUserInteractionEnabled = true
        
        
        labelView1.topAnchor.constraint(equalTo: imageViewCell1.bottomAnchor).isActive = true
        labelView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        labelView1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //Set image de puntitos
        self.addSubview(imageViewOptions)
        imageViewOptions.centerYAnchor.constraint(equalTo: labelView1.centerYAnchor).isActive = true
        imageViewOptions.rightAnchor.constraint(equalTo: imageViewCell1.rightAnchor).isActive = true
        imageViewOptions.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        imageViewOptions.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
    }

    
    
    
}


extension CollectionViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        //100 / 80 * 80
        let height = (self.view.frame.width / imagenes[0].size.height) * imagenes[0].size.height
        
        //let width = (imagenes[0].size.width) * imagenes[0].size.width) / self.view.frame.height
        
        
        return height
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        maxHeightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        var halfView = collectionView.bounds.height / 2
        return halfView + (halfView / 4)
    }
}

