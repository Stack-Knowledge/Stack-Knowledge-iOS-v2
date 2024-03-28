import SwiftUI

enum TeacherBottomTab {
    case main, scoring, making, store, rank
}

struct TeacherTabBarView: View {
    @State var currentTab: TeacherBottomTab = .main
    
    private let mainFactory: any TeacherMainFactory
    private let scoringFactory: any TeacherScoringFactory
    private let makingFactory: any TeacherMakingFactory
    private let storeFactory: any TeacherStoreFactory
    private let rankFactory: any TeacherRankFactory
    
    init(
        mainFactory: any TeacherMainFactory,
        scoringFactory: any TeacherScoringFactory,
        makingFactory: any TeacherMakingFactory,
        storeFactory: any TeacherStoreFactory,
        rankFactory: any TeacherRankFactory
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
                .tag(TeacherBottomTab.main)
                .tabItem {
                    StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
                        
                    Text("홈")
                        .skFont(.pr12)
                }
                    
            AnyView(scoringFactory.makeView())
                .tag(TeacherBottomTab.scoring)
                .tabItem {
                    StackKnowledgeAsset.TapBar.scoringPageIcon.swiftUIImage
                    
                    Text("채점하기")
                        .skFont(.pr12)
                }
            
            AnyView(makingFactory.makeView())
                .tag(TeacherBottomTab.making)
                .tabItem {
                    StackKnowledgeAsset.TapBar.makeMissionPageIcon.swiftUIImage
                    
                    Text("만들기")
                        .skFont(.pr12)
                }
                    
            AnyView(storeFactory.makeView())
                .tag(TeacherBottomTab.store)
                .tabItem {
                    StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
                    
                    Text("상점")
                        .skFont(.pr12)
                }
                    
            AnyView(rankFactory.makeView())
                .tag(TeacherBottomTab.rank)
                .tabItem {
                    StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
                    
                    Text("랭킹")
                        .skFont(.pr12)
                }
        }
        .accentColor(.black)
    }
}
