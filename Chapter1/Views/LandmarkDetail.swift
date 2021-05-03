//
//  ContentView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)//MapView 객체 불러오기
                .frame(height:300)//크기 지정
            CircleImage(image: landmark.image)//CircleImage 객체 불러오기
                .offset(y: -130)//위치 지정
                .padding(.bottom, -130)//아래 공간 지정
            VStack/*여러개의 뷰 수직으로 사용가능*/(alignment: .leading)/*stack의 정렬지정*/ {
                Text(landmark.name)/*text값*/
                    .font(.title)/*font값*/
                HStack/*수평 여러개 뷰*/ {
                    Text(landmark.park)
                    Spacer()//부모 뷰에 속한 공간을 사용
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()//해당 뷰의 바깥 공간 추가
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
