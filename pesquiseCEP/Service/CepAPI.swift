import UIKit

class CepAPI: UIViewController {
            
    static let shared = CepAPI()
    
    var cepModel: ZipCodeModel?
    
    func getCep(for cep: String, completion: @escaping(Result<ZipCodeModel, CepError>) -> Void) {
        
        let endPoint: String = "https://viacep.com.br/ws/\(cep)/json/"
        
        guard let url: URL = URL(string: endPoint) else {
            completion(.failure(CepError.invalidURL(url: endPoint)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Erro: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Empty response")
                return
            }
            
            print("Status code: \(response.statusCode)")
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(ZipCodeModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json))
                    }
                    
                } catch {
                    completion(.failure(CepError.decodingError))
                    print(CepError.decodingError)
                    print(error.localizedDescription)
                    print("Esse aqui \(response.statusCode)")
                }
            }
        }
        task.resume()
    }
}
