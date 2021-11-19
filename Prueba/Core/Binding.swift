//
//  Binding.swift
//  Prueba
//
//  Created by Brayan Galvis on 18/11/21.
//

import Foundation

class Binding<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?

    func dataBinding(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }
}
