class ReeviewsController < ApplicationController
  before_action :set_reeview, only: [:show, :edit, :update, :destroy]
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

    respond_to do |format|
      if @reeview.save
        format.html { redirect_to @reeview, notice: 'Reeview was successfully created.' }
        format.json { render :show, status: :created, location: @reeview }
      else
        format.html { render :new }
        format.json { render json: @reeview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reeviews/1
  # PATCH/PUT /reeviews/1.json
  def update
    respond_to do |format|
      if @reeview.update(reeview_params)
        format.html { redirect_to @reeview, notice: 'Reeview was successfully updated.' }
        format.json { render :show, status: :ok, location: @reeview }
      else
        format.html { render :edit }
        format.json { render json: @reeview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reeviews/1
  # DELETE /reeviews/1.json
  def destroy
    @reeview.destroy
    respond_to do |format|
      format.html { redirect_to reeviews_url, notice: 'Reeview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reeview
      @reeview = Reeview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reeview_params
      params.require(:reeview).permit(:rating, :comment)
    end
end
