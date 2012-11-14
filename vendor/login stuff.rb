sessions controller

skip_before_filter :login required, :only => :new, :create

def create
user = params[:email]
if user
  session[:user_id] = user.id
  redirect_to /messageboards/index
  else
  flash[:notice] = "Failed login"
  render :new
  end
end


def new

end


def destroy
reset_session
end


----------------------------
app controller
before_filter :login_required

def login_required
unless logged_in?
  redirect_to login_path, message => "login required"
end

def current_user
@current_user ||= User.findbyid(session[:user_id])
end
helper_method :current_user

def logged_in?
  true if current_user
end
helper_method :logged_in?
