//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 26/3/25.
//

import SwiftUI

@Observable
@MainActor

public class controladorAplicacion{
    var publicacaiones: Array<Publicacion> = []
    
    var publicacion_seleccionada: Int = -1
    
    init(){
        Task.detached(priority: .high){
            await self.desdescargar_publicaciones()
        }
    }
    
    func desdescargar_publicaciones() async{
        
        defer{
            print("Esta funcion se mando a llamardespues de todos los awais en mi funcion option \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones(desde: "") else {return}
                //publicaciones = publicaciones_descargadas
            publicacaiones = publicaciones_descargadas
        
        
      
    }
    
    func descagar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamardespues de todos los awais en mi funcion option \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones(desde: "") else {return}
                //publicaciones = publicaciones_descargadas
            publicacaiones = publicaciones_descargadas
    }
}
