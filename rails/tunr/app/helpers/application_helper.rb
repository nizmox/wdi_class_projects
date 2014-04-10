module ApplicationHelper
  def intellinav
    links = ''
    if @current_user
      links += "<li>#{ link_to('Log out',login_path, :method => :delete) }</li>"
    else
      links += "<li>#{ link_to('Sign up',new_user_path) }</li>"
      links += "<li>#{ link_to('Sign in',login_path) }</li>"
    end
  end
end
