module ApplicationHelper

  def wide_content
    if controller == Users::SettingsController
      "wide_content"
    end
  end

  def current_user_json
    raw current_user.to_json(only: ['id', 'profile_image'])
  end

  def title(title, icon = nil, subtitle = nil)
    if !title.is_a?(String) && title.respond_to?(:id)
      title = "#{title.class.model_name.human} ##{title.id}"
    end

    capture_haml do
      haml_tag "div.breadcrumb" do
        haml_tag "i.#{icon}" if icon
        haml_concat(render_breadcrumbs(separator: " / "))
        haml_concat " / "
        haml_concat(title)
        haml_tag :h5, subtitle unless subtitle.blank?
      end
    end
  end
end
