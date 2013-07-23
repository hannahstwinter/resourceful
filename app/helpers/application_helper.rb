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

end
