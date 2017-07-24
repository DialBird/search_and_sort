class UsersController < ApplicationController
  def index
    @search = Search::User.new(search_params)
    @users = @search.matches

    respond_to do |format|
      format.html { render :index }
    end
  end

  alias search index

  private

  def search_params
    params.fetch(:search_user, {})
          .permit(*Search::User::ATTRIBUTES, sex_ids: [])
  end
end
