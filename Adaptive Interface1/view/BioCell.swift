//
//  BioCell.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 18/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit
import SDWebImage

class BioCell: UITableViewCell {

    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageContent: UIImageView!
    
    var thumbUrl:String!
    var displayUrl:String!
    var owner:String!
    var caption:String!
    
    
    func configureCell(content:ImageContent){
        self.thumbUrl = content.thumbUrl
        self.caption = content.caption
        self.owner = content.owner
        self.displayUrl = content.displayUrl
        
        imageContent.sd_setImage(with: URL(string: self.thumbUrl), placeholderImage: UIImage(named: "placeholder.png"))
        bioLabel.text = self.caption
        nameLbl.text = self.owner
    }
    
    
}
