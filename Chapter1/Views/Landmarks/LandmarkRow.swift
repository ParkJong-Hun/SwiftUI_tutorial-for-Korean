//
//  LandmarkRow.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/03.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark//랜드마크를 상속받은 객체 생성
    
    var body: some View {
        HStack {
            landmark.image//랜드마크의 이미지 속성에 값을 넣음
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")/*별 무늬 추가*/
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks//랜드마크스를 모델데이터를 이용한 랜드마크스로 지정.
    
    static var previews: some View {
        Group {//미리보기에 보여질 랜드마크로우를 두 개 만듦.
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))//레이아웃 크기 지정
    }
}
