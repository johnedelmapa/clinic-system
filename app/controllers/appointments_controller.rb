class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: :confirmation
    def choose_options
    end

    def confirmation
      UserMailer.confirmation_message(current_user, @appointment).deliver
    end
  
    # GET /appointments or /appointments.json
    def index
      start_date = params.fetch(:start_date, Date.today).to_date
      @appointments = current_user.appointments.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end

    # GET /appointments/1 or /appointments/1.json
    def show
    end
  
    # GET /appointments/new
    def new
      @appointment = current_user.appointments.build
    end
  
    # GET /appointments/1/edit
    def edit
    end
  
    # POST /appointments or /appointments.json
    def create
      @appointment = current_user.appointments.build(appointment_params)
      if @appointment.save
        redirect_to confirmation_appointment_url(@appointment), notice: "Appointment was successfully created."
      else
        render :new
      end
    end
  
    # PATCH/PUT /appointments/1 or /appointments/1.json
    def update
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /appointments/1 or /appointments/1.json
    def destroy
      @appointment.destroy
  
      respond_to do |format|
        format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def appointment_params
        params.require(:appointment).permit(:user_id, :start_time, :pm_start_time, :reasons_for_consultation, :status)
      end
  end
  