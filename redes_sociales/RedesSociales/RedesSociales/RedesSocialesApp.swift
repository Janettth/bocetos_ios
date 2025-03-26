//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by alumno on 3/24/25.
//

import SwiftUI

@main
@MainActor
struct RedesSocialesApp: App {
    @State var controlador = controladorAplicacion()
    var body: some Scene {
        WindowGroup {
           GeneralPublicaciones()
                .environment(controlador)
        }
    }
}
