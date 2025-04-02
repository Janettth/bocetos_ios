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
    var comentarios: Array<Comentario> = []
    
    
    var publicacion_seleccionada: Publicacion? = nil
    var  perfil_a_mostrar : Perfil? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.desdescargar_publicaciones()
            
            await self.descagar_monos_chinos()
        }
    }
    
    func descagar_monos_chinos() async{
        await print(DragonBallApi().descargar_pagina_personajes())
    }
    
    
    func desdescargar_publicaciones() async{
        
        defer{
            print("Esta funcion se mando a llamardespues de todos los awais en mi funcion option \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else {return}
        //publicaciones = publicaciones_descargadas
        publicacaiones = publicaciones_descargadas
        
        
        
    }
    
    func descagar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamardespues de todos los awais en mi funcion option \(#function)")
        }
        
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else {return}
        //publicaciones = publicaciones_descargadas
        comentarios = comentarios_descargados
    }
    
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descagar_comentarios()
        })
        
    }
    
    func descargar_perfil(id: Int) async -> Void{
        
        guard let perfil : Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else{ return}
        perfil_a_mostrar = perfil
    }
    
    func ver_perfil(id: Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id:id)
        }
    }
}
