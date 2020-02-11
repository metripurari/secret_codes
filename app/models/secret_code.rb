class SecretCode < ApplicationRecord
  include Secratable

  belongs_to :user, optional: true

  delegate :email, to: :user, prefix: :user, allow_nil: true

  def self.batch_create(count)
    ActiveRecord::Base.transaction do
      COUNT[count].times do
        self.new.save
      end
    end
  end
end
