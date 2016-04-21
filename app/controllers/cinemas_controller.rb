class CinemasController < ApplicationController
  before_action :set_cinema, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:new, :edit, :update, :destroy]

  def index
    @cinemas = Cinema.all
  end

  def show
  end

  def new
    @cinema = Cinema.new
  end

  def edit
  end

  def create
    @cinema = Cinema.new(cinema_params)
    @cinema.user_id = current_user.id
    if @cinema.save
      flash[:success] = "New cinema was successufly created"
      redirect_to cinema_path(@cinema)
    else
      render 'new'
    end
  end

  def update
    if @cinema.update(cinema_params)
      flash[:success] = "Cinema was successufly updated"
      redirect_to film_session_path(@film_session)
    else
      render 'new'
    end
  end

  def destroy
    @cinema.destroy
    flash[:danger] = "Cinema was successufly deleted"
    redirect_to cinemas_path
  end

  private

    def check_if_admin
      if !user_signed_in? || !current_user.admin?
        flash[:danger] = "You have't access rights for this operation"
        redirect_to root_path
      end
    end

    def set_cinema
      @cinema = Cinema.find(params[:id])
    end


    def cinema_params
      params.require(:cinema).permit(:cinema_name, :cinema_addr, :user_id)
    end
end
