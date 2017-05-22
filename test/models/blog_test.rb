# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  body               :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_id           :string(255)
#  description        :string(255)
#  published_at       :datetime
#  slug               :string(255)
#  image_content_type :string(255)
#

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
