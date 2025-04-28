//
//  GetTagsUseCaseProtocol.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation
protocol GetTagsUseCaseProtocol {
    func execute(completion: @escaping ([Tag]?) -> Void)
}
