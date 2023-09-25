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
        dismissKeyboard()
        configNavigationBar()
        self.homeScreen?.delegate = self
    }
    
    func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    func configNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
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
                        //self.present(vc, animated: true)
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(_):
                    print("Error")
                }
            }
        }
    }
}
