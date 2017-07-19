# == Schema Information
#
# Table name: corporations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Corporation < ApplicationRecord
  has_many :users

  validates :name, presence: true

  scope :name_like, -> (name) {
    where(arel_table[:name].matches("%#{name}%"))
  }
end
