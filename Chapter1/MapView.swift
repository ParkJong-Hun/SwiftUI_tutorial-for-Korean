//
//  MapView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI
import MapKit //Mapkit 가져오기

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.575_578, longitude: 126.976_869),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )//지도의 지역 정보를 갖는 private state 변수 생성
    var body: some View {
        Map(coordinateRegion: $region)//region 변수를 이용해 지도 뷰를 생성
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
