//
//  ProductoServicio.swift
//  EjercicioElektra
//
//  Created by Eduardo Gonzalez Melgoza on 23/07/25.
//

import Foundation

class ProductoServicio {
    func fetchProductos() async throws -> [Producto] {
        
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/apps/moviles/caso-practico/plp") else {
            throw NSError(domain: "InvalidURL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let productoResponse = try decoder.decode(ProductoRespuesta.self, from: data)
        
        return productoResponse.resultado.productos
    }
}
