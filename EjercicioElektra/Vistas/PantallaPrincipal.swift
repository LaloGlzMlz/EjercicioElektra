//
//  ContentView.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct PantallaPrincipal: View {
    @State var viewModel = ProductoViewModel()
    
    @State var mostrandoPantallaProductos = false
    
    @State var productoMostrado: Producto?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let producto = productoMostrado {
                    ScrollView {
                        ProductoTarjeta(producto: producto)
                            .padding()
                    }
                } else {
                    VStack {
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay {
                        if productoMostrado == nil {
                            ContentUnavailableView(label: {
                                Label("Producto no seleccionado", systemImage: "list.clipboard.fill")
                            }, description: {
                                Text("Selecciona un producto para visualizar su información aquí.")
                            }, actions: {
                                Button("Ver productos") {
                                    viewModel.recuperarProductos()
                                    mostrandoPantallaProductos.toggle()
                                }
                                .buttonStyle(.borderedProminent)
                                .controlSize(.regular)
                            })
                            .offset(y: -40)
                        }
                    }
                }
            }
            .sheet(isPresented: $mostrandoPantallaProductos) {
                ListaProductos(viewModel: viewModel, productoSeleccionado: $productoMostrado)
            }
            .navigationTitle("Elektra")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.yellow.opacity(0.6), for: .navigationBar)
            
            if productoMostrado != nil {
                Button("Ver productos") {
                    viewModel.recuperarProductos()
                    mostrandoPantallaProductos.toggle()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
        }
    }
}

#Preview {
    PantallaPrincipal(productoMostrado: Producto(id: "1", nombre: "NintendoSwitch", codigoCategoria: "N", precioRegular: 500, urlImagenes: [URL(string: "https://assets.nintendo.eu/image/private/f_auto,c_limit,w_1920,q_auto:low/odxx8ysoourxkmjhb00e")!, URL(string: "https://i.ytimg.com/vi/CH8MWz8fCOk/maxresdefault.jpg")!]))
}
