class Notebook < ActiveRecord::Base
  include HasToken

  belongs_to :user

  validates :name, presence: true
end
