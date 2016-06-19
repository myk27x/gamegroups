class PlayersController < ApplicationController
  before_action :authenticate_player!
  before_action :set_player

  def show
    if @player.date_of_birth != nil
      @dob = @player.parse(@player.date_of_birth)
    end
  end

  def edit
  end

  def update
    @player.update(player_params)

    redirect_to player_path(@player)
  end

  def destroy
    @player.destroy

    user_session = nil
    redirect_to root_path
  end

private
  def set_player
    @player = Player.find(current_player.id)
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :date_of_birth)
  end

end
