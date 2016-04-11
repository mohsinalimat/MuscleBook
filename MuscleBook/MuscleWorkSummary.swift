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

struct MuscleWorkSummary {
    let muscle: Muscle
    let exercise: ExerciseReference
    let movementClass: MuscleMovement.Classification
    let e1RM: Double?
    let maxE1RM: Double?
    let avgE1RM: Double?
    let volume: Double
    let maxVolume: Double?
    let avgVolume: Double?
}

extension MuscleWorkSummary {
    var activation: MuscleActivation? {
        return MuscleActivation(
            muscle: muscle,
            movementClass: movementClass,
            intensity: Activation(
                value: e1RM,
                max: maxE1RM,
                avg: avgE1RM
            ),
            volume: Activation(
                value: volume,
                max: maxVolume,
                avg: avgVolume
            )
        )
    }
}