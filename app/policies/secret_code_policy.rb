class SecretCodePolicy
  attr_reader :user

  def initialize(user, _resource)
    @user = user
  end

  def all?
    raise Pundit::NotAuthorizedError.new(policy: 'secret_code') unless @user.admin?
    true
  end

end