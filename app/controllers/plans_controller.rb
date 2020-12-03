class PlansController < ApplicationController

  def index
    @plans = Plan.order("created_at DESC")
    @user = User.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
    @plan = Plan.find(params[:id])  
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params)
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
  end


end

private

def plan_params
  params.require(:plan).permit(:title,:concept,:item, :cost, :process,:time, :timezone_id, :place, :category_id ,:season_id, :image).merge(user_id: current_user.id)
end
