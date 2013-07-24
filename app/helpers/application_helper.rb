module ApplicationHelper

  def fading_flash_notice
    return '' if !flash[:notice]
    notice_id = rand.to_s.gsub(/\./, '')
    notice = <<-EOF
      $('#notices').append("<div id='#{notice_id}' class='flash_notice'>#{flash[:notice]}</div>");
      $("##{notice_id}").css({'padding':'10px 10px 10px 20px'}).delay(5000).slideUp();
    EOF
    notice.html_safe
  end

  # def color_picker
  #   picked = ['#1abc9c', '#2ecc71', '#3498db', '#9b59b6', '#f1c40f', '#f39c12', '#e67e22', '#d35400', '#e74c3c', '#c0392b'].sample
  #   color = <<-EOF
  #     $('#color').css({'background-color':"#{picked}"});
  #   EOF
  #   color.html_safe
  # end

  # def color
  #   ['#1abc9c', '#2ecc71', '#3498db', '#9b59b6', '#f1c40f', '#f39c12', '#e67e22', '#d35400', '#e74c3c', '#c0392b'].sample
  # end

end
