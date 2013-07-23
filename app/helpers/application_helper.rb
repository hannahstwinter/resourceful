module ApplicationHelper

  def fading_flash_notice
    # note: you must have a div with id='notices' or rename the div appended to below with your element which
    # is the container for the flash messages
    return '' if !flash[:notice]
    notice_id = rand.to_s.gsub(/\./, '')
    notice = <<-EOF
      $('#notices').append("<div id='#{notice_id}' class='flash_notice'>#{flash[:notice]}</div>");
      $("##{notice_id}").delay(5000).slideUp();
    EOF
    notice.html_safe
  end

end
