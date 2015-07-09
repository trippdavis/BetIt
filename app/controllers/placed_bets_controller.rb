class PlacedBetsController < ApplicationController
  def create
    @placed_bet = PlacedBet.new(placed_bet_params)
    @placed_bet.user_id = current_user.id

    if @placed_bet.save
      render :json => @placed_bet
    else
      render :json => @placed_bet.errors.full_messages
    end
  end

  def destroy
    @placed_bet = PlacedBet.find(params[:id])
    @placed_bet.destroy
    render :json => @placed_bet
  end

  private
  def placed_bet_params
    params.require(:placed_bet).permit(:bet_id)
  end
end
