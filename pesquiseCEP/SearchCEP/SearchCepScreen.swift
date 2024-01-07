import UIKit

protocol SearchCepScreenProtocol: AnyObject {
    func tappedButton()
}

internal class SearchCepScreen: UIView {

    var delegate: SearchCepScreenProtocol?
    
    private func configBackground() {
        backgroundColor = .white
    }
    
    private lazy var zipCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var streetOrAvenueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private lazy var neighborhoodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private lazy var mapImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "maplogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var newSearchButton: UIButton = {
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
    
    @objc private func tappedButton() {
        self.delegate?.tappedButton()
    }
    
    internal func displayCep(_ cepData: ZipCodeModel) {
        zipCodeLabel.text = "CEP: \(cepData.zipCode)"
        streetOrAvenueLabel.text = "Logradouro: \(cepData.streetOrAvenue)"
        neighborhoodLabel.text = "Bairro: \(cepData.neighborhood)"
        cityLabel.text = "Cidade: \(cepData.city)"
        stateLabel.text = "Estado: \(cepData.state)"
    }
    
    private func addElements() {
        addSubview(zipCodeLabel)
        addSubview(streetOrAvenueLabel)
        addSubview(neighborhoodLabel)
        addSubview(cityLabel)
        addSubview(stateLabel)
        addSubview(mapImage)
        addSubview(newSearchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            zipCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            zipCodeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            zipCodeLabel.widthAnchor.constraint(equalToConstant: 180),
            
            streetOrAvenueLabel.leadingAnchor.constraint(equalTo: zipCodeLabel.leadingAnchor),
            streetOrAvenueLabel.topAnchor.constraint(equalTo: zipCodeLabel.bottomAnchor, constant: 20),
            streetOrAvenueLabel.widthAnchor.constraint(equalToConstant: 280),
            
            neighborhoodLabel.leadingAnchor.constraint(equalTo: zipCodeLabel.leadingAnchor),
            neighborhoodLabel.topAnchor.constraint(equalTo: streetOrAvenueLabel.bottomAnchor, constant: 20),
            neighborhoodLabel.widthAnchor.constraint(equalToConstant: 280),
            
            cityLabel.leadingAnchor.constraint(equalTo: zipCodeLabel.leadingAnchor),
            cityLabel.topAnchor.constraint(equalTo: neighborhoodLabel.bottomAnchor, constant: 20),
            cityLabel.widthAnchor.constraint(equalToConstant: 180),
            
            stateLabel.leadingAnchor.constraint(equalTo: zipCodeLabel.leadingAnchor),
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            stateLabel.widthAnchor.constraint(equalToConstant: 180),
            
            mapImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapImage.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 110),
            mapImage.heightAnchor.constraint(equalToConstant: 250),
            mapImage.widthAnchor.constraint(equalToConstant: 250),
            
            newSearchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newSearchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            newSearchButton.heightAnchor.constraint(equalToConstant: 45),
            newSearchButton.widthAnchor.constraint(equalToConstant: 130)
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
