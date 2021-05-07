//
//  BadgeBackground.swift
//  Chapter1
//
//  Created by 박종훈 on 2021/05/05.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in//화면에 꽉 채우고 가로 세로 비율이 유지되게 함
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)//사용자에게 보이는 가로 길이
                let height = width// " 세로 길이
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(//움직여서 그리게 하는 메서드
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )//점과 점을 이용해 선을 그음.
                    )
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )//선과 선 사이에 커브를 줌.
                }//HexagonParamters.segments에서 각 요소를 segment에 넣어서 path를 이용해 라인을 만듦
            }
            .fill(LinearGradient(
                gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),//그라디언트로 지정
                startPoint: UnitPoint(x: 0.5, y: 0),//시작 좌표
                endPoint: UnitPoint(x: 0.5, y: 0.6)//끝 좌표
            ))//선분 안에 갇힌 공간에 색을 채움.
        }
        .aspectRatio(1, contentMode: .fit)//1:1 가로세로 보기 모드 유지. 중앙에 정렬시킴.
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)//끝 색상 값
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)//끝 색상 값
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
