class Lense < ApplicationRecord
    has_many :glasses
    enum Prescription_type: {
        fashion: 0,
        single_vision: 1,
        varifocal: 2
        }

    enum Lens_type: {
        classic: 0,
        blue_light: 1,
        transition: 2
        }
end
