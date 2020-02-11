class UserPolicy
  attr_reader :user

  def initialize(user, _resource)
    @user = user
  end

  def all?
    raise Pundit::NotAuthorizedError.new(policy: 'user') unless @user
    true
  end

end