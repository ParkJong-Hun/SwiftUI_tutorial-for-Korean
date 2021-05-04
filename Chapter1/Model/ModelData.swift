//
//  ModelData.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/03.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")//landmark 구조체 양식을 따라 파일을 로드해서 landmarks에 배열로 저장. publi
}//관찰 가능한 객체를 구독해 데이터가 변경될 때마다 새로 고침하는 뷰를 업데이트. published를 사용해 구독자가 변경 사항을 선택할 수 있도록 함.

func load<T:Decodable>(_ filename: String) -> T {//로드하는 함수
    let data: Data
    
    //파일이 존재하는지 체크
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    //파일의 내용을 읽을 수 있는 형식인 데이터로 바꿈.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    //데이터를 제이슨파일을 해석하는 객체를 이용해 해석함.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
