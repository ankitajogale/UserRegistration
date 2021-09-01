//
//  bookDetailVC.swift
//  DemoApplication
//
//  Created by sachin toskar on 13/08/21.
//  Copyright © 2021 ankita. All rights reserved.
//

import UIKit
import FaveButton



func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class bookDetailVC: UIViewController, FaveButtonDelegate {

    @IBOutlet var bookImg: UIImageView!
    @IBOutlet var bookName: UILabel!
    
    
     @IBOutlet var heartButton: FaveButton?

    var name = String()
    var img = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //like button
        self.heartButton?.setSelected(selected: false, animated: false)
        //navigation bar show
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        //image
        self.bookImg.layer.cornerRadius = 10
        self.bookImg.layer.borderWidth = 2
        self.bookImg.layer.borderColor = UIColor.black.cgColor
        
        
        bookImg.image = img
        bookName.text = name
        
    }
    
     let colors = [
            DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
            DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
            DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
            DotColors(first: color(0xE9A966), second: color(0xF8C852)),
            DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
        ]
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === heartButton){
            return colors
        }
        return nil
    }
    
}
