# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string
#  role                   :integer          default(1)
#  vk_link                :string
#  fb_link                :string
#  provider               :string
#  uid                    :string
#  phone                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default user modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  has_many :services, :dependent => :destroy

  def self.from_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_vkontakte(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "#{auth.uid}@random_mail.com"
      user.name = auth.info.name
      user.vk_link = auth.info.urls.Vkontakte
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
