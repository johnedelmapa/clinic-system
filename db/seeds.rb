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
    dob: "1998-11-21",
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

user1 = User.new(
    email: "test1@gmail.com",
    firstname: "Roden",
    lastname: "Lorem",
    password: "password",
    password_confirmation: "password",
    student_id: "TUPV190086",
    dob: "2000-03-14",
    gender: "male",
    department: "Information Technology",
    phone: "09468328005",
    street: "4th road",
    city: "Bacolod City",
    province: "Negros Occidental",
    zipcode: "6100",
    ec_firstname: "Lorem",
    ec_lastname: "Lorem",
    ec_mobile: "09468328005",
    ec_relationship: "father",
    height: 165,
    weight: 111,
    bmi: 345,
    bmi_interpretation: "Normal (18.4-24.9)",
    blood_type: "A",
    hand_type: "Left"
)
user1.save


appointment = Appointment.new(
    user_id: 1,
    start_time: "2023-03-29 08:00:00.000000",
    pm_start_time: "2023-03-29 14:30:00.000000",
    reasons_for_consultation: "Headache and mild cold",
    allergies: "fish, pork",
    status: "confirmed"
)

appointment.save


appointment01 = Appointment.new(
    user_id: 2,
    start_time: "2023-03-29 010:00:00.000000",
    pm_start_time: "2023-03-29 16:30:00.000000",
    reasons_for_consultation: "lorem test data",
    allergies: "lorem test data",
    status: "pending"
)

appointment01.save


appointment1 = Appointment.new(
    user_id: 1,
    start_time: "2023-03-30 08:00:00.000000",
    pm_start_time: "2023-03-30 14:30:00.000000",
    reasons_for_consultation: "Headache and mild cold",
    allergies: "fish, pork",
    status: "pending"
)

appointment1.save


appointment2 = Appointment.new(
    user_id: 1,
    start_time: "2023-03-31 08:00:00.000000",
    pm_start_time: "2023-03-31 14:30:00.000000",
    reasons_for_consultation: "Headache and mild cold",
    allergies: "fish, pork",
    status: "pending"
)

appointment2.save


doctor_appointment = DoctorAppointment.new(
    appointment_id: 1,
    user_id: 1,
    start_time: "2023-03-29 08:00:00.000000"
)

doctor_appointment.save
