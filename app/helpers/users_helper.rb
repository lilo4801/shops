module UsersHelper
  def format_name(user)
    if user.name == "duong"
      "Mr.#{user.name}"
    else
      "Ms.#{user.name}"
    end
  end
end
