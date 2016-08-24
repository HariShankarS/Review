class ReeviewsController < ApplicationController
  before_action :set_reeview, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!
  # GET /reeviews
  # GET /reeviews.json
  def index
    @reeviews = Reeview.all
  end

  # GET /reeviews/1
  # GET /reeviews/1.json
  def show
  end

  # GET /reeviews/new
  def new
    @reeview = Reeview.new
  end

  # GET /reeviews/1/edit
  def edit
  end

  # POST /reeviews
  # POST /reeviews.json
  def create
    @reeview = Reeview.new(reeview_params)
    @reeview.user_id = current_user.id
    @reeview.movie_id = @movie.id

    if @reeview.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @reeview.update(reeview_params)
  end

  def destroy
    @reeview.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reeview
      @reeview = Reeview.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reeview_params
      params.require(:reeview).permit(:rating, :comment)
    end
end
