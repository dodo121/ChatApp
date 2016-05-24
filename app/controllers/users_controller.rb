class UsersController < ApplicationController
  def change_status
    User.find(params[:id]).change_status(params[:new_status_id])
  end
end
