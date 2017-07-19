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

  scope :name_like, -> (name) {
    where(arel_table[:name].matches("%#{name}%"))
  }
  scope :younger_than, -> (age) {
    where(arel_table[:age].lteq(age))
  }
  scope :older_than, -> (age) {
    where(arel_table[:age].gteq(age))
  }
  scope :employee, -> {
    where.not(corporation_id: nil)
  }
  scope :not_employee, -> {
    where(corporation_id: nil)
  }
  scope :corporation_name_like, -> (name) {
    joins(:corporation).merge(Corporation.name_like(name))
  }
  scope :has_dog, -> {
    where(id: Dog.pluck(:user_id).uniq)
  }
  scope :has_no_dog, -> {
    where.not(id: Dog.pluck(:user_id).uniq)
  }
end
