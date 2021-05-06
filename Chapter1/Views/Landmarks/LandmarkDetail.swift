//
//  ContentView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData //모델 데이터 생성
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }//각 랜드마크의 인덱스를 저장하는 변수 생성
    
    var body: some View {
        ScrollView {//스크롤 가능한 뷰
            MapView(coordinate: landmark.locationCoordinate)//MapView 객체 불러오기
                .frame(height:300)//크기 지정
            CircleImage(image: landmark.image)//CircleImage 객체 불러오기
                .offset(y: -130)//위치 지정
                .padding(.bottom, -130)//아래 공간 지정
            VStack/*여러개의 뷰 수직으로 사용가능*/(alignment: .leading)/*stack의 정렬지정*/ {
                HStack {
                    Text(landmark.name)/*text값*/
                        .font(.title)/*font값*/
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)//각 landmarks의 isFavorite를 이용한 isSet을 조절하는 FavoriteButton 생성
                }
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
        .navigationTitle(landmark.name)//네비게이션 제목
        .navigationBarTitleDisplayMode(.inline)//네비게이션 디스플레이 모드
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])//미리보기로 모델데이터를 이용한 랜드마크 리스트를 사용한 랜드마크를 이용한 랜드마크 디테일을 보여줌.
            .environmentObject(modelData)
    }
}
