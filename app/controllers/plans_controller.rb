class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plan = Plan.order("created_at DESC")
    @user = User.includes(:user)

    @q = Plan.ransack(params[:q])
    @plans = @q.result(distinct: true)

    @categories = Category.all
    @seasons = Season.all
    @timezones = Timezone.all
    @places = Plan.all
  end

  def search
    @q = Plan.search(search_params)
    @plans = @q.result(distinct: true)
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
  end

  def edit
  end

  def update
    plan.update(plan_params)
  end
 
  def destroy
    plan.destroy
  end



end

private

def set_plan
  @plan = Plan.find(params[:id])
end

def plan_params
  params.require(:plan).permit(
    :title,:concept,:item, :cost, :process,:time, :timezone_id, :place, :category_id ,:season_id, :image ).merge(user_id: current_user.id)
end

def search_params
  params.require(:q).permit(:title_or_concept_or_item_cont, :category_id_eq, :season_id_eq, :place_eq)
end