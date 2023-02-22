# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Student.create(student_id: "TUPV190114")
Student.create(student_id: "TUPV190086")
Student.create(student_id: "TUPV190051")


nurse = Nurse.new(
    email: "nurse@gmail.com",
    firstname: "Nurse",
    lastname: "Account",
    password: "password",
    password_confirmation: "password" 
)
nurse.save!


doctor = Doctor.new(
    email: "doctor@gmail.com",
    firstname: "Doctor",
    lastname: "Account",
    password: "password",
    password_confirmation: "password" 
)
doctor.save!


user = User.new(
    email: "mapajohnedel@gmail.com",
    firstname: "Johnedel",
    lastname: "Mapa",
    password: "password",
    password_confirmation: "password",
    student_id: "TUPV190114",
    dob: "1199-11-21",
    gender: "male",
    department: "Information Technology",
    phone: "09468328005",
    street: "4th road",
    city: "Bacolod City",
    province: "Negros Occidental",
    zipcode: "6100",
    ec_firstname: "Liza",
    ec_lastname: "Mapa",
    ec_mobile: "09468328005",
    ec_relationship: "mother",
    height: 165,
    weight: 111,
    bmi: 345,
    bmi_interpretation: "Normal (18.4-24.9)",
    blood_type: "A",
    hand_type: "Left"
)
user.save


appointment = Appointment.new(
    user_id: 1,
    start_time: "2023-03-01 08:00:00.000000",
    pm_start_time: "2023-03-01 14:30:00.000000",
    reasons_for_consultation: "Check-up",
    status: "pending"
)

appointment.save


appointment1 = Appointment.new(
    user_id: 1,
    start_time: "2023-03-02 08:00:00.000000",
    pm_start_time: "2023-03-02 14:30:00.000000",
    reasons_for_consultation: "Check-up",
    status: "pending"
)

appointment1.save


appointment2 = Appointment.new(
    user_id: 1,
    start_time: "2023-03-03 08:00:00.000000",
    pm_start_time: "2023-03-03 14:30:00.000000",
    reasons_for_consultation: "Check-up",
    status: "pending"
)

appointment2.save
