class RoundsController < ApplicationController
  before_action :authorize
  before_action :set_tournament
  before_action :set_round, only: [:show, :edit, :update, :destroy]

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

  # GET /rounds/1/edit
  def edit
  end

  # POST /rounds
  def create
    @round = Round.new(round_params)

    if @round.save
      redirect_to @round, notice: 'Round was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rounds/1
  def update
    if @round.update(round_params)
      redirect_to @round, notice: 'Round was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rounds/1
  def destroy
    @round.destroy
    redirect_to rounds_url, notice: 'Round was successfully destroyed.'
  end

  private

    def set_round
      @round = Round.find(params[:id])
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    # Only allow a trusted parameter "white list" through.
    def round_params
      params.require(:round).permit(:number, :tournament_id)
    end
end
