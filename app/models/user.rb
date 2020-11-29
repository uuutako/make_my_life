class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
    # with_options format: { with: /\A[a-zA-Z0-9]+\z/ } do  #半角英数字のみ
    #   validates :instagram 
    #   validates :facebook
    #   validates :twitter
    # end  
  
    with_options presence: true do
      
    validates :nick_name, uniqueness: { case_sensitive: false }
    validates :birthday
    validates :password, length: { minimum: 6 }
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX
      
     with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :last_name
     end
      
     with_options format: { with: /\A[ァ-ヶー－]+\z/ } do #全角カタカナのみ
      validates :first_name_kana
      validates :last_name_kana
     
    end    
  end

  ### Association
  has_many  :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end


end        
  

  
