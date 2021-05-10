/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
        //나타남은 한쪽 슬라이드 모드, 사라지는건 점점 작아지면서 사라지게.
        //AnyTransition.move(edge: .trailing)//한쪽에서 슬라이드 모드
        //AnyTransition.slide//슬라이드 모드
    }
}
struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button(action: {
                    withAnimation/*( .easeInOut(duration:4))//페이드인아웃 형식으로 showDetial을 보임.*/ {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil)//애니메이션 효과 없음
                        .scaleEffect(showDetail ? 1.5 : 1)//확대
                        .padding()
                        //.animation(.spring())//버튼스프링 효과
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)//moveAndFade에 저장된 값을 이용해 모드를 바꿈.
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
