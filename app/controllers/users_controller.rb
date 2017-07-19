class UsersController < ApplicationController
  def index
    @users = User.preload(:corporation)
  end
end
