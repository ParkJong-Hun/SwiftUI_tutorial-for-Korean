//
//  MapView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI
import MapKit //Mapkit 가져오기

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    //지도의 지역 정보를 갖는 private state 변수 생성
    var body: some View {
        Map(coordinateRegion: $region)//region 변수를 이용해 지도 뷰를 생성
            .onAppear {
                setRegion(coordinate)
            }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
