module ApplicationHelper
  def body_class
    "#{controller_name}_controller #{action_name}_action"
  end
end
