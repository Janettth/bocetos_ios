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
    @State var plataformas_agregadas: [Plataforma] = []
    
    @State var nombre_plataforma: String = ""
    @State var imagen_plataforma: String = ""
    @State var plataforma_seleccionada: Plataforma? = nil
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text("Hola mundo")
        TextField("Nombre", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        
        ScrollView(.horizontal){
            Text("Plataformas")
            HStack{
                ForEach(plataformas_agregadas){
                    plataforma in Text(plataforma.nombre)
                }
            }
        }.sheet(isPresented: $mostrar_agregar_plataformas){
            
            Text("Agrega una plataforma")
            
            TextField("Nombre de plataforma", text: $nombre_plataforma)
            TextField("Selecciona la imagen",text: $imagen_plataforma)
            
            ScrollView{
                VStack{
                    ForEach(plataformas){ plataforma in
                        Text(plataforma.nombre)
                    }
                }
            }
            
            Button("Agregar plataforma"){
                if !nombre_plataforma.isEmpty && !imagen_plataforma.isEmpty{
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
    
                    plataformas_agregadas.append(plataforma_nueva)
                    
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                }
            }
        }
        
        Spacer()
        Spacer()
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        Button("Agregar plataforma"){
            mostrar_agregar_plataformas = true
        }
        
        Spacer()
        
        Button("Agregar seire"){
            print("agregar serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, Tipo: tipo_de_la_serie, plataformas:plataformas_agregadas, fecha_estreni: 1, sinopsis: "Una sinopsis", caratula: "Imagen serie")
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
            
        }
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
