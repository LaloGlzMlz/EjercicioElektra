//
//  ListaProductos.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI

struct ListaProductos: View {
    @Environment(\.dismiss) private var dismiss
    
    let viewModel: ProductoViewModel
    
    @Binding var productoSeleccionado: Producto?
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.estaCargando {
                    ProgressView("Cargando...")
                        .progressViewStyle(.circular)
                } else if let errorMessage = viewModel.mensajeDeError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.productos) { producto in
                        if productoSeleccionado?.id == producto.id {
                            HStack {
                                Text(producto.nombre)
                                    .bold()
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        } else {
                            Text(producto.nombre)
                                .onTapGesture {
                                    productoSeleccionado = producto
                                    dismiss()
                                }
                        }
                    }
                }
            }
            .navigationTitle("Productos")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cerrar") { dismiss() }
                }
            }
        }
    }
}


//#Preview {
//    ListaProductos(viewModel: ProductoViewModel())
//}
