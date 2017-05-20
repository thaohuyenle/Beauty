class Post < ApplicationRecord
  belongs_to :user
  scope :order_by_created, (->{order created_at: :desc})
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 140}
  validates :post_img, attachment_presence: true
  has_attached_file :post_img, styles: {post_index: "250x350>",
    post_show: "325x475>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/
end
