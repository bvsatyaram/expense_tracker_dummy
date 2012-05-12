module ApplicationHelper
  def show_flash
    if flash[:notice]
      flash_class = "notice"
      flash_msg = flash[:notice]
    elsif flash[:error] || flash[:alert]
      flash_class = "error"
      flash_msg = flash[:error] || flash[:alert]
    elsif flash[:warning]
      flash_class = "warning"
      flash_msg = flash[:warning]
    end

    content_tag :div, :id => "flash_container",
      :class => "clearfix" do
      content_tag :div, flash_msg , :class => "flash_msg #{flash_class}",
        :style => flash_class.nil? ? 'display:none' : ''
    end
  end
end
