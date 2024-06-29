import NeedleFoundation
import Service

public extension AppComponent {
    var remoteOrderDataSource: any RemoteOrderDataSource {
        shared {
            RemoteOrderDataSourceImpl()
        }
    }

    var orderRepository: any OrderRepository {
        shared {
            OrderRepositoryImpl(remoteOrderDataSource: remoteOrderDataSource)
        }
    }

    var orderItemUseCase: any OrderItemUseCase {
        shared {
            OrderItemUseCaseImpl(orderRepository: orderRepository)
        }
    }

    var fetchOrderedItemUseCase: any FetchOrderedItemUseCase {
        shared {
            FetchOrderedItemUseCaseImpl(orderRepository: orderRepository)
        }
    }

    var changeItemStateUseCase: any ChangeItemStateUseCase {
        shared {
            ChangeItemStateUseCaseImpl(orderRepository: orderRepository)
        }
    }
}
