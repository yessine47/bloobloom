class Glass < ApplicationRecord
  belongs_to :frame
  belongs_to :lense
  belongs_to :user
end
