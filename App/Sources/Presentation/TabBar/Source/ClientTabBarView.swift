import SwiftUI

enum ClientBottomTab {
    case main, mission, store, rank
}

struct ClientTabBarView: View {
    @State var currentTab: ClientBottomTab = .main
    
    private let mainFactory: any ClientMainFactory
    private let missionFactory: any ClientMissionFactory
    private let storeFactory: any ClientStoreFactory
    private let rankFactory: any ClientRankFactory
    
    init(
        mainFactory: any ClientMainFactory,
        missionFactory: any ClientMissionFactory,
        storeFactory: any ClientStoreFactory,
        rankFactory: any ClientRankFactory
    ) {
        self.mainFactory = mainFactory
        self.missionFactory = missionFactory
        self.storeFactory = storeFactory
        self.rankFactory = rankFactory
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            AnyView(mainFactory.makeView())
                .tag(ClientBottomTab.main)
                .tabItem {
                    StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
                        
                    Text("홈")
                        .skFont(.pr12)
                }
                    
            AnyView(missionFactory.makeView())
                .tag(ClientBottomTab.mission)
                .tabItem {
                    StackKnowledgeAsset.TapBar.missionPageIcon.swiftUIImage
                    
                    Text("문제")
                        .skFont(.pr12)
                }
                    
            AnyView(storeFactory.makeView())
                .tag(ClientBottomTab.store)
                .tabItem {
                    StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
                    
                    Text("상점")
                        .skFont(.pr12)
                }
                    
            AnyView(rankFactory.makeView())
                .tag(ClientBottomTab.rank)
                .tabItem {
                    StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
                    
                    Text("랭킹")
                        .skFont(.pr12)
                }
        }
        .accentColor(.black)
    }
}
