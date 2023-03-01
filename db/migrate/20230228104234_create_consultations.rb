class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.integer :user_id
      t.integer :doctor_appointment_id
      t.string :assessment
      t.string :diagnosis
      t.string :plan
      t.string :t
      t.string :rr
      t.string :cr
      t.string :spo2
      t.string :bp1
      t.string :bp2

      t.timestamps
    end
  end
end
