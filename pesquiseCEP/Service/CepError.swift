import UIKit

enum CepError: Error {
case invalidURL(url: String)
case invalidResponse
case decodingError
}
