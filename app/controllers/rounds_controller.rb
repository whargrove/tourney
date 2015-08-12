class RoundsController < ApplicationController
  before_action :authorize
  before_action :set_tournament
  before_action :set_round, only: [:show]

  # GET /rounds
  def index
    @rounds = Round.where('tournament_id = ?', @tournament.id).order(number: :asc)
  end

  # GET /rounds/1
  def show
  end

  # GET /rounds/new
  def new
    @round = Round.new
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)

    if @round.save
      redirect_to round_path(@round, tournament_id: @tournament.id), notice: 'Round was successfully created.'
    else
      render :new
    end
  end

  private

    def set_round
      @round = Round.find(params[:id])
    end

    def set_tournament
      # This is kinda hacky
      if request.post?
        @tournament = Tournament.find(params[:round][:tournament_id])
      else
        @tournament = Tournament.find(params[:tournament_id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def round_params
      params.require(:round).permit(:number, :tournament_id)
    end
end
