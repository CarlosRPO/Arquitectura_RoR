class SessionLogsController < ApplicationController
  before_action :set_session_log, only: [:show, :edit, :update, :destroy]

  # GET /session_logs
  # GET /session_logs.json
  def index
    @session_logs = SessionLog.all
  end

  # GET /session_logs/1
  # GET /session_logs/1.json
  def show
  end

  # GET /session_logs/new
  def new
    @session_log = SessionLog.new
  end

  # GET /session_logs/1/edit
  def edit
  end

  # POST /session_logs
  # POST /session_logs.json
  def create
    @session_log = SessionLog.new(session_log_params)

    respond_to do |format|
      if @session_log.save
        format.html { redirect_to @session_log, notice: 'Session log was successfully created.' }
        format.json { render :show, status: :created, location: @session_log }
      else
        format.html { render :new }
        format.json { render json: @session_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_logs/1
  # PATCH/PUT /session_logs/1.json
  def update
    respond_to do |format|
      if @session_log.update(session_log_params)
        format.html { redirect_to @session_log, notice: 'Session log was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_log }
      else
        format.html { render :edit }
        format.json { render json: @session_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_logs/1
  # DELETE /session_logs/1.json
  def destroy
    @session_log.destroy
    respond_to do |format|
      format.html { redirect_to session_logs_url, notice: 'Session log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_log
      @session_log = SessionLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_log_params
      params.require(:session_log).permit(:user_name, :logged_date, :success, :error_message)
    end
end
