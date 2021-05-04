//
//  Chapter1App.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI
//메인 파일. 이 파일이 가장 먼저 실행됨.
@main
struct Chapter1App: App {
    @StateObject private var modelData = ModelData()//정적 객체를 이용해 앱의 수명 동안 한 번만 지정된 속성으로 모델 데이터를 초기화하여 생성
    var body: some Scene {
        WindowGroup {
            ContentView()//가장 처음에 시작하는 것은 ContentView.swift
                .environmentObject(modelData)
        }
    }
}
