class SohubModule < ActiveRecord::Base
  has_many :user_to_sohub_modules
  has_many :users, through: :user_to_sohub_modules
end
