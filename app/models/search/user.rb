class Search::User < Search::Base
  ATTRIBUTES = %i(
    name lower_limit_age higher_limit_age sex_ids
    has_dog is_employee corporation_name
    sort
  ).freeze

  attr_accessor *ATTRIBUTES

  def initialize(attr = {})
    super(attr) if attr.present?
    self.sort ||= :id
  end

  def matches
    users = default_users
    users = users.name_like(name) if name.present?
    users = users.older_than(lower_limit_age) if lower_limit_age.present?
    users = users.younger_than(higher_limit_age) if higher_limit_age.present?
    users = users.sex_is(sex_ids) if sex_ids.present?
    users = search_by_has_dog(users)
    users = search_by_is_employee(users)
    users = users.corporation_name_like(corporation_name) if corporation_name.present?
    users = users.order(sort)
    users
  end

  private

  def default_users
    ::User.preload(:corporation)
  end

  def search_by_has_dog(users)
    # "1"はtrue
    if has_dog == "1"
      users.has_dog
    else
      users
    end
  end

  def search_by_is_employee(users)
    case is_employee
    when EmployeeStatus::EMPLOYEE.type
      users.employee
    when EmployeeStatus::NOT_EMPLOYEE.type
      users.not_employee
    else
      users
    end
  end
end
