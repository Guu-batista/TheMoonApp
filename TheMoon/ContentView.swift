//
//  ContentView.swift
//  TheMoon
//
//  Created by Gustavo Batista on 27/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoonPhaseViewModel()
    
    var body: some View {
        VStack {
            Text("Fases da Lua")
                .font(.title)
                .bold()
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("🌙 Fase da Lua: \(viewModel.moonPhase)")
                Text("🌅 Nascer da Lua: \(viewModel.moonrise)")
                Text("🌄 Pôr da Lua: \(viewModel.moonset)")
            }
            .font(.headline)
            .padding()
            
            Button("Atualizar Dados") {
                viewModel.loadMoonData()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            viewModel.loadMoonData()
        }
    }
}
