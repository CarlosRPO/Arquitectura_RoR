class SessionsController < ApplicationController

	USER_LOGIN_SUCCESS 	= true
	USER_LOGIN_ERROR 		= false

	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)
		if @session.authenticate
			session['user_id'] = @session.current_user.id

			sl = SessionLog.new
			sl.user_name = session_params[:user_name]
			sl.logged_date = DateTime.now
			sl.success = USER_LOGIN_SUCCESS
			sl.save

			redirect_to users_path, notice: 'Bienvenido'
		else
			sl = SessionLog.new
			sl.user_name = session_params[:user_name]
			sl.logged_date = DateTime.now
			sl.success = USER_LOGIN_ERROR
			sl.error_message = 'Usuario y/o contraseña incorrecta'
			sl.save

			render :new
		end
	end

	def delete
		session['user_id'] = nil
		redirect_to login_path
	end

	private

	def session_params
		params.require(:session).permit(:user_name, :password)
	end
end