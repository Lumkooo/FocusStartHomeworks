//
//  UIViewExtension.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
