module ApplicationHelper
  def avatar_navbar(element)
    if element.photo.attached?
      cl_image_tag(element.photo.key,width: 150, height: 150, crop: :thumb, gravity: :face, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
    else
      avatar_url = current_user.facebook_picture_url
      image_tag avatar_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown"
    end
  end
end
