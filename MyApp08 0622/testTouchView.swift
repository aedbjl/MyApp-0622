//
//  testTouchView.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/26.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class testTouchView: UIView {
    
    var isInitStat = false
    private var ttvc : testTouchVC?
    private func initState(){
        isInitStat = true
        
//        let vc = findSuperVC(whichView: self)
//        ttvc = vc as! testTouchVC
//        print(ttvc!.a)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ttvc = storyboard.instantiateViewController(withIdentifier: "touchVC") as! testTouchVC
        print(ttvc!.a)
    }
    
    //find super container
//    private func findSuperVC( whichView: UIView )-> UIViewController? {
//        var responder:UIResponder = whichView
//        while responder != nil {
//            print("ok")
//            if let vc = responder as? UIViewController{
//                return vc
//            }
//            responder = responder.next!
//        }
//        return nil
//    }
    
    override func draw(_ rect: CGRect) {
//        backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        if !isInitStat{ initState()}
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("myView: touch")
//        ttvc?.touchesBegan(touches, with: event)
    }
    
    }
