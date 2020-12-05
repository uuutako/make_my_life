class PhrasesController < ApplicationController

  def index
    @phrase = Phrase.all
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)
    if @phrase.save
      redirect_to(user_url(current_user.id)) 
    else
      render :new 
    end
  end

  def edit
    @phrase =Phrase.find(params[:id])
  end

  def update
    @phrase =Phrase.find(params[:id])
    if @phrase.update(user_params)
        redirect_to 
    else 
        render :edit
    end
  end  

  # def destroy
  #   phrase =Phrase.find(params[:id]
  #   phrase.destroy
  # end


end

private

def phrase_params
  params.require(:phrase).permit(:phrase, :name ).merge(user_id: current_user.id)
end

