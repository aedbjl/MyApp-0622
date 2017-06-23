//
//  VC3.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/23.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class VC3: UIViewController {

    @IBAction func vc2(_ sender: Any) {
        if let vc2 = storyboard?.instantiateViewController(withIdentifier:"vc2"){
            show(vc2 , sender: self)
        }
    }
    
    @IBAction func vc4(_ sender: Any) {
        if let vc4 = storyboard?.instantiateViewController(withIdentifier:"vc4"){
            show(vc4 , sender: self)
        }
    }
}
