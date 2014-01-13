module ProjectsHelper

  def get_user_display_name(activity)
    activity.user == current_user ? "You" : "#{activity.user.first_name}"
  end

  def to_activity_action(activity)
    action = ''
    if activity.is_commented?
      action = 'commented'
    elsif activity.is_created?
      action = 'created'
    elsif activity.is_uploaded?
      action = 'uploaded'
    end
    safe_concat "<span class='action'>#{action} </span>"
  end

  def link_to_item(activity)
    # TODO(kevin): put in actual link
    type = ''
    if activity.is_project?
      type = 'project'
    end
    safe_concat "<span class='type'>#{type} </span>"
  end
end
