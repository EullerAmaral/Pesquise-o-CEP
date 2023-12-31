import UIKit

class SearchCepVC: UIViewController {

    var searchCepScreen: SearchCepScreen?
    
    let cepData: CepModel
    
    init(cepData: CepModel) {
        self.cepData = cepData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        searchCepScreen = SearchCepScreen()
        view = searchCepScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCepScreen?.displayCep(cepData)
        searchCepScreen?.delegate = self
    }
}

extension SearchCepVC: SearchCepScreenProtocol {
    func tappedButton() {
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
