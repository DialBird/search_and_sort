# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  corporation_id :integer
#  name           :string
#  age            :integer
#  sex_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
  belongs_to :corporation, optional: true
  has_many :dogs, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true
  validates :age, presence: true,
                  numericality: { only_integer: true,
                                  greater_than: 0 }
  validates :sex_id, inclusion: 1..3
end
