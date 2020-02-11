class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable

  has_one :secret_code
  validates :secret_code, presence: { message: 'Invalid.' }, unless: :admin?

  delegate :code, to: :secret_code, prefix: :user, allow_nil: true

  attr_accessor :code

  def admin?
    role=="admin"
  end
end
