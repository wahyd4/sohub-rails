class UserToSohubModule < ActiveRecord::Base

  belongs_to :user
  belongs_to :sohub_module
end
