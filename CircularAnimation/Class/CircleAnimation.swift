//
//  CircleAnimation.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import Foundation
import UIKit

class CircleAnimation : UIView{
    
    var circlePiece : CAShapeLayer = CAShapeLayer()
    var replicator : CAReplicatorLayer = CAReplicatorLayer()
    lazy var imageView : UIImageView = {
        let img = UIImageView(frame: self.bounds)
        img.layer.cornerRadius = self.bounds.width/2
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpShapeLayer()
        self.addSubview(imageView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpShapeLayer()
        self.addSubview(imageView)
    }
    
    func setUpShapeLayer(){
        if let sublayers = self.layer.sublayers,sublayers.contains(replicator){} else{
            
            circlePiece = CAShapeLayer()
            circlePiece.frame = self.bounds
            circlePiece.path = self.pathForCircle()
            circlePiece.strokeColor = UIColor.random().cgColor
            circlePiece.lineWidth = 0.5
            circlePiece.lineJoin = .round
            circlePiece.lineCap = .round
            circlePiece.fillColor = UIColor.clear.cgColor
            circlePiece.strokeEnd = 0.025
            let count = 1/circlePiece.strokeEnd
            //set up replicator
            replicator.instanceCount = Int(count)
            let angle = (2.0*Double.pi)/Double(count)
            replicator.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
            replicator.instanceRedOffset = -0.002
            replicator.instanceGreenOffset = -0.04
            replicator.instanceBlueOffset = -0.07
            replicator.addSublayer(circlePiece)
            self.layer.addSublayer(replicator)
        }
    }
    
    func pathForCircle()->CGPath{
        let path = UIBezierPath(ovalIn: self.bounds.insetBy(dx: 5, dy: 5))
        return path.cgPath
    }
    
    func animateSpinner(){
        let basic = CABasicAnimation(keyPath: "strokeEnd")
        basic.fromValue = circlePiece.strokeEnd
        basic.toValue = circlePiece.strokeEnd/5
        basic.duration = 0.5
        basic.autoreverses = true
        basic.repeatCount = .infinity
        replicator.instanceDelay = 0.05
        circlePiece.add(basic, forKey: "littleStrokes")
    }
    
    func removeAnimation(){
        replicator.removeFromSuperlayer()
        circlePiece.removeFromSuperlayer()
        let layer = CAShapeLayer()
        layer.path = self.pathForCircle()
        layer.strokeColor = UIColor.lightGray.cgColor
        layer.lineWidth = 0.5
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        replicator.frame = self.bounds
        let inset = self.bounds.width
        imageView.frame = self.bounds.insetBy(dx: inset, dy:inset)
        imageView.layer.cornerRadius = imageView.frame.width/2
    }
}
