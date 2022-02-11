# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Appointment.destroy_all

10.times do
  city = City.create!(
    name: Faker::Address.city
    )
end

10.times do
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    zip_code: Faker::Address.zip_code, 
    city_id: City.all.sample.id
    )
end

Specialty.create!(specialty: "1")
Specialty.create!(specialty: "2")
Specialty.create!(specialty: "3")
Specialty.create!(specialty: "4")
Specialty.create!(specialty: "5")
Specialty.create!(specialty: "6")

10.times do
  join = JoinTableDoctorSpecialty.create!(
    doctor: Doctor.all.select(:id).sample, 
    specialty: Specialty.all.select(:id).sample
    )
end

10.times do
  patient = Patient.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    city_id: City.all.sample.id
    )
end

10.times do
  appointment = Appointment.create!(
    doctor: Doctor.all.sample, 
    patient: Patient.all.sample, 
    date: Faker::Date.forward(days: 100), 
    city_id: City.all.sample.id
    )
end
