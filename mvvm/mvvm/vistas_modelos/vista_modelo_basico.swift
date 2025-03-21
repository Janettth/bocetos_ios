//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var estado_actual_de_la_aplicacion: estados_de_la_aplicacion = .mostrando_series
    
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool{
        
        if let serie_nueva = serie{
            if(serie_nueva.nombre == ""){
                return false
            }
            
            series_registradas.append(serie_nueva)
        }
        else{
            //print("Hola mundo desde controlador")
            series_registradas.append(InformacionSerie(nombre: "Prueba", Tipo: "Miedo", fecha_estreni: 1998, sinopsis: "Sinopsis muy muylarga jsjssjsj aqui va una descripcion perra", caratula: "Imagen_ejemplo1"))
        }
        estado_actual_de_la_aplicacion = .mostrando_series
        return true
    }
    
    
    func cambiar_a_agregar_serie() -> Void{
        estado_actual_de_la_aplicacion = .agregando_series
    }
}
