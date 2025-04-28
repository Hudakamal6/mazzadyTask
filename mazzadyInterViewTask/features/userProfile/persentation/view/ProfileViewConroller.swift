import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var userView: UserDataView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    @IBOutlet var adsView: AdsView!
    
    @IBOutlet weak var tagsView: TagsView!
    
    @IBOutlet weak var productsView: ProductView!
    
    @IBOutlet weak var switchButtoneView: switchButtonsView!
    
    @IBOutlet weak var searchView: SearchView!
    @IBOutlet weak var settingsView: SettingView!
    
    // MARK: - ViewModels
    
    var userDataViewModel: UserViewModel!
    var adsViewModel: AdvertisementViewModel!
    var tagsViewModel: TagsViewModel!
    var productsViewModel: ProductsViewModel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchProducts()
        fetchUserData()
        fetchAds()
        fetchTags()
        setupTapToDismissKeyboard()
    }

    // MARK: - Setup
    private func setupViews() {
        searchView.delegate = self
        settingsView.delegate = self
        setupLoadingIndicator()
        bindViewModel()
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .large
    }

    private func bindViewModel() {
        userDataViewModel.onImageDownloaded = { [weak self] in
            guard let self = self else { return }
            if let image = self.userDataViewModel.userImage {
                self.userView.userImageView.image = image
            }
        }
    }

    // MARK: - Fetching Data
    private func fetchUserData() {
        loadingIndicator.startAnimating()
        userView.isHidden = true

        userDataViewModel.getUserData { [weak self] success in
            guard let self = self else { return }
            self.loadingIndicator.stopAnimating()

            if success, let user = self.userDataViewModel.user {
                self.userView.isHidden = false
                self.updateUI(with: user)
            } else {
                self.showError()
            }
        }
    }

    private func fetchAds() {
        adsView.adsViewModel = adsViewModel
        adsView.adsViewModel?.fetchAdvertisements { }
    }

    private func fetchProducts() {
        productsView.viewModel = productsViewModel
        productsView.viewModel?.fetchProducts { [weak self] in
            self?.productsView.productsCollectionView.reloadData()
        }
    }

    private func fetchTags() {
        tagsView.tagsViewModel = tagsViewModel
        tagsView.tagsViewModel?.fetchAds { }
    }

    // MARK: - UI Update
    private func updateUI(with user: UserEntity) {
        userView.userNameLabel.text = user.name
        userView.countryLabel.text = user.country
        userView.cityLabel.text = user.city
        userView.emailLabel.text = user.username
        userView.followersCountLabel.text = "\(user.followersCount)"
        userView.followingCountLabel.text = "\(user.followingCount)"

    }

    // MARK: - Error Handling
    private func showError() {
        let alert = UIAlertController(title: "Error", message: "Failed to load user data.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // MARK: - Gesture Detector Handling
    private func setupTapToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        if searchView.searchTextField.isFirstResponder {
            searchView.searchTextField.resignFirstResponder()
            searchView.searchTextField.text = "Search"
            productsView.viewModel?.resetSearch()
            productsView.productsCollectionView.reloadData()
        } else {
            searchView.searchTextField.resignFirstResponder()
        }
    }
}

// MARK: - SearchViewDelegate
extension UserViewController: SearchViewDelegate {
    func didUpdateSearchQuery(_ query: String) {
        productsViewModel.searchProducts(query: query)
        productsView.productsCollectionView.reloadData()
    }
}

// MARK: - SettingViewDelegate
extension UserViewController: SettingViewDelegate {
    func settingsButtonTapped() {
        let bottomSheetVC = SettingsBottomSheetViewController(nibName: "SettingsBottomSheetViewController", bundle: nil)
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheet.detents = [
                    .custom(resolver: { _ in
                        return 250
                    })
                ]
            } else {
                sheet.detents = [.medium()]
            }
            sheet.prefersGrabberVisible = true
        }

        present(bottomSheetVC, animated: true, completion: nil)
    }
}
