class UsersController < ApplicationController

  before_action :require_loged_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Utilizador criado com cucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Dados atualizados'
      redirect_to contacts_url
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

end
