//
//  CheckBox.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/14.
//

import SwiftUI

struct CheckBox: View {
    @State var checked: Bool = false
    var body: some View {
        Toggle(isOn: $checked) {
            Text("チェックボックス")
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckBox()
    }
}
