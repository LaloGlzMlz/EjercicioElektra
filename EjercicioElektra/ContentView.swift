//
//  ContentView.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ProductoViewModel()
    
    @State var mostrandoPantallaProductos = false
    
    @State var productoMostrado: Producto?
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                if let producto = productoMostrado {
                    ScrollView {
                        TarjetaProductoVista(producto: producto)
                            .padding()
                    }
                } else {
                    Text("Selecciona un producto de la lista para visualizarlo aqui.")
                }
                
                Spacer()
                
                Button("Ver productos") {
                    viewModel.recuperarProductos()
                    mostrandoPantallaProductos.toggle()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $mostrandoPantallaProductos) {
                    ListaProductos(viewModel: viewModel, productoSeleccionado: $productoMostrado)
                }
            }
            .navigationTitle("Ejercicio")
        }
    }
}

#Preview {
    ContentView(productoMostrado: Producto(id: "1", nombre: "NintendoSwitch", codigoCategoria: "N", precioRegular: 500, urlImagenes: [URL(string: "https://assets.nintendo.eu/image/private/f_auto,c_limit,w_1920,q_auto:low/odxx8ysoourxkmjhb00e")!, URL(string: "https://i.ytimg.com/vi/CH8MWz8fCOk/maxresdefault.jpg")!]))
}
