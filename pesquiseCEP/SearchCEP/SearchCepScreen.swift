import UIKit

protocol SearchCepScreenProtocol: AnyObject {
    func tappedButton()
}

class SearchCepScreen: UIView {

    var delegate: SearchCepScreenProtocol?
    
    func configBackground() {
        backgroundColor = .white
    }
    
    lazy var cepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var logradouroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var bairroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var cidadeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var estadoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var mapImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "maplogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var novaPesquisaButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nova pesquisa", for: .normal)
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
        self.delegate?.tappedButton()
    }
    
    func displayCep(_ cepData: CepModel) {
        cepLabel.text = "CEP: \(cepData.cep)"
        logradouroLabel.text = "Logradouro: \(cepData.logradouro)"
        bairroLabel.text = "Bairro: \(cepData.bairro)"
        cidadeLabel.text = "Cidade: \(cepData.cidade)"
        estadoLabel.text = "Estado: \(cepData.estado)"
    }
    
    func addElements() {
        addSubview(cepLabel)
        addSubview(logradouroLabel)
        addSubview(bairroLabel)
        addSubview(cidadeLabel)
        addSubview(estadoLabel)
        addSubview(mapImage)
        addSubview(novaPesquisaButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cepLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cepLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            cepLabel.widthAnchor.constraint(equalToConstant: 180),
            
            logradouroLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            logradouroLabel.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 20),
            logradouroLabel.widthAnchor.constraint(equalToConstant: 280),
            
            bairroLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            bairroLabel.topAnchor.constraint(equalTo: logradouroLabel.bottomAnchor, constant: 20),
            bairroLabel.widthAnchor.constraint(equalToConstant: 280),
            
            cidadeLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            cidadeLabel.topAnchor.constraint(equalTo: bairroLabel.bottomAnchor, constant: 20),
            cidadeLabel.widthAnchor.constraint(equalToConstant: 180),
            
            estadoLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            estadoLabel.topAnchor.constraint(equalTo: cidadeLabel.bottomAnchor, constant: 20),
            estadoLabel.widthAnchor.constraint(equalToConstant: 180),
            
            mapImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapImage.topAnchor.constraint(equalTo: estadoLabel.bottomAnchor, constant: 110),
            mapImage.heightAnchor.constraint(equalToConstant: 250),
            mapImage.widthAnchor.constraint(equalToConstant: 250),
            
            novaPesquisaButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            novaPesquisaButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            novaPesquisaButton.heightAnchor.constraint(equalToConstant: 45),
            novaPesquisaButton.widthAnchor.constraint(equalToConstant: 130)
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
