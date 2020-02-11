class UserObserver < ActiveRecord::Observer
  def after_initialize(user)
    return if user.admin?
    code = SecretCode.find_by(code: user.code)
    return unless code
    user.secret_code = code unless (code && code.user)
    user.role = "user"
  end
end