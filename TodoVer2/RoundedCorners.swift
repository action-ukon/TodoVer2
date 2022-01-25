//
//  RoundedCorners.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/25.
//

import SwiftUI

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: <#T##Angle#>(degrees: -90), endAngle: <#T##Angle#>(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: <#T##Angle#>(degrees: -90), endAngle: <#T##Angle#>(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: <#T##Angle#>(degrees: -90), endAngle: <#T##Angle#>(degrees: 0), clockwise: false)
        
        return path
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners(tl: 30, tr: 30, bl: 30, br: 30).padding()
    }
}
