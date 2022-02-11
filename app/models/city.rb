class City < ApplicationRecord
  has_many :appointments
  has_many :patients
  has_many :doctors
end
