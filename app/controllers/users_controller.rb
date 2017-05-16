class UsersController < ApplicationController

  def search
    @users = User.where('name LIKE(?)', "%#{search_params[:keyword]}%").order('name ASC').limit(5)
    render json: @users
  end

  private
  def search_params
    params.permit(:keyword)
  end

end
