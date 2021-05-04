//
//  LandmarkList.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/03.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData//모델 데이터는 환경 객체로서 부모에 적용된 수정 값을 자동으로 가져옴.
    @State private var showFavoritesOnly = false //좋아함 표시 기본으로 true로 설정.
    
    //랜드마크를 필터링함(showFavoritesOnly가 true이고 isFovorite에 있는 랜드마크가 아니면 안보이게)
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {//다른 페이지로 이동하는 뷰
            List/*필터링된 랜드마크스를 이용해 리스트생성*/ {
                //showFavoritesOnly를 작동시키는 토글(on/off) 버튼 만듦
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                //두개 이상의 다른 동적 뷰 그룹을 결합하려고 ForEach 사용
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(/*이동하는 페이지(ui뷰 위치)*/
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)//어떤 것을 클릭해야 이동하는지
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()//한개의 랜드마크 리스트
            .environmentObject(ModelData())
    }
}
