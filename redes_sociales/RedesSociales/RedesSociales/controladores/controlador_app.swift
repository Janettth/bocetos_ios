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
    
    //seccion dragon ball
    
    var pagina_resultados: PaginaResultados? = nil
    var persoanje: MonoChino? = nil
    var pagina_resultados_planetas: PaginaResultadosPlanetas? = nil
    var planeta: Planeta? = nil
    
    
    init(){
        Task.detached(priority: .high){
            await self.desdescargar_publicaciones()
            
            await self.descagar_monos_chinos()
        }
    }
    
    func descagar_monos_chinos() async{
        guard let pagina_descargada: PaginaResultados = try? await DragonBallApi().descargar_pagina_personajes() else {return}
        
        self.pagina_resultados = pagina_descargada
        //await DragonBallApi().descargar_pagina_personajes()
    }
    
    func descargar_planetas() async{
        guard let planetas_descargados: PaginaResultadosPlanetas = try? await DragonBallApi().descargar_pagina_planetas() else {return}
        
        self.pagina_resultados_planetas = planetas_descargados
    }
    
    
    func descrgar_info_planeta(id: Int) async {
        guard let planeta_decargado = try? await DragonBallApi().descargar_informacion_planeta(id: id)
        else {return}
        
        self.planeta = planeta_decargado
    }
    
    func descargar_informacion_planeta(id: Int){
        Task.detached(operation: {
            await self.descrgar_info_planeta(id: id)
        })
    }
    
    func descargar_info_personaje(id: Int) async {
        guard let MonoChino = try? await DragonBallApi().descargar_informacion_personaje(id: id) 
        else {return}
        
        self.persoanje = MonoChino
    }
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
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
