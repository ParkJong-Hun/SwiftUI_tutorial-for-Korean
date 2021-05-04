//
//  MapView.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/02.
//

import SwiftUI
import MapKit //Mapkit 가져오기

struct MapView: View {
    var coordinate: CLLocationCoordinate2D//좌표 위치 객체 생성
    @State private var region = MKCoordinateRegion()//좌표 지점 찍기 객체 생성
    //지도의 지역 정보를 갖는 private state 변수 생성
    var body: some View {
        Map(coordinateRegion: $region)//region 변수를 이용해 지도 뷰를 생성
            .onAppear {//좌표지점이 해당 지도에 나타나게 함
                setRegion(coordinate)
            }
    }
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {//좌표지점을 좌표에 지정
        region = MKCoordinateRegion(//좌표지점 스타일
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
