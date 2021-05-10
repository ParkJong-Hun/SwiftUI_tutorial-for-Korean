//
//  FeatureCard.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/09.
//

import SwiftUI

struct FeatureCard: View {
    //featreCard 뷰 정의
    //랜드마크 객체 생성
    var landmark: Landmark
    //내용
    var body: some View {
        //이미지 배치.
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(landmark: landmark))
    }
}

struct TextOverlay: View {
    //텍스트 오버레이 구조체 생성
    var landmark: Landmark
    
    var gradient: LinearGradient {
        //그라디언트 효과
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}
