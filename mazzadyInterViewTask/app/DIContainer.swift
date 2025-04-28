//
//  DIContainer.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 26/04/2025.
//

final class AppDIContainer {
    
    static let shared = AppDIContainer()
    
    private init() {}
    
    // MARK: - User
    private var userNetworkService: UserNetworkProtocol.Type {
        return UserNetworkImpl.self
    }
    
    private var userRepository: UserRepositoryProtocol {
        return UserRepositoryImpl(networkService: userNetworkService)
    }
    
    private var userUseCase: GetUserDataUseCaseProtocol {
        return GetUserDataUseCaseImpl(repository: userRepository)
    }
    
    func makeUserViewModel() -> UserViewModel {
        return UserViewModel(userUseCase: userUseCase)
    }
    
    // MARK: - Advertisements
    private var advertisementNetworkService: AdvertisementNetworkProtocol.Type {
        return AdvertisementNetworkImpl.self
    }
    
    private var advertisementRepository: AdsRepositoryProtocol {
        return AdsRepositoryImpl(networkService: advertisementNetworkService)
    }
    
    private var advertisementUseCase: GetAdvertisementsUseCaseProtocol {
        return GetAdvertisementsUseCaseImpl(repository: advertisementRepository)
    }
    
    func makeAdvertisementViewModel() -> AdvertisementViewModel {
        return AdvertisementViewModel(getAdvertisementsUseCase: advertisementUseCase)
    }
    // MARK: - Tags
    private var tagsNetworkService: TagsNetworkProtocol.Type {
        return TagsNetworkImpl.self
    }

    private var tagsRepository: TagsRepositoryProtocol {
        return TagsRepositoryImpl(networkService: tagsNetworkService)
    }

    private var tagsUseCase: GetTagsUseCaseProtocol {
        return GetTagsUseCaseImpl(repository: tagsRepository)
    }

    func makeTagsViewModel() -> TagsViewModel {
        return TagsViewModel(getTagsUseCase: tagsUseCase)
    }
     // MARK: - Products
    private var productsNetworkService: ProductNetworProtocol.Type {
        return ProductNetworkImpl.self
    }
    private var checkInternetConnectionUseCase: CheckInternetConnectionUseCaseProtocol {
          return CheckInternetConnectionUseCase()
      }
      
    private var productsRepository: ProductReopProtocol {
        return ProductRepoImpl(networkService: productsNetworkService)
    }

    private var productsUseCase: GetProductUseCaseProtocol {
        return GetProductsUseCaseImpl(repository: productsRepository)
    }
    private var searchProductsUseCase: SearchProductsUseCaseProtocol {
        return SearchProductsUseCaseImpl()
    }
    private var resetSearchProductsUseCase: ResetProductsSearchUseCaseProtocol {
        return ResetProductsSearchUseCaseImpl()
    }

    func makeProductsViewModel() -> ProductsViewModel {
        return ProductsViewModel(getProductsUseCase: productsUseCase, searchProductsUseCase: searchProductsUseCase,resetProductsSearchUseCase: resetSearchProductsUseCase)
    }
    
}
