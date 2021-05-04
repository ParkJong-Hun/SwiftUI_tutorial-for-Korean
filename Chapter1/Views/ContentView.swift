//
//  ContentView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()//LandmarkList.swift를 불러옴
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())//모델데이터를 환경 객체로서 이용.
        //PreviewProvider(미리보기)에 ContentView()를 출력
    }
}
