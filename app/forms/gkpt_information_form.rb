class GkptInformationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :topic, :user
  attribute :topic, :string

  validates :topic, presence: true, length: { maximum: 255 }

  def initialize(user, attributes = {})
    @user = user
    super(attributes)
  end

  def save
    review = @user.reviews.new(topic: topic)
    review.save
  end
end