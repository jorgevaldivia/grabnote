module AlertsHelper
  def alert_block(content_or_options_with_block = nil, options = { }, &block)
    render_alert('div.alert.alert-block.form-errors', content_or_options_with_block, options, &block)
  end

  def render_alert(base_element, content_or_options_with_block = nil, options = { }, &block)
    options = content_or_options_with_block if block_given? && content_or_options_with_block.is_a?(Hash)
    closable = options.delete(:closable) { false }
    type = options.delete(:type)
    base_element << ".alert-#{type.to_s}" if type.present?

    capture_haml do
      haml_tag base_element, options do
        haml_tag 'button.close', '&times;'.html_safe, type: 'button', 'data-dismiss' => 'alert' if closable
        haml_tag "i.#{alert_icon_class(type)}"
        if block_given?
          haml_concat(capture_haml(&block))
        else
          haml_concat(content_or_options_with_block)
        end
      end
    end
  end

  def alert_icon_class(type)
    icons = { success: "ok-sign", warning: "warning-sign", 
      danger: "remove-sign", info: "lightbulb" }
    
    "icon-#{icons[type]}"
  end
end