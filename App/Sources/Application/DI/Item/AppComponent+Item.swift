import NeedleFoundation
import Service

public extension AppComponent {
    var remoteItemDataSource: any RemoteItemDataSource {
        shared {
            RemoteItemDataSourceImpl()
        }
    }

    var itemRepository: any ItemRepository {
        shared {
            ItemRepositoryImpl(remoteItemDataSource: remoteItemDataSource)
        }
    }

    var fetchItemListUseCase: any FetchItemListUseCase {
        shared {
            FetchItemListUseCaseImpl(itemRepository: itemRepository)
        }
    }
}
