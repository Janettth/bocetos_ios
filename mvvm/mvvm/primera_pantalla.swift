//
//  primera_pantalla.swift
//  mvvm
//
//  Created by alumno on 3/14/25.
//

import  SwiftUI

@main
struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup(id: "nombre"){ //el id ayuda a identificar el windowgoup
            ContentView()
                .environment(controlador_basico)
        }
        
        
    }
}
