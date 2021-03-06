//
//  testTouchVC.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/26.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class testTouchVC: UIViewController {

    @IBOutlet weak var myView: testTouchView!
    var a = 1234
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTest))
        
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 2
        myView.addGestureRecognizer(tapGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchTest(_:)))
//        myView.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationTest(_:)))
        myView.addGestureRecognizer(rotationGesture)
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeTest(_:)))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.left
        swipeGesture.numberOfTouchesRequired = 1
        myView.addGestureRecognizer(swipeGesture)
        // longpress , pan , edgepan(excercise)
        
//        let longpressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longpressTest(_:)))
//        longpressGesture.minimumPressDuration = 1
//        longpressGesture.numberOfTouchesRequired = 1
//        myView.addGestureRecognizer(longpressGesture)

        
        
        
    }
    
    @objc func tapTest(_ sender : UITapGestureRecognizer){
        print("two finger touch")
        
        print("point number = \(sender.numberOfTouches)")
        
        let point0 = sender.location(ofTouch: 0, in: sender.view)
        print("0.\(point0.x)X\(point0.y)")
        let point1 = sender.location(ofTouch: 1, in: sender.view)
        print("1.\(point1.x)X\(point1.y)")
    }
    
    @objc func pinchTest(_ sender:UIPinchGestureRecognizer){
        if sender.state == UIGestureRecognizerState.changed{
            print(sender.scale) //1 is base number.
        }
    }
    @objc func rotationTest(_ sender:UIRotationGestureRecognizer){
       
        let rad = sender.rotation
        let deg = Float(rad) * Float(180) / Float(M_PI)
        
        if deg > 0 {
            print("clockwise:\(deg)")
        }else {
            print("counterclockwise:\(deg)")
        }

    }
    @objc func swipeTest(_ sender:UISwipeGestureRecognizer){
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right :
            print("right")
        case UISwipeGestureRecognizerDirection.left :
            print("left")
        case UISwipeGestureRecognizerDirection.up:
            print("up")
        case UISwipeGestureRecognizerDirection.down :
            print("down")
        default:
            break
    }
        
   

    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("VC:touch")
    }
    
    
//    @objc func longpressTest(_ sender:UILongPressGestureRecognizer){
//        sender.allowableMovement = 4
//    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    
}
