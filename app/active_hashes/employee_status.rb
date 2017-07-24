class EmployeeStatus < ActiveHash::Base
  include ActiveHash::Enum
  self.data = [
    { id: 1, type: 'employee', name: '会社員' },
    { id: 2, type: 'not_employee', name: '会社員でない' }
  ]
  enum_accessor :type
end
