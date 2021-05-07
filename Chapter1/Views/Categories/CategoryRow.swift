//
//  CategoryRow.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/07.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String//카테고리 이름 선언
    var items: [Landmark]//랜드마크 배열을 상속받은 items를 사용
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)//카테고리 이름 표시
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {//스크롤뷰 생성
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)) {
                                CategoryItem(landmark: landmark)
                            }
                        //네비게이션 링크로 LandmarkDetail을 갈 수 있게 카테고리 아이템 배치
                    }//CategoryItem을 이용해 이미지, 텍스트 출력.
                }
            }
        }
        .frame(height: 185)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))//랜드마크 0번째 인덱스의 이름값, 몇개를 출력할지를 미리보기에 인자로 전달.
        )
    }
}
