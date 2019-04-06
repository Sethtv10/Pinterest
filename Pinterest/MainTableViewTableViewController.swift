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

class MainTableViewController: UITableViewController {

    var headlines = [
        Celda(id: 1, title: "Adrian Sandoval", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        Celda(id: 2, title: "Luna Artea", text: "Licenciatura en Diseño Grafico.", image: "image.png"),
        Celda(id: 3, title: "Alejandro Loza", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        Celda(id: 4, title: "Seth Treviño", text: "Ingenieria en Desarrollo de Software.", image: "image.png"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alumnos"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headlines.count
    }
    
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cell = UIImage(named: headlines[indexPath.row].image)
    
    
    
    if let size = cell?.size.height {
        let screenSize = UIScreen.main.bounds
        let heightVal = (size * 100) / screenSize.height
        return heightVal + 100
    }
    
    return CGFloat(200)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PinCell
            let headline = headlines[indexPath.row]
            
           cell.newImage = UIImage(named: headline.image)
            cell.newLabel = headline.title
            // cell.detailTextLabel?.text = headline.text

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        self.tableView.register(PinCell.self, forCellReuseIdentifier: "Cell")
        return "Alumnos"
    }

}

class PinCell : UITableViewCell {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var imageViewCell1 : UIImageView = {
        let imageViewCell = UIImageView()
        imageViewCell.image = UIImage(named: "image.png")
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        return imageViewCell
    }()
    
    lazy var labelView1 : UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textAlignment = .center
        labelView.font = UIFont(name:"fontname", size: 8.0)
        return labelView
    }()
    
    func setUpViews(){
        self.addSubview(imageViewCell1)
        self.addSubview(labelView1)
        imageViewCell1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageViewCell1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageViewCell1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 8/10).isActive = true
        imageViewCell1.heightAnchor.constraint(equalTo: self.heightAnchor , multiplier: 8/10).isActive = true
        labelView1.topAnchor.constraint(equalTo: imageViewCell1.bottomAnchor).isActive = true
        labelView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 9/10)
        labelView1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        labelView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    

    
    
    
    
}
