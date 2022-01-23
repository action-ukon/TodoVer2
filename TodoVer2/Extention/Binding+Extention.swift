//
//  Binding+Extention.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/23.
//

import SwiftUI

extension Binding {
    
    init<T>(isNotNil source: Binding<T?>, defaultValue: T) where Value == Bool {
        self.init(get: { source.wrappedValue != nil },
                  set: { source.wrappedValue = $0 ? defaultValue : nil })
    }

}
