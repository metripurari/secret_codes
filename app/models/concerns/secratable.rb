module Secratable
  extend ActiveSupport::Concern

  COUNT = {
    "1" => 1,
    "10" => 10,
    "20" => 20,
    "50" => 50,
    "100" => 100
  }

  included do
    before_create :generate_secret_token

    attr_accessor :create_count
  end

  protected

  def generate_secret_token
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(code: random_token)
    end
  end
end