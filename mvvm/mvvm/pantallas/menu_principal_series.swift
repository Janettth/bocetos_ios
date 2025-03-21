//
//  menu_principal_series.swift
//  mvvm
//
//  Created by alumno on 3/21/25.
//

import SwiftUI

struct MenuPrincipalSeries: View {
    @Environment (VistaModeloBasico.self) var controlador
    var body: some View {
        ScrollView{
            VStack(alignment: HorizontalAlignment.center)
            {
                ForEach(controlador.series_registradas){
                    serie in Image(systemName: "star")
                }
            }
            .padding()
            
            Spacer()
            
            
        } .frame(width: 500, height: .infinity)
            .background(Color.green)
       
        Button("Agregar Serie"){
            controlador.cambiar_a_agregar_serie()
        }.foregroundColor(.black) .font(.title)
        
    }
}


#Preview {
    MenuPrincipalSeries()
        .environment(VistaModeloBasico())
}
