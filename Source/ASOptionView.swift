//
//  ASOptionViewController.swift
//  Gonzo
//
//  Created by AMIT on 1/26/22.
//

import UIKit

public class ASOptionView: UIView {
    var globalPoint: CGPoint = CGPoint.zero
    var message: String!
    var mesageView: ASOptionMesageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(_ anchor: UIView, _ message: String) {
        super.init(frame: CGRect.zero)
        self.globalPoint = anchor.superview?.convert(anchor.frame.origin, to: nil) ?? CGPoint.zero
        self.message = message
        initialize()
    }
    
    func initialize() {
        backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.7)
        let point = CGPoint(x: UIScreen.main.bounds.width-globalPoint.x, y: globalPoint.y)
        self.mesageView = ASOptionMesageView(self.message)
        self.addSubview(mesageView)
        self.mesageView.translatesAutoresizingMaskIntoConstraints = false
        self.mesageView.topAnchor.constraint(equalTo: self.topAnchor, constant: point.y).isActive = true
        self.mesageView.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor).isActive = true
        self.mesageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -point.x).isActive = true
    }
}
