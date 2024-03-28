import SwiftUI

enum StudentBottomTab {
    case main, mission, store, rank
}

struct StudentTabBarView: View {
    @State var currentTab: StudentBottomTab = .main
    
    private let mainFactory: any StudentMainFactory
    private let missionFactory: any StudentMissionFactory
    private let storeFactory: any StudentStoreFactory
    private let rankFactory: any StudentRankFactory
    
    init(
        mainFactory: any StudentMainFactory,
        missionFactory: any StudentMissionFactory,
        storeFactory: any StudentStoreFactory,
        rankFactory: any StudentRankFactory
    ) {
        self.mainFactory = mainFactory
        self.missionFactory = missionFactory
        self.storeFactory = storeFactory
        self.rankFactory = rankFactory
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            AnyView(mainFactory.makeView())
                .tag(StudentBottomTab.main)
                .tabItem {
                    StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
                        
                    Text("홈")
                        .skFont(.pr12)
                }
                    
            AnyView(missionFactory.makeView())
                .tag(StudentBottomTab.mission)
                .tabItem {
                    StackKnowledgeAsset.TapBar.missionPageIcon.swiftUIImage
                    
                    Text("문제")
                        .skFont(.pr12)
                }
                    
            AnyView(storeFactory.makeView())
                .tag(StudentBottomTab.store)
                .tabItem {
                    StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
                    
                    Text("상점")
                        .skFont(.pr12)
                }
                    
            AnyView(rankFactory.makeView())
                .tag(StudentBottomTab.rank)
                .tabItem {
                    StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
                    
                    Text("랭킹")
                        .skFont(.pr12)
                }
        }
        .accentColor(.black)
    }
}
