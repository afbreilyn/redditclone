class Link < ActiveRecord::Base

  validates :title, :url, :poster, presence: true #:sub,
  has_many :link_subs, inverse_of: :link
  has_many :subs, through: :link_subs, source: :sub

  # belongs_to(
  #   :sub,
  #   class_name: "Sub",
  #   foreign_key: :sub_id,
  #   primary_key: :id,
  #   inverse_of:  :links
  # )

  belongs_to(
    :poster,
    class_name: "User",
    foreign_key: :poster_id,
    primary_key: :id,
    inverse_of:  :links
  )

end