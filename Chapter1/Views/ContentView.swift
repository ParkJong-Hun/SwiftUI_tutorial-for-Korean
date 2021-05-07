//
//  ContentView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured//탭을 이용한 selection 상태 변수 생성. 기본값:.featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }//탭 아이템 생성.
                .tag(Tab.featured)//태그값을 Tab.featured로 함.
            LandmarkList()//LandmarkList.swift를 불러옴
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)//태그값을 Tab.list로 함.
        }//TabeView로 생성(아래에 탭창이 있음)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())//모델데이터를 환경 객체로서 이용.
        //PreviewProvider(미리보기)에 ContentView()를 출력
    }
}
