class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :pm_start_time
      t.string :reasons_for_consultation
      t.string :status
      t.timestamps
    end
  end
end
