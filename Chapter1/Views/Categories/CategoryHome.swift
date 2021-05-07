//
//  CategoryHome.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/07.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData//환경 객체로 모델 데이터를 선언
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)//CategoryRow의 형태로 카테고리의 여러 항목을 가져와 출력
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")//네비게이션 제목
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
