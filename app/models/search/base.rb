class Search::Base
  include ActiveModel::Model

  def params_with_order(field)
    { ActiveModel::Naming.param_key(self) => instance_values.merge("sort" => field) }
  end
end
