module Trackable
  extend ActiveSupport::Concern

  def track(trackable)
    Activity.create(
      action: 'create',
      trackable: trackable,
      user: current_user,
      project: @project)
  end
end