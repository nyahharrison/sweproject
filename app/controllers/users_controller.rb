class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, notice: "You can only view your own profile."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
