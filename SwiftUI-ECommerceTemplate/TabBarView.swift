//
//  TabBarView.swift
//  SwiftUI-ECommerceTemplate
//
//  Created by Ryan J. W. Kim on 2022/02/13.
//

import SwiftUI

struct TabBarView: View {
    // MARK: - Properties
    @Binding var selectedTab: Int
    @Namespace private var currentTab
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(tabs.indices) { index in
                GeometryReader { geo in
                    VStack(spacing: 4) {
                        if selectedTab == index {
                            Color(.label)
                                .frame(height: 2)
                                .offset(y: -2)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        Image(systemName: tabs[index].image)
                            .font(.title2)
                            .frame(height: 20)
//                        Text(tabs[index].label)
//                            .font(.caption2)
//                            .fixedSize()
                    }  //: VStack
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geo.size.width / 2, height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = index
                        }
                        // Think if haptic is needed for eCommerce
                        if selectedTab == 2 {
                            UINotificationFeedbackGenerator().notificationOccurred(.error)

                        } else {
                        UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        }
                    }
                    .foregroundColor(selectedTab == index ? .orange : .secondary)
                }  //: GeoReader
                .frame(height: UIScreen.main.bounds.height/10, alignment: .center)
            }  //: Tabs Loop
        }  //: HStack
        .background(.thickMaterial)
        .cornerRadius(25, corners: [.topLeft, .topRight])
    }  //: body
}

struct Tab {
    let image: String
    let label: String
}

let tabs = [
    Tab(image: "house.fill", label: "Home"),
    Tab(image: "magnifyingglass", label: "Search"),
    Tab(image: "cart", label: "Cart"),
    Tab(image: "person", label: "MyPage"),
    Tab(image: "line.3.horizontal", label: "More")
]

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: Binding.constant(0))
            .padding()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
