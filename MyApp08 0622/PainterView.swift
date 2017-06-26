//
//  PainterView.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/23.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class PainterView: UIView {

    
    
    private var img = UIImage(named:"1066.jpg")
    private var imgH :CGFloat? = 0
    private var imgW :CGFloat? = 0
    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    private var lines:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var recycle:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var isInit = false
    private var context:CGContext?
    private var dX:CGFloat = 2
    private var dY:CGFloat = 2
    private var i = 0
    private var ballImg = UIImage(named:"iii.png")
    private var ballW:CGFloat?
    private var ballH:CGFloat?
    private var ballX:CGFloat = 1
    private var ballY:CGFloat = 1
    private func initState(_ rect:CGRect){
       isInit = true
        viewW = rect.size.width
        viewH = rect.size.height
        context = UIGraphicsGetCurrentContext()  //因為物件是相同的所以可以放在先行宣告裡
        ballW = ballImg?.size.width
        ballH = ballImg?.size.height
       
        
//        var img = UIImage(named: "1066.jpg")
        imgW = img?.size.width
        imgH = img?.size.height
        
        
        Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: {(timer) in
            self.refreshView()
        })
        
        
    }
    
    func refreshView(){
        i += 1
        if i % 2 == 0{
            moveball()
        }
        setNeedsDisplay()
    }
    
    func moveball () {
        if ballX < 0 || ballX + ballW! > viewW {
            dX *= -2
        }
        if ballY < 0 || ballY + ballH! > viewH {
            dY *= -2
        }
        ballX += dX
        ballY += dY
        
        
        setNeedsDisplay()
    }
    
    //呈現外觀
    override func draw(_ rect: CGRect) {
       
        
        if !isInit {initState(rect)}
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        img?.draw(in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
        ballImg?.draw(in:CGRect(x: ballX,  y: ballY, width: ballW!, height: ballH!))
        
        
        
        
        
        
//        var temp = UIImageView(image: img)
//        temp.frame = CGRect(x: 0, y: 0, width: imgW!, height: imgH!)
//        addSubview(temp) //不同的層
        
//        let imgCG = img?.cgImage //上下顛倒
//        context?.draw(imgCG!, in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
        
//        context?.move(to: CGPoint(x: 0, y: 0))
//        context?.addLine(to: CGPoint(x: 0, y: 100))
//        context?.addLine(to: CGPoint(x: 100, y: 100))
//        context?.addLine(to: CGPoint(x: 100, y: 0))
//        context?.addLine(to: CGPoint(x: 0, y: 0))
//        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        
        
        
        
        
        for j in 0..<lines.count {
            if lines[j].count <= 1 {continue}
            for i in 1..<lines[j].count{
                let (p0x,p0y) = lines[j][i-1]
                let (p1x,p1y) = lines[j][i]
                context?.move(to: CGPoint(x: p0x,y: p0y))
                context?.addLine(to: CGPoint(x:p1x,y:p1y))
                context?.drawPath(using: CGPathDrawingMode.stroke)
                
            }
        }
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch1:UITouch = touches.first!
        let point1:CGPoint = touch1.location(in: self)
        
        lines += [[]]
        recycle = [[]]
        lines[lines.count-1] += [(point1.x,point1.y)]
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch1:UITouch = touches.first!
        let point1:CGPoint = touch1.location(in: self)
//        line += [(point1.x,point1.y)]
        lines[lines.count-1] += [(point1.x,point1.y)]
        setNeedsDisplay()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    func clear(){
        lines = [[]]
        recycle = [[]]
        setNeedsDisplay()
    }
    func undo(){
        if lines.count>0{
            
            recycle += [lines.remove(at: lines.count-1)]
            setNeedsDisplay()
        }
    }
    func redo(){
        if recycle.count>0{
            lines += [recycle.remove(at: recycle.count-1)]
            setNeedsDisplay()
        }

    }
}
