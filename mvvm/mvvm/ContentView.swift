//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(VistaModeloBasico.self) private var controlador
        
    @State var mostrs_agregar_pantalla: Bool = false
    
    var body: some View {
        
        if(!mostrs_agregar_pantalla){
            VStack {
                ForEach(controlador.series_registradas){
                    serie in Image(systemName: "plus")
                }
            }
            .padding()
            
            Button("Agrega una serie de prueba"){
                mostrs_agregar_pantalla = true
                //controlador.agregar_serie()
            }
        }
        else{
            AgregarSerie()
        }
        
     
        
    }
}

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
