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
end
