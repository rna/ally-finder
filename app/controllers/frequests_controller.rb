class FrequestsController < ApplicationController
  before_action :authenticate_user!
  layout false

  def send_request
    @friend_id = params[:friend_id]
    friend_request = current_user.frequests.new(friend_id:@friend_id)
    if friend_request.save
      flash[:notice] = "Friend request sent successfully"
    else
      flash[:error] = "Error in sending Friend request"
    end
  end

  def accept_request(user)
    friend_request = inverse_frequests.find {|f| f.user == user}
    friend_request.status = true
    friend_request.save
  end

  def reject_request(user)
    friend_request = inverse_frequests.find {|f| f.user == user}
    friend_request.delete
  end
end
