class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to cats_url if !logged_in?
    end

    def require_logged_out
        if logged_in?
            redirect_to cats_url
        end
    end

    def check_owner?
        @cat = current_user.cats.find(params[:id])
        if @cat
        else
            flash.now[:errors] = @cat.errors.full_messages
            redirect_to cat_url
        end
    end

    def require_user
        redirect_to new_session_url if current_user.nil?
    end

    def logged_in?
        !!current_user
    end
    
    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        curent_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end


end
