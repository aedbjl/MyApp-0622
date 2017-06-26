//
//  ViewController.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/22.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func backHere(segue : UIStoryboardSegue){
        print("back home")
    }
    
    private let myData = ["猜數字v1","猜數字v2","切換場景","自訂UIView",
                          "簽名板","自訂","touch事件","l","p","r","q",
                          "i","j","k","l","p","r","q",
                          "i","j","k","l","p","r","q"]
    
    
    

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = myData[indexPath.row]
        return cell!
        
    }
    //觸發選項 ==> indexPath.row
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoVC(whereVC: indexPath.row)
    }
    private func gotoVC(whereVC:Int){
        switch (whereVC){
        case 2 :
            if let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2"){
                show(vc2, sender : self)
            }
            break
        case 4 :
            if let vcpaint = storyboard?.instantiateViewController(withIdentifier: "VCpaint"){
                show(vcpaint, sender : self)
            }
            break
        case 5 :
            if let vc = storyboard?.instantiateViewController(withIdentifier: "customcellvc"){
            show(vc, sender : self)
            }
            break
        case 6 :
            if let vc3 = storyboard?.instantiateViewController(withIdentifier: "touchVC"){
                show(vc3, sender : self)
            }
            break
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}

