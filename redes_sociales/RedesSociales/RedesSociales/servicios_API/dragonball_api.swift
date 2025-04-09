//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 2/4/25.
//

import SwiftUI

class DragonBallApi: Codable{
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultados?{
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_personaje(id: Int) async -> MonoChino?{
        let ubicacion_recurso = "/characters/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async  -> TipoGenerico?{
        
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.malaDireccionUrl}
            
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {
                throw ErroresDeRed.badStatus}
            
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo es: \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
            //return respuesta_decodificada
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
            print("En dragonball api")
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
