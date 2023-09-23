import Foundation

struct CepModel: Codable {
    let cep: String
    let logradouro: String
    let localidade: String
    let estado: String
    
    enum CodingKeys: String, CodingKey {
        case cep
        case logradouro
        case localidade
        case estado = "uf"
    }
}
