//
//  Landmark.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/03.
//

import Foundation
import SwiftUI
import CoreLocation
//LandmarkDetail에 이용할 여러 속성을 갖는 구조체 정의
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category//Category Enum을 사용한 변수를 속성으로 갖음
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
        
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_featrue") : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
