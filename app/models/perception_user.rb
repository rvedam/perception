class PerceptionUser < ActiveRecord::Base
  # id | username | fullname | email | company | password_digest | created_at | updated_at
  # --------------------------------------------------------------------------------------

  has_secure_password

  validates_uniqueness_of :email, :username

end
