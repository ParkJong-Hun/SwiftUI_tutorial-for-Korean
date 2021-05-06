//
//  Hike.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/06.
//

import Foundation

//등산이라는 구조체 만듦.
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    //formatter이라는 길이를 표현하는 객체 만듦.
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        return Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    //관찰이라는 구조체를 만듦.
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
