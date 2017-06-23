//
//  PainterView.swift
//  MyApp08 0622
//
//  Created by iii-user on 2017/6/23.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit

class PainterView: UIView {

    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    private var lines:Array<Array<(CGFloat,CGFloat)>> = []
    
    //呈現外觀
    override func draw(_ rect: CGRect) {
       viewW = rect.size.width
       viewH = rect.size.height
        
        let context:CGContext? = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        if line.count <= 1 {return}
        for i in 1..<line.count{
            let (p0x,p0y) = line[i-1]
            let (p1x,p1y) = line [i]
            context?.move(to: CGPoint(x: p0x,y: p0y))
            context?.addLine(to: CGPoint(x:p1x,y:p1y))
            context?.drawPath(using: CGPathDrawingMode.stroke)
            
        }
        
        
//        context?.move(to: CGPoint(x: 0, y: 0))
//        context?.addLine(to: CGPoint(x: 0, y: 100))
//        context?.addLine(to: CGPoint(x: 100, y: 100))
//        context?.addLine(to: CGPoint(x: 100, y: 0))
//        context?.addLine(to: CGPoint(x: 0, y: 0))
//        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch1:UITouch = touches.first!
        let point1:CGPoint = touch1.location(in: self)
        
        lines += [[]]
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
}
