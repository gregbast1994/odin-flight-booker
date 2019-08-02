class Airport < ApplicationRecord
    validates :country, :code, presence: true
end
