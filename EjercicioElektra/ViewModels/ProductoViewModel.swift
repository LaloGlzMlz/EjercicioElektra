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
    
    func obtenerProductos() {
        Task {
            mensajeDeError = nil
            productos = []
            estaCargando = true
            
            do {
                let productosObtenidos = try await productoServicio.fetchProductos()
                productos = productosObtenidos
            } catch {
                mensajeDeError = "No se pudieron obtener los productos: \(error.localizedDescription)"
            }
            
            // ya no esta cargando
            estaCargando = false
        }
    }
}
