class Sex < ActiveHash::Base
  include ActiveHash::Enum
  self.data = [
    { id: 1, type: 'man', name: '男' },
    { id: 2, type: 'woman', name: '女' },
    { id: 3, type: 'other', name: 'それ以外' }
  ]
  enum_accessor :type
end
