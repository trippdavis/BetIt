class BetsController < ApplicationController
  before_action :require_signed_in

  def create
    @bet = Bet.new(bet_params)
    @bet.bet_taker_id = current_user.id
    if @bet.save
      render :json => @bet
    else
      render :json => @bet.errors.full_messages
    end
  end

  def update
    @bet = Bet.find(params[:id])

    if @bet.update(bet_params)
      render :json => @bet
    else
      render :json => @bet.errors.full_messages
    end
  end

  def show
    @bet = Bet.find(params[:id])
    render :json => @bet
  end

  def index
    @bets = Bet.all
    render :json => @bets
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    render :json => @bet
  end

  private
  def bet_params
    params.require(:bet).permit(:title, :description, :max_bets, :completed)
  end
end
