module SessionsHelper
  def log_in_nurse(nurse)
    session[:nurse_id] = nurse.id
  end

  def log_out_nurse
    session.delete(:nurse_id)
  end

  def current_nurse
    Nurse.find_by(id: session[:nurse_id])
  end

  def nurse_logged_in?
    !current_nurse.nil?
  end

  def log_in_doctor(doctor)
    session[:doctor_id] = doctor.id
  end

  def log_out_doctor
    session.delete(:doctor_id)
  end

  def current_doctor
    Doctor.find_by(id: session[:doctor_id])
  end

  def doctor_logged_in?
    !current_doctor.nil?
  end
end
