//
//  ContentView.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ProductoViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.estaCargando {
                    Spacer()
                    ProgressView("Cargando...")
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                    
                } else if let errorMessage = viewModel.mensajeDeError {
                    Spacer()
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                    Spacer()
                    
                } else {
                    ScrollView {
                        ForEach(viewModel.productos) { producto in
                            TarjetaProductoVista(producto: producto)
                                .padding()
                        }
                    }
                }
                
                Button("Ver productos") {
                    viewModel.recuperarProductos()
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Ejercicio")
        }
    }
}

#Preview {
    ContentView()
}
