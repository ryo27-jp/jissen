class Admin::Authenticator
  def initialize(authenticator)
    @authenticator = authenticator
  end

  def authenticate(raw_password)
    @authenticator &&
      # !@authenticator.suspended? &&
        @authenticator.hashed_password &&
              BCrypt::Password.new(@authenticator.hashed_password) == raw_password
  end
end