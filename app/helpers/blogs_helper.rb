module BlogsHelper
  def gravatar_helper user
    image_tag "https://ru.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 50
  end
end
