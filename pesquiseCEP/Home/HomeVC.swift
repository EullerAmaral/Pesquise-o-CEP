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
        homeScreen?.zipCodeTextField.delegate = self
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
                        
        if homeScreen?.zipCodeTextField.text == "" {
            let alert = UIAlertController(title: nil, message: "Digite um CEP", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }

        if let cep = homeScreen?.zipCodeTextField.text, !cep.isEmpty {
            CepAPI.shared.getCep(for: cep) { [weak self] result in
                switch result {
                case .success(let cepData):
                    DispatchQueue.main.async {
                        let vc = SearchCepVC(cepData: cepData)
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                case .failure(_): break
                }
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentText = textField.text as NSString? {
            let updatedText = currentText.replacingCharacters(in: range, with: string)

            let cleanText = updatedText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            if cleanText.count > 5 {
                let formattedText = String(cleanText.prefix(5)) + "-" + String(cleanText.dropFirst(5))

                textField.text = formattedText

                return false
            }
        }
        return true
    }
}
