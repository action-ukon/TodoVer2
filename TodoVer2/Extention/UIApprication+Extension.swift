//
//  UIApprication+Extension.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/26.
//

import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
