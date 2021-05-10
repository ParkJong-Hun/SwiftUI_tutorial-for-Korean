//
//  CategoryHome.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/07.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData//환경 객체로 모델 데이터를 선언
    @State private var showingProfile = false//프로필을 보일때 쓰는 스위치 역할 상태
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark:  $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)//CategoryRow의 형태로 카테고리의 여러 항목을 가져와 출력
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")//네비게이션 제목
            .toolbar {
                Button(action: { showingProfile.toggle()}) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }//툴바로 프로필 버튼 만들기. 클릭하면 showingProfile의 값을 바꿈.
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }//showingProfile이 참이면 sheet식으로 프로필을 보여줌.
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
