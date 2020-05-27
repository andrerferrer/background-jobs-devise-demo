class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # after_create :enhance_clearbit

  # private

  # def enhance_clearbit
  #   EnhanceClearbitJob.perform_later(self.id)
  # end
end
