//
//  MessageCell.swift
//  lemonadePrototype
//
//  Created by Justin Young on 7/30/18.
//  Copyright © 2018 Justin Young. All rights reserved.
//

import UIKit
import QuartzCore

class MessageCell: UITableViewCell {

    //outlets
    @IBOutlet weak var userImage: circleView!
    @IBOutlet weak var userMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message) {
        userMessage.text = message.message
        
        userMessage.layer.masksToBounds = true
        userMessage.layer.cornerRadius = 10
        userImage.image = message.profileImage
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ rect: CGRect) {
        var bubbleSpace = CGRect(origin: CGPoint(x: 20.0,y: self.bounds.origin.y), size: CGSize(width: self.bounds.width - 20, height: self.bounds.height))
        let bubblePath1 = UIBezierPath(roundedRect: bubbleSpace, byRoundingCorners: .TopLeft | .TopRight | .BottomRight, cornerRadii: CGSize(width: 20.0, height: 20.0))
        
        let bubblePath = UIBezierPath(roundedRect: bubbleSpace, cornerRadius: 20.0)
        
        UIColor.green.setStroke()
        UIColor.green.setFill()
        bubblePath.stroke()
        bubblePath.fill()
        
        var triangleSpace = CGRect(0.0, self.bounds.height - 20, 20, 20.0)
        var trianglePath = UIBezierPath()
        var startPoint = CGPoint(x: 20.0, y: self.bounds.height - 40)
        var tipPoint = CGPoint(x: 0.0, y: self.bounds.height - 30)
        var endPoint = CGPoint(x: 20.0, y: self.bounds.height - 20)
        trianglePath.move(to: startPoint)
        trianglePath.addLine(to: tipPoint)
        trianglePath.addLine(to: endPoint)
        trianglePath.close()
        UIColor.green.setStroke()
        UIColor.green.setFill()
        trianglePath.stroke()
        trianglePath.fill()
    }
    
    

}
