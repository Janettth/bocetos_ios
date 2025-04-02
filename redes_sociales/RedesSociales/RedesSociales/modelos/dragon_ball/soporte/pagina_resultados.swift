//
//  pagina_resultados.swift
//  RedesSociales
//
//  Created by alumno on 2/4/25.
//


struct Meta: Codable{
    let totalItems : Int
    let itemCount : Int
    let itemsPerPage : Int
    let totalPages: Int
    let currentPage : Int
}

struct Enlaces: Codable{
    let first : String
    let previous : String
    let next : String
    let last : String
}


struct PaginaResultados: Codable{ //, Identifiable
    //var id: Int = Self.meta.currentPage
    let items : [MonoChino]
    let meta : Meta
    let links : Enlaces
}
