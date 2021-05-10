//
//  Profile.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/08.
//

import Foundation

struct Profile {//프로필 구조쳬 정의
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `deafault` = Profile(username: "g_kumar")//default값
    
    enum Season: String, CaseIterable, Identifiable {//계절 복합체
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "⛄️"
        
        var id: String { self.rawValue }
    }
}
