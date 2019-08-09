class Passenger < ApplicationRecord
    has_many :bookings
    has_many :flights, :through => :bookings

    validates :name, :age, presence: true

    private
    def passenger_params
        params.require(:passenger).permit(:name, :age)
    end
end
