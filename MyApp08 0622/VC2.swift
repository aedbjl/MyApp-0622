//
//  VC2.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/23.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var labelRand: UILabel!
    
    private var rand = Int(arc4random_uniform(49))
    
    @IBOutlet weak var label2: UILabel!
    
    @IBAction func vc3(_ sender: Any) {
        if let vc3 = storyboard?.instantiateViewController(withIdentifier:"vc3"){
            show(vc3 , sender: self)
        }
        
    }
    
    @IBAction func vc4(_ sender: Any) {
        if let vc4 = storyboard?.instantiateViewController(withIdentifier:"vc4"){
            show(vc4 , sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("vc2: viewdidload()")
        labelRand.text = String(rand)
        let app = UIApplication.shared.delegate as! AppDelegate
        
        label2.text = String(app.rand)
    }
    
    
    }
