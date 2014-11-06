module G5Updatable::UrnAsParameter
  extend ActiveSupport::Concern

  def to_param
    urn
  end
end
