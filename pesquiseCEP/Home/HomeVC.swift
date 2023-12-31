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
        homeScreen?.cepTextField.delegate = self
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
                        
        if homeScreen?.cepTextField.text == "" {
            let alert = UIAlertController(title: nil, message: "Digite um CEP", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
        }

        if let cep = homeScreen?.cepTextField.text, !cep.isEmpty {
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
        // Obtém o texto atual do UITextField
        if let currentText = textField.text as NSString? {
            let updatedText = currentText.replacingCharacters(in: range, with: string)

            // Remove todos os caracteres não numéricos
            let cleanText = updatedText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

            // Verifica se o texto possui mais de 5 dígitos
            if cleanText.count > 5 {
                // Insere um traço após o quinto dígito
                let formattedText = String(cleanText.prefix(5)) + "-" + String(cleanText.dropFirst(5))

                // Atualiza o texto do UITextField com a formatação
                textField.text = formattedText

                // Retorna falso para impedir a inserção automática do texto
                return false
            }
        }

        // Permite que a inserção de texto continue
        return true
    }
}
