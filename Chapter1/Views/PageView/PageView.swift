//
//  PageView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/09.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            //각 pages의 요소로 PageViewController를 보임.
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark:  $0) })//pages에 모델데이터의 features의 map 속성을 이용해 featureCard를 랜드마크 0번째 인자로서 가져옴
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
