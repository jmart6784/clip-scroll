class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :add_default_channels

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 16}, format: { with: VALID_USERNAME_REGEX }
  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :bio, length: { maximum: 500 }

  has_one_attached :avatar, dependent: :destroy
  validate :avatar_type
  after_create :set_default_avatar
  has_many :added_channels

  def set_default_avatar
    unless self.avatar.attached?
      self.avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.png'
          )
        ), 
        filename: 'default_avatar.png', 
        content_type: 'image/png'
      )
    end
  end

  private

  def avatar_type
    if avatar.attached?
      if !avatar.content_type.in?(%('image/jpeg image/jpg image/png'))
        errors.add(:avatar, "needs to be JPG or PNG")
      end
    end
  end

  def add_default_channels
    channels = [
      { id: "UCdC0An4ZPNr_YiFiYoVbwaw", name: "Daily Dose Of Internet" },
      { id: "UCPDis9pjXuqyI7RYLJ-TTSA", name: "FailArmy" },
      { id: "UC38EdoY4Ky_IsVJ3dEzVxAQ", name: "FailArmy Shorts" },
      { id: "UCIJ0lLcABPdYGp7pRMGccAQ", name: "People Are Awesome" },
      { id: "UCPIvT-zcQl2H0vabdXJGcpg", name: "The Pet Collective" },
      { id: "UCsVXjNRWJMyXViNLM2pyMfg", name: "This Is Happening" },
      { id: "UCq-vSTqa-OPeMzx5fjH9w_w", name: "Poke My Heart" },
      { id: "UCfE5Cz44GlZVyoaYTHJbuZw", name: "Guga Foods" },
      { id: "UCpFuaxD-0PKLolFR3gWhrMw", name: "Sous Vide Everything" },
      { id: "UCvgfXK4nTYKudb0rFR6noLA", name: "UFC - Ultimate Fighting Championship" },
      { id: "UC82GyU7a3UhAMkOzVOxIlEw", name: "DIY Garden Channel" },
      { id: "UCyEd6QBSgat5kkC6svyjudA", name: "Mark Wiens" },
      { id: "UCXuqSBlHAE6Xw-yeJA0Tunw", name: "Linus Tech Tips" },
      { id: "UCpuT8AlP9P9EgW_pZ0_xInQ", name: "Dylan Anderson" },
      { id: "UC4ukq--KwuB31q3VyNs_BdA", name: "Moneytips" },
      { id: "UCIEv3lZ_tNXHzL3ox-_uUGQ", name: "Gordon Ramsay" },
      { id: "UCUZzyuAlhHNP3oiuMjn7RfQ", name: "Kitchen Nightmares" },
      { id: "UCMhe8jmac-tWKU0Vj_OXDvA", name: "enes Luciano" },
      { id: "UC03Yal14yoDsyLHUAambBig", name: "Rapleaks 100" },
      { id: "UCkhDeBavkCxdSycc_8ETWqQ", name: "calm_art" },
      { id: "UCGzmWIflRipbUfWjwRipMGg", name: "HighD Clips" },
      { id: "UCeb_Lnqnnsz81Sdj-2CX6Lg", name: "Contemporary Shorts" },
      { id: "UCX6OQ3DkcsbYNE6H8uQQuVA", name: "MrBeast" },
      { id: "UCigtcFawdenDMcbJHn733EQ", name: "joshlilj" },
      { id: "UCnmGIkw-KdI0W5siakKPKog", name: "Ryan Trahan" },
      { id: "UC9dbJfyzwduvCb0AFafPPkw", name: "Rogan Shorts" },
      { id: "UCyiEI_c33fDclGVgGa9sPPA", name: "WayWay Positivity" },
      { id: "UCWi5YwOMaZZBh2nCqaaDjRQ", name: "Secret facts" }
    ]

    channels.each do |channel|
      if AddedChannel.find_by(user_id: self.id, channel_id: channel[:id]).nil?
        AddedChannel.create!(
          user_id: self.id, 
          channel_id: channel[:id],
          name: channel[:name]
        )
      end
    end 
  end
end
