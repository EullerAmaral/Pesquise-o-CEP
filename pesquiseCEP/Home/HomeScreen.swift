import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionButton()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    
    func configBackground() {
        backgroundColor = .systemYellow
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pesquise o CEP"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var cepTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .gray
        textField.placeholder = "Digite o CEP"
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pesquisar CEP", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedButton() {
        self.delegate?.actionButton()
        print(#function)
    }
    
    func addElements() {
        addSubview(titleLabel)
        addSubview(cepTextField)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            
            cepTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            cepTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 430),
            cepTextField.heightAnchor.constraint(equalToConstant: 35),
            cepTextField.widthAnchor.constraint(equalToConstant: 230),
            
            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 15),
            searchButton.heightAnchor.constraint(equalToConstant: 45),
            searchButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
