class User  <  ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\[A-Z0-9._%+-\]+@\[A-Z0-9.-\]+\.\[AZ\]{2,4}/i

  validates :email, presence: true, uniqueness: true, length: {maximum: 105}, format: { with: VALID_EMAIL_REGEX}
end
