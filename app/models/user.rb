class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :dog_image
  has_many :favorites, dependent: :destroy
  has_many :gone_places, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :spots

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', on: :create

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :dog_type

  # アプデート時にpasswordが不要になる記述
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end
end
