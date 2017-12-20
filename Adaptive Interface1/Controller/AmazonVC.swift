//
//  AmazonVC.swift
//  Adaptive Interface1
//
//  Created by kitiwat chanluthin on 20/12/17.
//  Copyright © 2017 kitiwat chanluthin. All rights reserved.
//

import UIKit
import SDWebImage

class AmazonVC: UIViewController {
    
    //MARK: - IBOutles
    
   
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var priceNumLbl: UILabel!
    @IBOutlet weak var saleLbl: UILabel!
    @IBOutlet weak var saleNumLbl: UILabel!
    @IBOutlet weak var youSaveLbl: UILabel!
    @IBOutlet weak var youSaveNumLbl: UILabel!
    @IBOutlet weak var exeBtn: UIButton!
    @IBOutlet weak var orangeView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImage.sd_setImage(with: URL(string: "https://images-na.ssl-images-amazon.com/images/I/6191ggO9g%2BL._SL1000_.jpg"), placeholderImage: nil, options: SDWebImageOptions.progressiveDownload) { (uiImage, error, cache, url) in
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exeBtnTap(_ sender: Any) {
     //   self.orangeView.isHidden = !self.orangeView.isHidden
        
        self.saleLbl.isHidden = !self.saleLbl.isHidden
        self.saleNumLbl.isHidden = !self.saleNumLbl.isHidden
        
        self.youSaveLbl.isHidden = !self.youSaveLbl.isHidden
        self.youSaveNumLbl.isHidden = !self.youSaveNumLbl.isHidden
        self.view.layoutIfNeeded()
    }
    

   

}
