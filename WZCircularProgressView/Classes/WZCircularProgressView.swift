//
//  CircularProgressView.swift
//  CircularProgressView
//
//  Created by wannabewize's MBPT on 2017. 8. 30..
//  Copyright © 2017년 wannabewize's MBPT. All rights reserved.
//

import UIKit

public class WZCircularProgressView: UIView {
    @IBInspectable public var barWidth: CGFloat = 20
    @IBInspectable public var bgColor: UIColor = UIColor.lightGray
    @IBInspectable public var progressColor: UIColor = UIColor.black
    @IBInspectable public var minimum: CGFloat = 0
    @IBInspectable public var maximum: CGFloat = 100
    @IBInspectable public var value: CGFloat = 50 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // Todo: Counter-Clockwise
    var clockwise: Bool = true
    
    @IBInspectable public var text: String? {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var textColor: UIColor?
    @IBInspectable public var textFont: UIFont?

    var ratio: CGFloat {
        if maximum == minimum {
            return 0
        }
        return (value-minimum) / (maximum-minimum)
    }

    override public func draw(_ rect: CGRect) {
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius = min(self.bounds.width, self.bounds.height) / 2 - barWidth / 2

        let bgPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        bgPath.lineWidth = barWidth
        bgColor.setStroke()
        bgPath.stroke()
        
        let startAngle: CGFloat = -(CGFloat.pi/2)
        // Todo: Counter-Clockwise
        let endAngle: CGFloat = (CGFloat.pi*2) * ratio - CGFloat.pi/2

        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        progressPath.lineWidth = barWidth
        progressColor.setStroke()
        progressPath.stroke()
        
        if let text = text {
            #if swift(>=4.0)
                var attr : [NSAttributedStringKey: Any] = [:]
                attr[fontKey] = self.textFont ?? UIFont.preferredFont(forTextStyle: .body)
                attr[forgroundColorKey] = self.textColor ?? UIColor.black
                let size = (text as NSString).size(withAttributes: attr)
            #else
                var attr : [String: Any] = [:]
                attr[NSFontAttributeName] = self.textFont ?? UIFont.preferredFont(forTextStyle: .body)
                attr[NSForegroundColorAttributeName] = self.textColor ?? UIColor.black
                let size = (text as NSString).size(attributes: attr)
            #endif


            let textRect = CGRect(x: center.x - size.width/2, y: center.y - size.height/2, width: size.width, height: size.height)

            (text as NSString).draw(in: textRect, withAttributes: attr)
        }
    }
}
