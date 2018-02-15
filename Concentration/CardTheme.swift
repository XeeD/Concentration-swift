//
//  CardTheme.swift
//  Concentration
//
//  Created by Lukáš Voda on 10. 02.2018.
//  Copyright © 2018 Lukáš Voda. All rights reserved.
//

import Foundation

class CardTheme {
    static let themes = [
        ["🐶", "🐷", "🐥", "🦄", "🦋", "🐍", "🐙", "🦍", "🐿", "🐤", "🐼", "🦇", "🕷", "🦖", "🐅", "🦏", "🐪", "🐃", "🐏", "🦃", "🐾"],
        ["✈️", "🚀", "⛵️", "🚁", "🛸", "🚢", "🛥", "🚒", "🚄", "🚠", "🚟", "🚓", "🚌", "🚇", "🛩", "🚂", "🚖", "🚛", "🚑", "🛴", "🚲"]
    ]

    static func randomTheme() -> [String] {
        let randomTheme = themes[Int(arc4random_uniform(UInt32(themes.count)))]
        return randomTheme
    }
}
