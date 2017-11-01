//
//  ViewController.swift
//  Example
//
//  Created by Lasha Efremidze on 10/18/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit
import Confetti

class ViewController: UIViewController {
    
    @IBOutlet weak var confettiView: ConfettiView!
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        confettiView.start([confettiView.cell(#imageLiteral(resourceName: "Pumpkin"), .orange), confettiView.cell(#imageLiteral(resourceName: "Bat"), .black)])
    }
    
}

class ConfettiView: UIView {
    
//    func start() {
//        let emitter = CAEmitterLayer()
//        emitter.emitterPosition = CGPoint(x: frame.size.width / 2, y: 0)
//        emitter.emitterShape = kCAEmitterLayerLine
//        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)
//        layer.addSublayer(emitter)
//
//        emitter.emitterCells = UIColor.all.map { confetti(color: $0, intensity: 0.1, image: #imageLiteral(resourceName: "circle")) }
//    }
    
    func stop() {
//        emitter.birthRate = 0
    }
    
    private func confetti(color: UIColor, intensity: Float, image: UIImage) -> CAEmitterCell {
        let confetti = CAEmitterCell()
        confetti.birthRate = 6.0 * intensity
        confetti.lifetime = 14.0 * intensity
        confetti.lifetimeRange = 0
        confetti.color = color.cgColor
        confetti.velocity = CGFloat(350.0 * intensity)
        confetti.velocityRange = CGFloat(80.0 * intensity)
        confetti.emissionLongitude = .pi
        confetti.emissionRange = .pi / 4
        confetti.spin = CGFloat(3.5 * intensity)
        confetti.spinRange = CGFloat(4.0 * intensity)
        confetti.scaleRange = CGFloat(intensity)
        confetti.scaleSpeed = CGFloat(-0.1 * intensity)
        confetti.contents = image.cgImage
        return confetti
    }
    
    // MARK: -
    
    func start(_ cells: [CAEmitterCell]) {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: frame.width / 2, y: 0)
//        emitter.emitterPosition = CGPoint(x: frame.width / 2, y: frame.height / 2)
        emitter.emitterSize = CGSize(width: frame.width, height: 1)
//        emitter.emitterSize = CGSize(width: 20, height: 20)
        emitter.emitterShape = kCAEmitterLayerLine
//        emitter.emitterShape = kCAEmitterLayerCircle
//        emitter.emitterMode = kCAEmitterLayerVolume
//        emitter.renderMode = kCAEmitterLayerAdditive
//        emitter.seed = (arc4random() % 1000) + 1
        
        emitter.emitterCells = cells
        
        emitter.beginTime = CACurrentMediaTime()
        
        layer.addSublayer(emitter)
    }
    
    func cell(_ image: UIImage, _ color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 10
        cell.lifetime = 7
        cell.velocity = 175
        cell.velocityRange = 40
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 4
//        cell.emissionRange = .pi * 2
        cell.spin = 2
        cell.spinRange = 2
        cell.scale = 0.15
        cell.scaleRange = 0.05
        cell.scaleSpeed = -0.01
        cell.contents = image.cgImage
        cell.color = color.cgColor
        return cell
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
    class var red: UIColor { return UIColor(red: 255, green: 59, blue: 48) }
    class var orange: UIColor { return UIColor(red: 255, green: 149, blue: 0) }
    class var yellow: UIColor { return UIColor(red: 255, green: 204, blue: 0) }
    class var green: UIColor { return UIColor(red: 76, green: 217, blue: 100) }
    class var tealBlue: UIColor { return UIColor(red: 90, green: 200, blue: 250) }
    class var blue: UIColor { return UIColor(red: 0, green: 122, blue: 255) }
    class var purple: UIColor { return UIColor(red: 88, green: 86, blue: 214) }
    class var pink: UIColor { return UIColor(red: 255, green: 45, blue: 85) }
    static let all: [UIColor] = [red, orange, yellow, green, tealBlue, blue, purple, pink]
}
