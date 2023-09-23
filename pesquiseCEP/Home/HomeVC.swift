import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var api = CepAPI()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.delegate = self
    }
}

extension HomeVC: HomeScreenProtocol {
    func actionButton() {
        
        if let cep = homeScreen?.cepTextField.text, !cep.isEmpty {
            CepAPI.shared.getCep(for: cep) { result in
                switch result {
                case .success(let cepData):
                    DispatchQueue.main.async {
                        let vc = SearchCepVC(cepData: cepData)
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
}
