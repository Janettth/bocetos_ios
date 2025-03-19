//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self)private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre: "HBO", icono: "Icono plus"),
        Plataforma(nombre: "HBO", icono: "Icono plus"),
        Plataforma(nombre: "HBO", icono: "Icono plus"),
        Plataforma(nombre: "HBO", icono: "Icono plus"),
        Plataforma(nombre: "HBO", icono: "Icono plus"),
        Plataforma(nombre: "HBO", icono: "Icono plus")
    ]
    
    @State var indicar_problemas: Bool = false
    
    var body: some View {
        Text("Hola mundo")
        TextField("Nombre", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        
        ScrollView{
            Text("Plataformas")
            HStack{
                ForEach(plataformas){
                    plataforma in Text(plataforma.nombre)
                }
            }
        }
        
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        Button("Agregar plataforma"){
            print("Agregar, falta implementar")
        }
        Button("Agregar seire"){
            print("agregar serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, Tipo: tipo_de_la_serie, plataformas:plataformas, fecha_estreni: 1, sinopsis: "Una sinopsis", caratula: "Imagen serie")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
        }
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
