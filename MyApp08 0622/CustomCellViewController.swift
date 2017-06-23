//
//  CustomCellViewController.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/22.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let myData = ["猜數字v1","猜數字v2","切換場景","自訂UIView",
                          "簽名板","自訂","k","l","p","r","q",
                          "i","j","k","l","p","r","q"
                          ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myData.count
    }
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell")
            as! CustomTableViewCell //父類別轉成子類別
        cell.img.image = UIImage(named: "1066.jpg")
        cell.label1.text = myData[indexPath.row]
        cell.content.text = "1234567"
        
        cell.img.layer.cornerRadius = 40
        cell.img.clipsToBounds = true
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
