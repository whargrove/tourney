class PlayersController < ApplicationController
  before_action :authorize
  before_action :set_tournament, only: [:show, :new]
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players/1
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      redirect_to @player, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
    redirect_to players_url, notice: 'Player was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.where('id = ?', params[:tournament_id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :tournament_id)
    end
end
