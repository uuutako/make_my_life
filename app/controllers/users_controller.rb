class UsersController < ApplicationController
  
  def new
    @phrases = Phrase.includes(:user)
  end

  def show
    @user = User.find(params[:id])
    @phrases = Phrase.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to root_path
    else 
        render :edit   
    end
  end  

  private

  def user_params
    params.require(:user).permit(:email,:nickname, :image, :twitter, :facebook, :instagram,:phrase_id)
  end

 

end
