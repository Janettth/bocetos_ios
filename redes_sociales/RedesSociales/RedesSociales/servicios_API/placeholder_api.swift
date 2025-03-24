//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

class PlaceHolderAPI: Codable{
    func descargar_publicaciones(desde: String) async throws -> [Publicacion]?{
        
        do{
            guard let url = URL(string: desde) else { throw ErroresDeRed.malaDireccionUrl}
            
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {
                throw ErroresDeRed.badStatus}
            
            guard let respuesta_decodificada = try? JSONDecoder().decode([Publicacion].self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta}
            
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
        
        return nil
    }
}
