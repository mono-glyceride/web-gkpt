class GkptInformationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :topic, presence: true, length: { maximum: 255 }

  def save
    # TODO:格モデルへ保存処理
  end
end