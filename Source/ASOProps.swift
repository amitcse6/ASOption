//
//  ASOColorProps.swift
//  ASOption
//
//  Created by AMIT on 2/1/22.
//

import Foundation
import UIKit

public class ASOProps {
    var normalBackColor: UIColor?
    var normalForgColor: UIColor?
    var normalBorderColor: UIColor?
    var errorBackColor: UIColor?
    var errorForgColor: UIColor?
    var errorBorderColor: UIColor?
    
    public init(_ normalBackColor: UIColor?, _ errorBackColor: UIColor?) {
        self.normalBackColor = normalBackColor
        self.errorBackColor = errorBackColor
    }
    
    public init(_ normalBackColor: UIColor?, _ normalForgColor: UIColor?, _ errorBackColor: UIColor?, _ errorForgColor: UIColor?, _ normalBorderColor: UIColor?, _ errorBorderColor: UIColor?) {
        self.normalBackColor = normalBackColor
        self.normalForgColor = normalForgColor
        self.errorBackColor = errorBackColor
        self.errorForgColor = errorForgColor
        self.normalBorderColor = normalBorderColor
        self.errorBorderColor = errorBorderColor
    }
}
