import SwiftUI

enum AdminBottomTab {
    case main, scoring, making, store, rank
}

struct AdminTabBarView: View {
    @State var currentTab: AdminBottomTab = .main
    
    private let mainFactory: any AdminMainFactory
    private let scoringFactory: any AdminScoringFactory
    private let makingFactory: any AdminMakingFactory
    private let storeFactory: any AdminStoreFactory
    private let rankFactory: any AdminRankFactory
    
    init(
        mainFactory: any AdminMainFactory,
        scoringFactory: any AdminScoringFactory,
        makingFactory: any AdminMakingFactory,
        storeFactory: any AdminStoreFactory,
        rankFactory: any AdminRankFactory
    ) {
        self.mainFactory = mainFactory
        self.scoringFactory = scoringFactory
        self.makingFactory = makingFactory
        self.storeFactory = storeFactory
        self.rankFactory = rankFactory
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            AnyView(mainFactory.makeView())
                .tag(AdminBottomTab.main)
                .tabItem {
                    StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
                        
                    Text("홈")
                        .skFont(.pr12)
                }
                    
            AnyView(scoringFactory.makeView())
                .tag(AdminBottomTab.scoring)
                .tabItem {
                    StackKnowledgeAsset.TapBar.scoringPageIcon.swiftUIImage
                    
                    Text("채점하기")
                        .skFont(.pr12)
                }
            
            AnyView(makingFactory.makeView())
                .tag(AdminBottomTab.making)
                .tabItem {
                    StackKnowledgeAsset.TapBar.makeMissionPageIcon.swiftUIImage
                    
                    Text("만들기")
                        .skFont(.pr12)
                }
                    
            AnyView(storeFactory.makeView())
                .tag(AdminBottomTab.store)
                .tabItem {
                    StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
                    
                    Text("상점")
                        .skFont(.pr12)
                }
                    
            AnyView(rankFactory.makeView())
                .tag(AdminBottomTab.rank)
                .tabItem {
                    StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
                    
                    Text("랭킹")
                        .skFont(.pr12)
                }
        }
        .accentColor(.black)
    }
}
