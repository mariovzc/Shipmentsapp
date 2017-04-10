class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :user_by_document]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])    
       flash[:success] = 'Bienvenido!'
      redirect_to root_path
    else
      render 'new'
    end
  end
  def user_by_document
    @user = User.where(document: params[:id])[0]
    render json: @user
  end
  def destroy    
    @user = User.find(params[:id])
    @user.destroy
    render json: "ok".to_json, status: 202
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :document, :role)
  end
end
