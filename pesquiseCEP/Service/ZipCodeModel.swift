import Foundation

struct ZipCodeModel: Codable {
    let zipCode: String
    let streetOrAvenue: String
    let neighborhood: String
    let city: String
    let state: String
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "cep"
        case streetOrAvenue = "logradouro"
        case neighborhood = "bairro"
        case city = "localidade"
        case state = "uf"
    }
}
