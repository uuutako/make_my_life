class BookmarksController < ApplicationController
   before_action :authenticate_user!

  def create
    bookmark = current_user.bookmarks.build(plan_id: params[:plan_id])
    bookmark.save!
    redirect_to plans_path
  end

  def destroy
    bookmark = Bookmark.find_by(plan_id: params[:plan_id], user_id: current_user.id)
    bookmark.destroy!
    redirect_to plans_path
  end

end
