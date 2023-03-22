class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.integer :consultation_id
      t.integer :user_id
      t.integer :doctor_appointment_id
      t.string :name
      t.string :frequency
      t.string :quantity

      t.timestamps
    end
  end
end
