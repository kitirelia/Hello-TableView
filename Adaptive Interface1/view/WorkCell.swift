//
//  WorkCell.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 18/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit
import SDWebImage

class WorkCell: UITableViewCell {

    @IBOutlet weak var workImageView:UIImageView!
    @IBOutlet weak var workTitleLabel:UILabel!
    @IBOutlet weak var moreInfoTextView:UITextView!
    
    
    func configureCell(content:ImageContent){
        workTitleLabel.text = content.owner
      //  moreInfoTextView.text = content.caption
        
        workImageView.sd_setImage(with: URL(string: content.thumbUrl), placeholderImage: UIImage(named: "placeholder.png"), options: SDWebImageOptions.progressiveDownload) { (uiImage, error, cache, url) in
            //print("complete")
            self.layoutIfNeeded()

        }
//        workImageView.sd_setImage(with: URL(string: content.thumbUrl), placeholderImage: nil)
    }

}
