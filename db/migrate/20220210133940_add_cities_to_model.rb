class AddCitiesToModel < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :city
    add_reference :patients, :city
    add_reference :appointments, :city
  end
end
