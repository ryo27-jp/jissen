class Admin::Authenticator
  def initialize(authenticator)
    @authenticator = authenticator
#<Administrator id: 1, email: "hanako@example.com", hashed_password: [FILTERED], suspended: false, created_at: "2020-09-15 11:00:27", updated_at: "2020-09-15 11:00:27">
  end

  def authenticate(raw_password)
    @authenticator &&
      # !@authenticator.suspended? &&
        @authenticator.hashed_password &&
              BCrypt::Password.new(@authenticator.hashed_password) == raw_password
  end
end