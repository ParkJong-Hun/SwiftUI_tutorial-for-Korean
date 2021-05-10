//
//  FavoriteButton.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/04.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool//바인딩 논리형 변수 선언(버튼이 활성화되어 있는지 체크)
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)//버튼이 활성화 되어 있으면 star.fill과 노란색으로, 아니면 star와 gray로 표시
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))//isSet의 내용을 데이터 소스로 전달함.
    }
}
