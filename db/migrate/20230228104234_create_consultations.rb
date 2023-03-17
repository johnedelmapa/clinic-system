class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.integer :user_id
      t.integer :doctor_appointment_id
      t.string :assessment
      t.string :diagnosis
      t.string :plan
      t.string :medical_prescriptions

      t.timestamps
    end
  end
end
