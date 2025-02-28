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
                .foregroundColor(.primaryText) // Use the color palette
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("🌙 Fase da Lua: \(viewModel.moonPhase)")
                Text("🌅 Nascer da Lua: \(viewModel.moonrise)")
                Text("🌄 Pôr da Lua: \(viewModel.moonset)")
            }
            .font(.headline)
            .foregroundColor(.primaryText) // Use the color palette
            .padding()
            
            Button("Atualizar Dados") {
                viewModel.loadMoonData()
            }
            .padding()
            .background(Color.primaryAccent) // Use the color palette
            .foregroundColor(Color.primaryText)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background) // Use the color palette
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.loadMoonData()
        }
    }
}

#Preview {
    ContentView()
}
