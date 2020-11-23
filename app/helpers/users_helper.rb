module UsersHelper
############################################
  def profile_created user
user.created_at.to_s(:user_created)
  end
###########################################
end
