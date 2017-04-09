class SessionsController < ApplicationController
  #skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password])
      flash[:success] = 'Bienvenido'
      redirect_back_or_to admin_index_path
    else
      flash.now[:warning] = "Error!!!"
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'CHAO!'
    redirect_to log_in_path
  end
end
