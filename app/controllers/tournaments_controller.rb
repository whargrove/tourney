class TournamentsController < ApplicationController
  before_action :authorize
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  def index
    @tournaments = Tournament.where('user_id = ?', current_user.id)
  end

  # GET /tournaments/1
  def show
    @user = User.find(@tournament.user_id)
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save
      redirect_to @tournament, notice: 'Tournament was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: 'Tournament was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tournaments/1
  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tournament_params
      params.require(:tournament).permit(:name, :user_id)
    end
end
