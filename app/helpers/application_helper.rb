module ApplicationHelper

  def fading_flash_notice
    return '' if !flash[:notice] && !flash[:error] && !flash[:alert]
    notice_id = rand.to_s.gsub(/\./, '')
    if flash[:notice]
      text = flash[:notice]
      color = '#2ecc71'
    elsif flash[:alert]
      text = flash[:alert]
      color = '#e74c3c'
    else
      text = flash[:error]
      color = '#e74c3c'
    end
    notice = <<-EOF
      $('#notices').append("<div id='#{notice_id}' class='flash_notice'><div id='notice_text'>#{text}</div></div>").css({'background-color':'#{color}'});
      $('##{notice_id}').prepend("<img id='circle' alt='Xcircle' height='20' src='/assets/xcircle.png' width='20' style='padding-right:20px;float:left;'>");
      $("##{notice_id}").css({'padding':'10px 10px 10px 20px'});
      $('img#circle').click(function(event){
        event.preventDefault();
        $("##{notice_id}").slideUp();
      });
    EOF
    notice.html_safe
  end

end
