class CreateDoctorAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_appointments do |t|
      t.integer :appointment_id
      t.integer :user_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
