//
//  DotView.swift
//  AirVeda UIKit
//
//  Created by Vedant Patil on 21/01/26.
//

import Foundation
import UIKit

class DotView: UIView {
    
    var dotDict: [Int: CGPoint] = [:]
    var set = Set<CGPoint>()
    var count = 0
    var cannotFormNewLine: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if frame == .zero, let superview = superview {
            frame = superview.bounds
        }
    }
    
    func setUpViews() {
        backgroundColor = .green
        isOpaque = true
    }
    
    func configureDot(location: CGPoint) {
        guard cannotFormNewLine == false else {
            return
        }
        
        if set.contains(location) {
            cannotFormNewLine = true
        }
        
        let x = location.x
        let y = location.y
        
        dotDict[count] = CGPoint(x: x, y: y)
        set.insert(CGPoint(x: x, y: y))
        
        let radius: CGFloat = 4.0
        let dotRect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
        let dotPath = UIBezierPath(ovalIn: dotRect)
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.blue.cgColor
        dotLayer.fillColor = UIColor.blue.cgColor
        layer.addSublayer(dotLayer)
        
        if count > 0, let lastPoint = dotDict[count - 1] {
            let linePath = UIBezierPath()
            linePath.move(to: lastPoint)
            linePath.addLine(to: CGPoint(x: x, y: y))
            
            let lineLayer = CAShapeLayer()
            lineLayer.path = linePath.cgPath
            lineLayer.strokeColor = UIColor.blue.cgColor
            lineLayer.lineWidth = 2.0
            lineLayer.fillColor = UIColor.clear.cgColor
            layer.addSublayer(lineLayer)
        }
        
        count += 1
    }
}
