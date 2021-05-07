//
//  Badge.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/05.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8//회전 몇번 할지 지정
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }//위의 변수만큼 반복해서 RotatedBadgeSymbol을 가져다가 각도를 점점 바꿔서 배치.
        .opacity(0.5)//불투명도
    }
        
    var body: some View {
        ZStack {
            BadgeBackground()//만든 도형을 배치.
                
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor:.top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }//이미지 위치, 크기를 지정.
        }
        .scaledToFit()//꽉차게 함.
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
