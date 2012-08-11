class SignupController < ApplicationController
  # /signup/ -- this would be for new users
  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(params[:user])
    if @user.save
      session[:temp_user] = @user
      @account = Account.new
      render 'new_account'
    else
      render 'new_user'
    end
  end

  def create_account
    @account = Account.new(params[:account])
    if @account.save
      sign_in session[:temp_user]
      flash[:success] = "Welcome to Proioxis"
      redirect_to @account
    else
      render 'new_account'
    end
  end

end