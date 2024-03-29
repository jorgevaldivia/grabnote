class UserDecorator < Draper::Decorator
  delegate_all

  # Name of the user to be displayed across site. Currently uses "First L."
  # format
  def display_name
  	"#{object.first_name} #{object.last_name.first}."
  end

  # Return user's initials
  def initials
    "#{object.first_name.first}#{object.last_name.first}"
  end

  # Render user profile image or a holder with the initials if user does not
  # have an image uploaded.
  #
  # size: Size of the image to return, accepts :tiny, :small, and :medium
  def profile_image_tag(size=:medium)
    if object.profile_image.present?
      h.content_tag :img, "", class: "profile-image-#{size}", src: object.profile_image.send("#{size}")
    else
      h.content_tag :img, "", class: "profile-image-#{size}", 
        src: "holder.js/#{profile_image_dimensions(size)}/grabnote-#{size}/text:#{initials}"
    end
  end

  # Return the profile image dimensions in XxY format
  def profile_image_dimensions(size=:medium)
    if size == :medium
      "100x100"
    elsif size == :small
      "50x50"
    elsif size == :tiny
      "25x25"
    end
  end

end
