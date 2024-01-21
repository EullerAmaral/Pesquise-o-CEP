import UIKit

class SearchCepVC: UIViewController {

    var searchZipCodeScreen: SearchCepScreen?
    
    
    let zidCodeData: ZipCodeModel
    
    init(cepData: ZipCodeModel) {
        self.zidCodeData = cepData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        searchZipCodeScreen = SearchCepScreen()
        view = searchZipCodeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchZipCodeScreen?.displayCep(zidCodeData)
        searchZipCodeScreen?.delegate = self
    }
}

extension SearchCepVC: SearchCepScreenProtocol {
    func tappedButton() {
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
