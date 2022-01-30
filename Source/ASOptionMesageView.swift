//
//  ASOptionMesageView.swift
//  Gonzo
//
//  Created by AMIT on 1/30/22.
//

import Foundation
import UIKit

class ASOptionMesageView: UIView {
    var label: UILabel?
    var message: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(_ message: String?) {
        super.init(frame: CGRect.zero)
        self.message = message
        initialize()
    }
    
    func initialize() {
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.white.cgColor
        
        label = UILabel()
        label?.text = message
        label?.textColor = .white
        label?.textAlignment = .center
        label?.numberOfLines = 0
        self.addSubview(label.unsafelyUnwrapped)
        label?.translatesAutoresizingMaskIntoConstraints = false
        label?.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        label?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        label?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        label?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        let gesture = ASOptionGestureRecognizer(target: self, action: #selector(onTap))
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
    }
    
    @objc func onTap() {
    }
}
