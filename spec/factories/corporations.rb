# == Schema Information
#
# Table name: corporations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :corporation do
    name "MyString"
  end
end
