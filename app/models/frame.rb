class Frame < ApplicationRecord
    has_many :glasses
    enum Status: {
        active: 0,
        inactive: 1
    }
end
