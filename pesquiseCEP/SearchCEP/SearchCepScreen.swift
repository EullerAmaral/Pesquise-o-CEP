import UIKit

class SearchCepScreen: UIView {

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
    
    lazy var localidadeLabel: UILabel = {
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
    
    func displayCep(_ cepData: CepModel) {
        cepLabel.text = "CEP: \(cepData.cep)"
        logradouroLabel.text = "Logradouro: \(cepData.logradouro)"
        localidadeLabel.text = "Localidade: \(cepData.localidade)"
        estadoLabel.text = "Estado: \(cepData.estado)"
    }
    
    func addElements() {
        addSubview(cepLabel)
        addSubview(logradouroLabel)
        addSubview(localidadeLabel)
        addSubview(estadoLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cepLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cepLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            cepLabel.widthAnchor.constraint(equalToConstant: 180),
            
            logradouroLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            logradouroLabel.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 20),
            logradouroLabel.widthAnchor.constraint(equalToConstant: 180),
            
            localidadeLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            localidadeLabel.topAnchor.constraint(equalTo: logradouroLabel.bottomAnchor, constant: 20),
            localidadeLabel.widthAnchor.constraint(equalToConstant: 180),
            
            estadoLabel.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            estadoLabel.topAnchor.constraint(equalTo: localidadeLabel.bottomAnchor, constant: 20),
            estadoLabel.widthAnchor.constraint(equalToConstant: 180),
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue .withAlphaComponent(1.9)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
