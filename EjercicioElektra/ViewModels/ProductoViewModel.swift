//
//  ProductoViewModel.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import SwiftUI
import Foundation

@Observable
class ProductoViewModel {
    var productos: [Producto] = []
    var estaCargando: Bool = false
    var mensajeDeError: String? = nil
    
    private let productoServicio = ProductoServicio()
    
    func recuperarProductos() {
        Task {
            mensajeDeError = nil
            productos = []
            estaCargando = true
            
            do {
                let productosRecuperados = try await productoServicio.fetchProductos()
                productos = productosRecuperados
            } catch {
                mensajeDeError = "Failed to fetch products: \(error.localizedDescription)"
            }
            
            // ya no esta cargando
            estaCargando = false
        }
    }
}
