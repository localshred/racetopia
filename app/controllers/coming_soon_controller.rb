class ComingSoonController < ApplicationController

  def index
  end # def index

  def subscribe
    if request.post?
      unless params[:email].empty? || !/[-a-z0-9._]+@[-a-z0-9._]+\.[a-z]{2,10}/i.match(params[:email])
        unless User.find_by_email(params[:email])
          User.create!(:email => params[:email], :subscribed => true)
          flash[:message] = "Thank You! You are now signed up to free receive periodic email updates from us."
        else
          flash[:error] = "That email address has already been added to the updates list!"
        end
      else
        flash[:error] = "Please submit a valid email address."
      end
    end

    respond_to do |format|
      format.html { redirect_to :action => :index }
    end
  end # def subscribe
  
  def unsubscribe
    if request.post?
      user = User.find_by_email(params[:email])
      if user
        user.subscribed = false
        user.save!
        flash[:success] = "You have been successfully unsubscribed from our free periodic email updates. We're sorry to see you go. We hope that you will continue to use and enjoy the services we have to offer."
      else
        flash[:error] = "We could not find your email address in our system."
      end
    end    
  end # def unsubscribe

end
