class UserController < ApplicationController



  protect_from_forgery :only => :logout
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
	def register
    #an example of testing request register $.post('/api/user/register', { user: {email: 'uui@uarank.com', password: 'niaaa!!!', password_confirmation: 'niaaa!!!'}});
    user = User.create(user_params)

    if user.save
      render :json => { success: 'true' }
    else
      render :json => { success: 'false' }
    end
  end

	def login
    #an example of testing request login $.post('/api/user/login', { user: {email: 'uui@uarank.com', password: 'niaaa!!!' }});
    resource = User.find_for_database_authentication(:email => params[:user][:email])

    if resource.nil?
      render :json=> {:success => 0, :error => "No Such User"}, :status=>401
    else
      if resource.valid_password?(params[:user][:password])
        sign_in(:user, resource)
        render :json => { success: 'true' }
      else
        render :json=> {:success => 0, :error => "Wrong Password"}, :status=>401
      end
    end


  end

	def logout
    #an example of testing request logout $.post('/api/user/logout');
    sign_out :user
    render :json => (current_user)


  end

  private
  def user_params
    allow = [:email, :password, :password_confirmation]
    params.require(:user).permit(allow)
  end

end
