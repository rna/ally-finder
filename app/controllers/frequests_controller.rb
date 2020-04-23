class FrequestsController < ApplicationController
  before_action :authenticate_user!

  def send_request
    @friend_id = params[:friend_id]
    friend_request = current_user.frequests.new(friend_id: @friend_id)
    if friend_request.save
      flash[:notice] = 'Friend request sent successfully'
    else
      flash[:error] = 'Error in sending Friend request'
    end
    redirect_to '/users'
  end

  def accept_request
    @user = params[:friend]
    friend_request = current_user.inverse_frequests.find_by_user_id(@user)
    friend_request.status = true
    friend_request_2 = current_user.frequests.new(friend_id: @user, status: true)
    if friend_request.save && friend_request_2.save
      flash[:notice] = 'Friend request accepted'
    else
      flash[:error] = 'Error in accepting Friend request'
    end
    redirect_to '/users'
  end

  def reject_request
    @user = params[:friend]
    friend_request = current_user.inverse_frequests.find_by_user_id(@user)
    if friend_request.delete
      flash[:notice] = 'Friend request rejected'
    else
      flash[:error] = 'Error in rejecting Friend request'
    end
    redirect_to '/users'
  end
end
