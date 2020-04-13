class FrequestsController < ApplicationController
  before_action :authenticate_user!

  def send_request
    @friend_id = params[:friend_id]
    friend_request = current_user.frequests.new(friend_id:@friend_id)
    if friend_request.save
      flash[:notice] = "Friend request sent successfully"
      redirect_to "/users"
    else
      flash[:error] = "Error in sending Friend request"
      redirect_to "/users"
    end
  end

  def accept_request
    @user = params[:friend]
    friend_request = current_user.inverse_frequests.find_by_user_id(@user)
    friend_request.status = true
    if friend_request.save
      flash[:notice] = "Friend request sent successfully"
      redirect_to "/users"
    else
      flash[:error] = "Error in sending Friend request"
      redirect_to "/users"
    end    

  end

  def reject_request
    @user = params[:friend]
    friend_request = current_user.inverse_frequests.find_by_user_id(@user)
    if friend_request.delete
      flash[:notice] = "Friend request rejected "
      redirect_to "/users"
    else
      flash[:error] = "Error in rejecting Friend request"
      redirect_to "/users"
    end
  end
end
