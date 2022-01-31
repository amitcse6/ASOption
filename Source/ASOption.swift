//
//  ASOption.swift
//  Gonzo
//
//  Created by AMIT on 1/26/22.
//

import UIKit

public class ASOption: NSObject {
    static var sharedManager: ASOption?
    var optionView: ASOptionView? = nil
    
    @discardableResult
    static func shared() -> ASOption? {
        if sharedManager == nil {
            sharedManager = ASOption()
        }
        return sharedManager
    }
    
    private override init() {
    }
    
    func load(_ anchor: UIView?, _ messages: [ASOptionMesage]?, _ isError: Bool, _ animation: Bool?, _ paddingPoint: CGPoint?) {
        if let anchor = anchor, let messages = messages, let viewController = ASOption.topMostVC {
            remove()
            let optionView = ASOptionView(anchor, messages, isError, paddingPoint)
            viewController.view.addSubview(optionView)
            optionView.translatesAutoresizingMaskIntoConstraints = false
            optionView.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
            optionView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
            optionView.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
            optionView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
            
            let gesture = ASOptionGestureRecognizer(target: self, action: #selector(onTap))
            gesture.numberOfTapsRequired = 1
            optionView.addGestureRecognizer(gesture)
            optionView.isUserInteractionEnabled = true
            
            self.optionView = optionView
            startAnimating(animation)
        }
    }
    
    func startAnimating(_ animation: Bool?) {
        if let animation = animation, animation {
            UIView.animateKeyframes(withDuration: 2, delay: 3, options: .repeat, animations: {
                self.optionView!.mesageView!.center.x += 10
            }, completion: nil)
        }
    }
    
    @objc func onTap() {
        remove()
    }
    
    func remove() {
        if let _ = optionView {
            removeAllAnimationsFromMessageView()
            removeAllAnimations()
            self.optionView?.removeFromSuperview()
            self.optionView = nil
        }
    }
    
    func removeAllAnimations(){
        self.optionView?.layer.removeAllAnimations()
        self.optionView?.layer.removeAllAnimations()
        self.optionView?.layoutIfNeeded()
        
    }
    
    func removeAllAnimationsFromMessageView(){
        self.optionView?.mesageView?.layer.removeAllAnimations()
        self.optionView?.mesageView?.layer.removeAllAnimations()
        self.optionView?.mesageView?.layoutIfNeeded()
        
    }
    
    private static var topMostVC: UIViewController? {
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        if presentedVC == nil {
            print("Error: You don't have any views set.")
        }
        return presentedVC
    }
    
   
    
    public static func show(_ anchor: UIView?, _ message: String?, _ isError: Bool? = false, _ animation: Bool? = false, _ paddingPoint: CGPoint? = CGPoint.zero) {
        if let message = message {
            ASOption.shared()?.load(anchor, [ASOptionMesage("", message)], isError ?? false, animation ?? false, paddingPoint)
        }
    }
    
    public static func show(_ anchor: UIView?, _ messages: [String]?, _ isError: Bool? = false, _ sl: Bool? = true, _ animation: Bool? = false, _ paddingPoint: CGPoint? = CGPoint.zero) {
        if let messages = messages {
            let messagesNew: [ASOptionMesage] = messages.enumerated().map { (index, item) in
                if let sl = sl, sl {
                    return ASOptionMesage("\(index)", item)
                }
                return ASOptionMesage("", item)
            }
            ASOption.shared()?.load(anchor, messagesNew, isError ?? false, animation ?? false, paddingPoint)
        }
    }

    public static func show(_ anchor: UIView?, _ messages: [ASOptionMesage]?, _ isError: Bool? = false, _ animation: Bool? = false, _ paddingPoint: CGPoint? = CGPoint.zero) {
        ASOption.shared()?.load(anchor, messages, isError ?? false, animation ?? false, paddingPoint)
    }
    
    public static func remove() {
        ASOption.shared()?.remove()
    }
}

public class ASOptionGestureRecognizer: UITapGestureRecognizer {
    var firstObject: Any?
    
    func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    
    func getFirstObject() -> Any? {
        return self.firstObject
    }
}
