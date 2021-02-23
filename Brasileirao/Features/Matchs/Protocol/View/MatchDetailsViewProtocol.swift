//
//  MatchDetailsViewProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import Foundation
import UIKit

protocol MatchDetailsViewProtocol {
    
    /// Método utilizado para setar o datasource da collectionview
    ///
    /// - Parameter datasource: MatchDetaislDataSource
    func setDataSource(datasource: MatchDetailsDataSource)
    
    /// Método utilizado para setar a controller da view
    ///
    /// - Parameter controller: objeto MatchDetailsViewController
    func setController(controller: MatchDetailsViewController)
    
    /// Método utilizado para setar o heroId e auxiliar na transição para a tela de detalhe
    ///
    /// - Parameter id: String de id do match
    func setHeroId(id: String)
    
    /// Método utilizado para setar m match do detalhe
    /// 
    /// - Parameter match: objeto Match
    func setMatch(match: Match)
    
    /// Método utilizado para mostrar quando o retorno do serviçø voltar vazio
    func setEmptyOnCollection()
    
    /// Métdo utilizado para restaurar  a collection
    func restoreCollection()
    
    /// Método utilizado para fazer o update da collection
    func updateCollection()
    
    /// Método utilizado para setar um erro na collectionview
    func setErrorOnCollection()
}
