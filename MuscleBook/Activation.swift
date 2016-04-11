/*
 Muscle Book
 Copyright (C) 2016  Cristian Filipov

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import Foundation

public enum Activation: Int, Comparable {
    case None = 0
    case Light
    case Normal
    case High
    case Max
}

public func <(lhs: Activation, rhs: Activation) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

extension Activation {
    var color: UIColor {
        switch self {
        case .None: return UIColor.whiteColor()
        case .Light: return UIColor(rgba: "#ffffb2")
        case .Normal: return UIColor(rgba: "#fecc5c")
        case .High: return UIColor(rgba: "#fd8d3c")
        case .Max: return UIColor(rgba: "#e31a1c")
        }
    }

    var alpha: CGFloat {
        switch self {
        case .None: return 0
        case .Light: return 0.15
        case .Normal: return 0.5
        case .High: return 0.8
        case .Max: return 1
        }
    }

    init(value: Double?, max: Double?, avg: Double?, window: Double = 0.25) {
        guard let
            value = value,
            max = max,
            avg = avg
        else {
            self = .None
            return
        }

        let d = (avg * window)/2
        if value > max + 1 {
            self = .Max
            return
        }
        else if value > (avg + d) {
            self = .High
            return
        }
        else if value > (avg - d) {
            self = .Normal
            return
        }
        else if value > 0 {
            self = .Light
            return
        }
        else {
            self = .None
            return
        }
    }
}