import Foundation

struct CepModel: Codable {
    let cep: String
    let logradouro: String
    let bairro: String
    let cidade: String
    let estado: String
    
    enum CodingKeys: String, CodingKey {
        case cep
        case logradouro
        case bairro
        case cidade = "localidade"
        case estado = "uf"
    }
}
