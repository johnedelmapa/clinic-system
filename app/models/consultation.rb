class Consultation < ApplicationRecord
    belongs_to :doctor_appointment
    has_many :prescriptions
end
