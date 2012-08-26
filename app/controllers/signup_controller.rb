class SignupController < ApplicationController
  layout 'static_pages'

  # /signup/ -- this would be for new users
  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(params[:user])
    if @user.valid?
      session[:user_params] = params[:user]
      @account = Account.new
      render 'new_account'
    else
      render 'new_user'
    end
  end

  def create_account
    @account = Account.new(params[:account])
    if @account.valid? && User.new(session[:user_params]).valid?
      Account.transaction do
        @account.save!
        @account.users.create!(session[:user_params])
      end
      sign_in @account.users.first
      session.delete(:user_params)
      flash[:success] = "Welcome to Proioxis"
      redirect_to @account
    else
      render 'new_account'
    end
  end

end