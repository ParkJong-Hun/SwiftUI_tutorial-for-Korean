//
//  CircleImage.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("gwanghwamun")//해당 이미지를 출력
            .resizable()//크기 다시 지정(이미지에서 크기 지정하려면 반드시 입력)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)//해당 모양으로 만듦
            .overlay(Circle().stroke(Color.white, lineWidth: 4))//획 효과. 흰색. 폭 4
            .shadow(radius: 7)//그림자
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
