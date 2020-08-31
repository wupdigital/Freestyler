//
//  UIView+Styling.swift
//  Freestyler
//
//  Created by Dávid Széles-Szép on 2020. 08. 31..
//  Copyright © 2020. W.UP. All rights reserved.
//

import UIKit

public extension UIView {
    
    @objc
    func apply(style: NSObject) {
        let propertyMap = Freestyler.shared.propertyMap(from: style)
        Freestyler.shared.logStyle(style, propertyMap: propertyMap)
        
        apply(propertyMap: propertyMap)
    }
    
    
    private func apply(propertyMap: [String : Any]) {
        for (propertyName, propertyValue) in propertyMap {
            let setterStr = "set\(propertyName.prefix(1).capitalized + propertyName.dropFirst()):"
            
            if responds(to: NSSelectorFromString(setterStr)) {
                setValue(propertyValue, forKey: propertyName)
            } else {
                print("Freestyler WARNING - Property named '\(propertyName)' is not available in \(String(describing: type(of: self)))!")
            }
        }
    }
}
