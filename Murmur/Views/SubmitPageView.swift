import SwiftUI

struct SubmitPageView: View {
    @StateObject private var model = CrushesListViewModel()
    @State private var selectedTab: Tab = .tab1

    enum Tab {
        case tab1, tab2, tab3
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab1View().tabItem {
                Image(selectedTab == .tab1 ? "Image" : "Image")
            }.tag(Tab.tab1)
            .background(Rectangle().foregroundColor(Color.blue.opacity(0.4)).frame(width: 2000, height: 150).offset(y: 438))

            Tab2View().tabItem {
                Image(selectedTab == .tab2 ? "Image 1" : "Image 1")
            }.tag(Tab.tab2)
            .background(Rectangle().foregroundColor(Color.blue.opacity(0.4)).frame(width: 2000, height: 150).offset(y: 438))

            Tab3View().tabItem {
                Image(selectedTab == .tab3 ? "Image 2" : "Image 2")
            }.tag(Tab.tab3)
            .background(Rectangle().foregroundColor(Color.blue.opacity(0.4)).frame(width: 2000, height: 150).offset(y: 438))
            
        }.onChange(of: selectedTab) { newTab in}
    }
}
