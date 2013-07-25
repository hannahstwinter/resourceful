class EmailController < ApplicationController

  def index
  end

  def post
    email = { :message => params[:message],
              :name => params[:name],
              :email => params[:email],
    }

    Mailer.dev_message(email).deliver

    flash[:notice] = "Thanks for giving us feedback!"
    redirect_to root_path
  end

end