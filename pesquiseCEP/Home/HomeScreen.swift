import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionButton()
}

class HomeScreen: UIView {
    
    var delegate: HomeScreenProtocol?
    
    func configBackground() {
        backgroundColor = .systemGray5
    }
    
    lazy var cepImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ceplogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var cepTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .gray
        textField.placeholder = "Digite o CEP"
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
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
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemRed
        button.clipsToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedButton() {
        self.delegate?.actionButton()
    }
    
    func addElements() {
        addSubview(cepImage)
        addSubview(cepTextField)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            cepImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            cepImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            cepImage.heightAnchor.constraint(equalToConstant: 250),
            cepImage.widthAnchor.constraint(equalToConstant: 250),
            
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
