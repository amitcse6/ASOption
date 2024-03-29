//
//  ASOptionMesageView.swift
//  Gonzo
//
//  Created by AMIT on 1/30/22.
//

import Foundation
import UIKit
import MapKit



class ASOptionMesageView: UIView {
    var stackView: UIStackView?
    var arrowView: UIView?
    var messages: [ASOptionMesage]?
    var textAlignment: NSTextAlignment?
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 8
    var isError: Bool?
    var props: ASOProps?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(_ messages: [ASOptionMesage]?, _ isError: Bool?, _ props: ASOProps?) {
        super.init(frame: CGRect.zero)
        self.messages = messages
        self.isError = isError
        self.props = props
        initialize()
    }
    
    func initialize() {
        backgroundColor = (isError != nil && isError! == false) ?
        ((props?.normalBackColor != nil) ? props?.normalBackColor :  UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)) :
        ((props?.errorBackColor != nil) ? props?.errorBackColor :  UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1))
        
        
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.borderColor =  (isError != nil && isError! == false) ?
        ((props?.normalBorderColor != nil) ? props?.normalBorderColor?.cgColor :  backgroundColor?.cgColor) :
        ((props?.errorBorderColor != nil) ? props?.errorBorderColor?.cgColor :  backgroundColor?.cgColor)
        
        stackView = UIStackView()
        stackView?.axis  = .vertical
        stackView?.alignment = .fill
        stackView?.spacing   = 0
        stackView?.backgroundColor = .clear
        self.addSubview(stackView.unsafelyUnwrapped)
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        stackView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        stackView?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        stackView?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        stackView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        arrowView = UIView()
        arrowView?.backgroundColor =  backgroundColor
        self.addSubview(arrowView.unsafelyUnwrapped)
        arrowView?.translatesAutoresizingMaskIntoConstraints = false
        arrowView?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        arrowView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        arrowView?.widthAnchor.constraint(equalToConstant: 10).isActive = true
        arrowView?.heightAnchor.constraint(equalToConstant: 10).isActive = true
        arrowView?.transform = CGAffineTransform(rotationAngle: -45 * CGFloat(Double.pi)/180);
        
        let gesture = ASOptionGestureRecognizer(target: self, action: #selector(onTap))
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
        
        addView()
    }
    
    @objc func onTap() {
    }
    
    func addView() {
        if let messages = messages {
            let textColor = (isError != nil && isError! == false) ?
            ((props?.normalForgColor != nil) ? props?.normalForgColor :  .white) :
            ((props?.errorForgColor != nil) ? props?.errorForgColor :  .white)
            for (_, message) in messages.enumerated() {
                let messageChildView = ASOptionMesageChildView(message.sl, message.message)
                messageChildView.slLabel?.textColor = textColor
                messageChildView.slLabel?.font = props?.font ?? messageChildView.slLabel?.font
                messageChildView.messageLabel?.textColor = textColor
                messageChildView.messageLabel?.font = props?.font ?? messageChildView.messageLabel?.font
                stackView?.addArrangedSubview(messageChildView)
            }
        }
    }
}
