//
//  CheckBox.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/14.
//

import SwiftUI

struct CheckBox<Label>: View where Label: View{
    // @Binding 親の値と共有したい
    @Binding var checked: Bool
    
    private var label: ()-> Label
    
    public init(checked: Binding<Bool>,
                @ViewBuilder label: @escaping ()-> Label)
    {
        self._checked = checked
        self.label = label
    }
    
    var body: some View {
        // チェックマーク切り替え
        HStack {
            Image(systemName: checked ? "checkmark.circle": "circle")
                .onTapGesture {
                    self.checked.toggle()
                }
            label()
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckBox(checked:
                            .constant(false)){
                Text("牛乳を買う")
            }
            CheckBox(checked:
                            .constant(true)){
                Text("牛乳を買う")
            }
        }
    }
}
