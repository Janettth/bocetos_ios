//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/3/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(controladorAplicacion.self) var controlador
    
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "valor por defecto")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "valor por defecto")")
        Text("Email: \(controlador.perfil_a_mostrar?.email ?? "valor por defecto")")
            .onDisappear(){
                print("Adios mundo")
            }
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(controladorAplicacion())
}
