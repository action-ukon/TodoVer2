//
//  UserView.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/16.
//

import SwiftUI

struct UserView: View {
    
    let image: Image
    let userName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("こんにちは")
                    .foregroundColor(Color.tTitle)
                    .font(.footnote)
                Text("\(userName)")
                    .foregroundColor(Color.tTitle)
                    .font(.title)
            }
            Spacer()
            Image("profile")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        .padding()
        .background(Color.tBackground)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            UserView(image: Image("profile"), userName: "User Name")
            Circle()
        }
    }
}
