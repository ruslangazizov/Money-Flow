//
//  PieChart.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 07.07.2021.
//

import Foundation
import UIKit



extension CGFloat {
    func radians() -> CGFloat {
        let b = CGFloat(Float.pi) * (self/180)
        return b
    }
}

extension UIBezierPath {
    convenience init(circleSegmentCenter center:CGPoint, radius:CGFloat, startAngle:CGFloat, endAngle:CGFloat)
    {
        self.init()
        self.move(to: CGPoint(x: center.x, y: center.y))
        self.addArc(withCenter: center, radius:radius, startAngle:startAngle.radians(), endAngle: endAngle.radians(), clockwise:true)
        self.close()
    }
}



func pieChart(pieces:[(UIBezierPath, UIColor)], viewRect:CGRect) -> UIView {
    var layers = [CAShapeLayer]()
    for p in pieces {
        let layer = CAShapeLayer()
        layer.path = p.0.cgPath
        layer.fillColor = p.1.cgColor
        layer.strokeColor = UIColor.white.cgColor
        layers.append(layer)
    }
    
    let view = UIView(frame: viewRect)
    for l in layers {
        
        view.layer.addSublayer(l)
        
        
    }
    return view
}



