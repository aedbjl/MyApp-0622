//
//  VC4.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/23.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class VC4: UIViewController {

    @IBAction func vc2(_ sender: Any) {
        if let vc2 = storyboard?.instantiateViewController(withIdentifier:"vc2"){
            show(vc2 , sender: self)
        }
    }
    
    @IBAction func vc3(_ sender: Any) {
        if let vc3 = storyboard?.instantiateViewController(withIdentifier:"vc3"){
            show(vc3 , sender: self)
        }
    }





}
