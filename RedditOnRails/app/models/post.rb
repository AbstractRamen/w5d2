# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  # validates :subs, length: { minimum: 1 }

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub

  has_many :subs,
    through: :post_subs,
    source: :sub
end
