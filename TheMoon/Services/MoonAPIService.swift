//
//  MoonAPIService.swift
//  TheMoon
//
//  Created by Gustavo Batista on 28/02/25.
//

import Foundation

struct AstronomyResponse: Codable {
    let astronomy: Astronomy
}

struct Astronomy: Codable {
    let astro: Astro
}

struct Astro: Codable {
    let moon_phase: String
    let moonrise: String
    let moonset: String
}

class MoonPhaseService {
    let apiKey = "97e81fc4849445f785630654252802"
    
    func fetchMoonData(for location: String, date: String, completion: @escaping (String?, String?, String?) -> Void) {
            let urlString = "https://api.weatherapi.com/v1/astronomy.json?key=\(apiKey)&q=\(location)&dt=\(date)"
            
            guard let url = URL(string: urlString) else {
                print("URL Inválida")
                DispatchQueue.main.async {
                    completion(nil, nil, nil)
                }
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Erro na requisição: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        completion(nil, nil, nil)
                    }
                    return
                }
                
                guard let data = data else {
                    print("Dados inválidos")
                    DispatchQueue.main.async {
                        completion(nil, nil, nil)
                    }
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(AstronomyResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedResponse.astronomy.astro.moonrise,
                                   decodedResponse.astronomy.astro.moonset,
                                   decodedResponse.astronomy.astro.moon_phase)
                    }
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                    DispatchQueue.main.async {
                        completion(nil, nil, nil)
                    }
                }
            }.resume()
        }
}
