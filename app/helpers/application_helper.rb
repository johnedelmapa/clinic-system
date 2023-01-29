module ApplicationHelper

  def classes_for_flash(flash_type)
    case flash_type.to_sym
    when :notice
      "bg-green-100 text-green-700"
    when :alert
      "bg-red-100 text-red-700"
    else
      "bg-blue-100 text-blue-700"
    end
  end

  def profile_image(user, classess)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.email, class: "#{classess}")
  end

  def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
      alert:   "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
