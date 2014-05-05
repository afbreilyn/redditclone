class User < ActiveRecord::Base

  #before_validation :ensure_token

  attr_reader :password

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  has_many(
    :subs,
    class_name: "Sub",
    foreign_key: :mod_id,
    primary_key: :id,
    inverse_of: :moderator
  )

  has_many(
    :links,
    class_name: "Link",
    foreign_key: :poster_id,
    primary_key: :id,
    inverse_of:  :poster
  )



  def self.find_by_credentials(username, secret)
    user = User.find_by_username(username)
    return nil unless user
    return user if user.is_password?(secret)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def reset_token!
    self.token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.token
  end

end
