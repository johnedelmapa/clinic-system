class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :student_id, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :department, :string
    add_column :users, :phone, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :zipcode, :string
    add_column :users, :ec_firstname, :string
    add_column :users, :ec_lastname, :string
    add_column :users, :ec_mobile, :string
    add_column :users, :ec_relationship, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :bmi, :integer
    add_column :users, :bmi_interpretation, :string
    add_column :users, :blood_type, :string
    add_column :users, :hand_type, :string
    add_column :users, :smoke, :string
    add_column :users, :stick_count, :integer
    add_column :users, :smoke_duration, :string
    add_column :users, :alcohol, :string
    add_column :users, :alcohol_count, :integer
    add_column :users, :drug_history, :string
    add_column :users, :herbal_meds, :string
    add_column :users, :blood_transfusion, :string
    add_column :users, :artificial_body, :string
    add_column :users, :dentures, :string
    add_column :users, :corrective, :string
  end
end
