module ApplicationHelper

  def baseTitle
    base_title = "SocialBike"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
