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

  def select_estado_item(estado)
    if estado.eql? 1
      "Confirmado"
    elsif estado.eql? 2
      "Cancelado"
    elsif estado.eql? 3
      "Realizado"
    end
  end
end
