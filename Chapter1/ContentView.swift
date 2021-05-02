//
//  ContentView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView()//MapView 객체 불러오기
                .frame(height:300)//크기 지정
            CircleImage()//CircleImage 객체 불러오기
                .offset(y: -130)//위치 지정
                .padding(.bottom, -130)//아래 공간 지정
            VStack/*여러개의 뷰 수직으로 사용가능*/(alignment: .leading)/*stack의 정렬지정*/ {
                Text("광화문")/*text값*/
                    .font(.title)/*font값*/
                HStack/*수평 여러개 뷰*/ {
                    Text("종로구 세종로 69")
                    Spacer()//부모 뷰에 속한 공간을 사용
                    Text("서울특별시")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("광화문에 관해")
                    .font(.title2)
                Text("경복궁의 정문 광화문에 대한 설명")
            }
            .padding()//해당 뷰의 바깥 공간 추가
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
