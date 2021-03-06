class Post < ApplicationRecord
  include WithUserAssociationExtension
  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension },
  dependent: :destroy
  has_attached_file :image,
    styles: { large: "750x750>", thumb: "508x508>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true
end
