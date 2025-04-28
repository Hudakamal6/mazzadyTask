// AdvertisementViewModel.swift
import Foundation

class AdvertisementViewModel {
    
    private let getAdvertisementsUseCase: GetAdvertisementsUseCaseProtocol
    private var advertisements: [Advertisement] = []
    
    var onDataUpdated: (() -> Void)?
    init(getAdvertisementsUseCase: GetAdvertisementsUseCaseProtocol) {
        self.getAdvertisementsUseCase = getAdvertisementsUseCase
    }

    func fetchAdvertisements(completion: @escaping () -> Void) {

        getAdvertisementsUseCase.execute { [weak self] advertisements in
            if let ads = advertisements {
                self?.advertisements = ads
            } else {
                print("No advertisements found.")
            }
            
            DispatchQueue.main.async {
                self?.onDataUpdated?()
                completion()
            }
        }
    }

    func numberOfRows() -> Int {
        return advertisements.count
    }

    func advertisement(at index: Int) -> Advertisement {
        return advertisements[index]
    }
}
