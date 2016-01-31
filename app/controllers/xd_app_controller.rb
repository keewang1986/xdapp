class XdAppController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
  
  def login
      @user = User.new
      if login_param !=""
         user = User.find_by(login_param)
         if user
             @notice="登陆成功"
             session[:us_id] = user.id
             redirect_to users_url
         else
             @notice="登陆失败"
         end
      end
  end

  def login_param
      if params[:user] !=nil
       return params.require(:user).permit(:name,:password)
      end
      return ""
  end
end
