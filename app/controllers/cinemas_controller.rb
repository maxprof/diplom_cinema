class CinemasController < ApplicationController
  before_action :set_cinema, only: [:show, :edit, :update, :destroy]

  # GET /cinemas
  # GET /cinemas.json
  def index
    @cinemas = Cinema.all
  end

  # GET /cinemas/1
  # GET /cinemas/1.json
  def show
  end

  # GET /cinemas/new
  def new
    @cinema = Cinema.new
  end

  # GET /cinemas/1/edit
  def edit
  end

  # POST /cinemas
  # POST /cinemas.json
  def create
    @cinema = Cinema.new(cinema_params)

    if @cinema.save
      flash[:success] = "New cinema was successufly created"
      redirect_to cinema_path(@cinema)
    else
      render 'new'
    end
  end

  # PATCH/PUT /cinemas/1
  # PATCH/PUT /cinemas/1.json
  def update
    if @cinema.update(cinema_params)
      flash[:success] = "Cinema was successufly updated"
      redirect_to film_session_path(@film_session)
    else
      render 'new'
    end
  end

  # DELETE /cinemas/1
  # DELETE /cinemas/1.json
  def destroy
    @cinema.destroy
    flash[:danger] = "Cinema was successufly deleted"
    redirect_to cinemas_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cinema_params
      params.require(:cinema).permit(:cinema_name, :cinema_addr)
    end
end
