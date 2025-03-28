//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI: Codable{
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones(/*desde: String*/) async throws -> [Publicacion]?{
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(post_id: Int) async -> [Comentario]?{
        let ubicacion_recurso = " /posts/1/comments"
        return await descargar(recurso: ubicacion_recurso)
        
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async  -> TipoGenerico?{
        
        do{
           guard let url = URL(string: "\(url_de_servicio)\(recurso)") else { throw ErroresDeRed.malaDireccionUrl}
            
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {
                throw ErroresDeRed.badStatus}
            
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
            return respuesta_decodificada
        }
        
        catch ErroresDeRed.malaDireccionUrl {
            print("mala url")
        }
        
        catch ErroresDeRed.badResponse {
            print("algo esta mal con la respuesta")
        }
        catch ErroresDeRed.badStatus {
            print("estatus negativo")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("mal modelo y su implementacion")
        }
        
        catch ErroresDeRed.invalidRequest {
            print("¿como llegasta hasta aqui?")
        }
        catch{
            print("Algo nalo acaba de suceder")
        }
        return nil
    }
    
    
    
}
