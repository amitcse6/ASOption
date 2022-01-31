//
//  ASOptionViewController.swift
//  Gonzo
//
//  Created by AMIT on 1/26/22.
//

import UIKit

public class ASOptionView: UIView {
    var globalPoint: CGPoint = CGPoint.zero
    var anchorSize: CGSize = CGSize.zero
    var messages: [ASOptionMesage]?
    var mesageView: ASOptionMesageView?
    var isError: Bool?
    var paddingPoint: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(_ anchor: UIView, _ messages: [ASOptionMesage]?, _ isError: Bool, _ paddingPoint: CGPoint?) {
        super.init(frame: CGRect.zero)
        self.globalPoint = anchor.superview?.convert(anchor.frame.origin, to: nil) ?? CGPoint.zero
        self.anchorSize = anchor.bounds.size
        self.messages = messages
        self.isError = isError
        self.paddingPoint = paddingPoint
        initialize()
    }
    
    func initialize() {
        backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.7)
        var point = CGPoint(x: UIScreen.main.bounds.width-globalPoint.x, y: UIScreen.main.bounds.height - globalPoint.y)
        if let paddingPoint = paddingPoint {
            point.x += paddingPoint.x
            point.y += paddingPoint.y
        }
        self.mesageView = ASOptionMesageView(self.messages, self.isError)
        self.addSubview(mesageView.unsafelyUnwrapped)
        self.mesageView?.translatesAutoresizingMaskIntoConstraints = false
        self.mesageView?.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor).isActive = true
        self.mesageView?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -point.x+anchorSize.width+8).isActive = true
        self.mesageView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -point.y-16).isActive = true
    }
}
