//
//  MoonAPIViewModel.swift
//  TheMoon
//
//  Created by Gustavo Batista on 28/02/25.
//

import Foundation

class MoonPhaseViewModel: ObservableObject {
    @Published var moonPhase: String = "Carregando..."
    @Published var moonrise: String = "Carregando..."
    @Published var moonset: String = "Carregando..."
    
    private let moonPhaseService = MoonPhaseService()
    
    func loadMoonData() {
        let location = "Campinas, Brazil"
        let date = "2025-02-28"
        
        moonPhaseService.fetchMoonData(for: location, date: date) { moonrise, moonset, phase in
            self.moonrise = moonrise ?? "Erro"
            self.moonset = moonset ?? "Erro"
            self.moonPhase = phase ?? "Erro"
        }
    }
}

