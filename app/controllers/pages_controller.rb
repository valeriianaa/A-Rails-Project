class PagesController < ApplicationController
    def show
      if current_user == nil
        redirect_to new_user_session_path
      else
        render template: "pages/#{params[:page]}"
      end
    end
end
