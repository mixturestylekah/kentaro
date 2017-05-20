# == Schema Information
#
# Table name: blogs
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  body         :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  image        :string(255)
#  description  :string(255)
#  published_on :date
#  status       :string(255)      default("0"), not null
#

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
