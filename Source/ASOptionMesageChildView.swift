//
//  ASOptionMesageChildView.swift
//  Gonzo
//
//  Created by AMIT on 1/31/22.
//

import Foundation
import UIKit

class ASOptionMesageChildView: UIView {
    var slLabel: UILabel?
    var messageLabel: UILabel?
    var sl: String?
    var message: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(_ sl: String?, _ message: String?) {
        super.init(frame: CGRect.zero)
        self.sl = sl
        self.message = message
        initialize()
    }
    
    func initialize() {
        backgroundColor = .clear
        
        slLabel = UILabel()
        slLabel?.textColor = .white
        slLabel?.textAlignment = .left
        slLabel?.numberOfLines = 0
        slLabel?.text = sl
        self.addSubview(slLabel.unsafelyUnwrapped)
        slLabel?.translatesAutoresizingMaskIntoConstraints = false
        slLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        slLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        slLabel?.widthAnchor.constraint(equalToConstant: (slLabel?.text?.count ?? 0 > 0) ? 15 : 0).isActive = true
        
        messageLabel = UILabel()
        messageLabel?.textColor = .white
        messageLabel?.textAlignment = .left
        messageLabel?.numberOfLines = 0
        messageLabel?.text = message
        self.addSubview(messageLabel.unsafelyUnwrapped)
        messageLabel?.translatesAutoresizingMaskIntoConstraints = false
        messageLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        messageLabel?.leftAnchor.constraint(equalTo: self.slLabel.unsafelyUnwrapped.rightAnchor, constant: 0).isActive = true
        messageLabel?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
        messageLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
}
