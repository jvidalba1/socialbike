module ApplicationHelper

  def baseTitle
    base_title = "SocialBike"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def select_estado
    [
        ["Confirmado",1],
        ["Cancelado",2],
        ["Realizado",3]
    ]
  end
end
