class ApplicationController < ActionController::Base
  layout :set_layout
  
  private
  def set_layout
    if params[:controller].match(%r{\A(homes|books)})
      Regexp.last_match[1]
    else
      "books"
    end
  end
end