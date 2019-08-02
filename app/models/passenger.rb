class Passenger < ApplicationRecord
    belongs_to :flight
    validates :name, :age, presence: true
end
