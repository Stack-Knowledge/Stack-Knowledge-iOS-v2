import SwiftUI

enum TeacherBottomTab {
    case main, scoring, making, store, rank
}

struct TeacherTabBarView: View {
    @State var currentTab: TeacherBottomTab = .main

    private let teacherMainFactory: any TeacherMainFactory
    private let teacherScoringFactory: any TeacherScoringFactory
    private let teacherMakingFactory: any TeacherMakingFactory
    private let teacherStoreFactory: any TeacherStoreFactory
    private let teacherRankFactory: any TeacherRankFactory

    init(
        teacherMainFactory: any TeacherMainFactory,
        teacherScoringFactory: any TeacherScoringFactory,
        teacherMakingFactory: any TeacherMakingFactory,
        teacherStoreFactory: any TeacherStoreFactory,
        teacherRankFactory: any TeacherRankFactory
    ) {
        self.teacherMainFactory = teacherMainFactory
        self.teacherScoringFactory = teacherScoringFactory
        self.teacherMakingFactory = teacherMakingFactory
        self.teacherStoreFactory = teacherStoreFactory
        self.teacherRankFactory = teacherRankFactory

        UITabBar.appearance().scrollEdgeAppearance = {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
            return appearance
        }()
    }

    var body: some View {
        TabView(selection: $currentTab) {
            AnyView(teacherMainFactory.makeView())
                .tag(TeacherBottomTab.main)
                .tabItem {
                    StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage

                    Text("홈")
                        .skFont(.pr12)
                }

            AnyView(teacherScoringFactory.makeView())
                .tag(TeacherBottomTab.scoring)
                .tabItem {
                    StackKnowledgeAsset.TapBar.missionPageIcon.swiftUIImage

                    Text("채점하기")
                        .skFont(.pr12)
                }

            AnyView(teacherMakingFactory.makeView())
                .tag(TeacherBottomTab.making)
                .tabItem {
                    StackKnowledgeAsset.TapBar.makeMissionPageIcon.swiftUIImage

                    Text("만들기")
                        .skFont(.pr12)
                }

            AnyView(teacherStoreFactory.makeView())
                .tag(TeacherBottomTab.store)
                .tabItem {
                    StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage

                    Text("상점")
                        .skFont(.pr12)
                }

            AnyView(teacherRankFactory.makeView())
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
