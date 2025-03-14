//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("Hola mundo desde controlador")
        series_registradas.append(InformacionSerie(nombre: "Prueba", Tipo: "Miedo", fecha_estreni: 1998, sinopsis: "Sinopsis muy muylarga jsjssjsj aqui va una descripcion perra", caratula: "Imagen_ejemplo1"))
    }
}
