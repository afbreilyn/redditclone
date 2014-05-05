class Sub < ActiveRecord::Base

  validates :title, presence: true
  validates :moderator, presence: true

  has_many :link_subs, inverse_of: :sub
  has_many :links, through: :link_subs, source: :link

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :mod_id,
    primary_key: :id,
    inverse_of: :subs
  )
  #
  # has_many(
  #   :links,
  #   class_name: "Link",
  #   foreign_key: :sub_id,
  #   primary_key: :id,
  #   inverse_of:  :sub
  # )

end