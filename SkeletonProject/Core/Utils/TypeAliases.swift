//
//  TypeAliases.swift
//  SkeletonProject
//
//  Created by Matej Persic on 06.10.2024..
//

import Foundation

typealias EmptyCallback = () -> Void
typealias ArgCallback<T> = (T) -> Void
typealias UUIDCallback = (UUID) -> Void
typealias Callback<T> = (T) -> Void

typealias ErrorCallback = (Error) -> Void
typealias DismissWithCallback = (EmptyCallback?) -> Void
