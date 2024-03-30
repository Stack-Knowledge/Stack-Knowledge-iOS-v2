import SwiftUI

enum StudentBottomTab {
    case main, mission, store, rank
}

struct StudentTabBarView: View {
    @State var currentTab: StudentBottomTab = .main
    
    private let studentMainFactory: any StudentMainFactory
    private let studentMissionFactory: any StudentMissionFactory
    private let studentStoreFactory: any StudentStoreFactory
    private let studentRankFactory: any StudentRankFactory
    
    init(
        studentMainFactory: any StudentMainFactory,
        studentMissionFactory: any StudentMissionFactory,
        studentStoreFactory: any StudentStoreFactory,
        studentRankFactory: any StudentRankFactory
    ) {
        self.studentMainFactory = studentMainFactory
        self.studentMissionFactory = studentMissionFactory
        self.studentStoreFactory = studentStoreFactory
        self.studentRankFactory = studentRankFactory
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTab) {
                AnyView(studentMainFactory.makeView())
                    .tag(StudentBottomTab.main)
                    .tabItem {
                        StackKnowledgeAsset.TapBar.mainPageIcon.swiftUIImage
                            
                        Text("홈")
                            .skFont(.pr12)
                    }
                        
                AnyView(studentMissionFactory.makeView())
                    .tag(StudentBottomTab.mission)
                    .tabItem {
                        StackKnowledgeAsset.TapBar.missionPageIcon.swiftUIImage
                        
                        Text("문제")
                            .skFont(.pr12)
                    }
                        
                AnyView(studentStoreFactory.makeView())
                    .tag(StudentBottomTab.store)
                    .tabItem {
                        StackKnowledgeAsset.TapBar.storePageIcon.swiftUIImage
                        
                        Text("상점")
                            .skFont(.pr12)
                    }
                        
                AnyView(studentRankFactory.makeView())
                    .tag(StudentBottomTab.rank)
                    .tabItem {
                        StackKnowledgeAsset.TapBar.rankingPageIcon.swiftUIImage
                        
                        Text("랭킹")
                            .skFont(.pr12)
                    }
            }
            .accentColor(.black)
            
            VStack {
                Spacer()
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .foregroundColor(Color.SKColorSystem.Gray.lightgray1.color)
                    .padding(.bottom, 52)
            }
        }
    }
}
