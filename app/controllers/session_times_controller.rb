class SessionTimesController < ApplicationController
  before_action :set_session_time, only: [:show, :edit, :update, :destroy]

  # GET /session_times
  # GET /session_times.json
  def index
    @session_times = SessionTime.all
  end

  # GET /session_times/1
  # GET /session_times/1.json
  def show
  end

  # GET /session_times/new
  def new
    @session_time = SessionTime.new
  end

  # GET /session_times/1/edit
  def edit
  end

  # POST /session_times
  # POST /session_times.json
  def create
    @session_time = SessionTime.new(session_time_params)

    respond_to do |format|
      if @session_time.save
        format.html { redirect_to @session_time, notice: 'Session time was successfully created.' }
        format.json { render :show, status: :created, location: @session_time }
      else
        format.html { render :new }
        format.json { render json: @session_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_times/1
  # PATCH/PUT /session_times/1.json
  def update
    respond_to do |format|
      if @session_time.update(session_time_params)
        format.html { redirect_to @session_time, notice: 'Session time was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_time }
      else
        format.html { render :edit }
        format.json { render json: @session_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_times/1
  # DELETE /session_times/1.json
  def destroy
    @session_time.destroy
    respond_to do |format|
      format.html { redirect_to session_times_url, notice: 'Session time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_time
      @session_time = SessionTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_time_params
      params.require(:session_time).permit(:session_time)
    end
end
