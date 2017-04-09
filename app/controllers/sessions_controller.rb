class SessionsController < ApplicationController
  #skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to admin_index_path
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
