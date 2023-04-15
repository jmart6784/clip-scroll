class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :add_default_channels
  after_create :add_default_subreddits
  after_create :create_default_playlist
  after_create :create_user_configuration
  after_create :set_default_avatar

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, uniqueness: true, presence: true, length: {minimum: 4, maximum: 16}, format: { with: VALID_USERNAME_REGEX }
  validates :first_name, :last_name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :bio, length: { maximum: 500 }
  validate :avatar_type
  
  has_one_attached :avatar, dependent: :destroy
  has_one :user_configuration, dependent: :destroy
  has_many :added_channels, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :playlist_videos, dependent: :destroy
  has_many :added_subreddits, dependent: :destroy

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

  def add_default_subreddits
    subreddits = [
      'AbruptChaos',
      '11foot8',
      '21stCenturyHumour',
      '3Dprinting',
      'absoluteunit',
      'AbsoluteUnits',
      'AccidentalShoeLoss',
      'accidentalwrestling',
      'ActualPublicFreakouts',
      'ActLikeYouBelong',
      'adorableoldpeople',
      'AdultsAreFuckinStupid',
      'AllCombatSports',
      'amazingmemes',
      'AnimalsBeingBros',
      'AnimalsBeingDerps',
      'AnimalsBeingGeniuses',
      'AnimalsBeingJerks',
      'AnimalsBeingStrange',
      'animalsdoingstuff',
      'Animalsthatlovemagic',
      'ape',
      'awesome',
      'aww',
      'Awwducational',
      'awwwtf',
      'babybigcatgifs',
      'badassanimals',
      'BeAmazed',
      'BeansInThings',
      'bearsdoinghumanthings',
      'bigboye',
      'bizarrelife',
      'blackmagicfuckery',
      'CatastrophicFailure',
      'CatsAreAssholes',
      'chemicalreactiongifs',
      'ChildrenFallingOver',
      'Chonkers',
      'combinedgifs',
      'constantchaos',
      'ContagiousLaughter',
      'ConvenientCop',
      'CrazyHuman',
      'CringePurgatory',
      'DadReflexes',
      'Damnthatsinteresting',
      'dankvideos',
      'DidntKnowIWantedThat',
      'DiWHY',
      'dogswithjobs',
      'dontbestupid',
      'donthelpjustfilm',
      'DPDT',
      'EntitledBitch',
      'facepalm',
      'failarmy',
      'FastWorkers',
      'FinalDestinationShit',
      'fixedbytheduet',
      'FUCKYOUINPARTICULAR',
      'FullScorpion',
      'FullShrimp',
      'funny',
      'funnyvideos',
      'gif',
      'gifsthatendtoosoon',
      'gifsthatkeepongiving',
      'GlitchInTheMatrix',
      'GradualChaos',
      'HadToHurt',
      'happycowgifs',
      'HeavyFuckingWind',
      'hilariouscringe',
      'hitmanimals',
      'hmm',
      'holdmybeer',
      'holdmycatnip',
      'holdmycosmo',
      'holdmyfries',
      'holdmyjuicebox',
      'HoldMyKibble',
      'holdmyredbull',
      'HolUp',
      'howtonotgiveafuck',
      'HumansAreMetal',
      'HumansBeingBros',
      'iamatotalpieceofshit',
      'IdiotsFightingThings',
      'IdiotsInCars',
      'IdiotsNearlyDying',
      'IdiotsOnBikes',
      'ImFinnaGoToHell',
      'ImTheMainCharacter',
      'infuriatingasfuck',
      'InsaneVideo',
      'instantbarbarians',
      'instantkarma',
      'interesting',
      'interestingasfuck',
      'IrrationalMadness',
      'ITscaredME',
      'jakertown',
      'justforsocialmedia',
      'JustGuysBeingDudes',
      'KidsAreFuckingEvil',
      'KidsAreFuckingSmart',
      'KidsAreFuckingStupid',
      'killthecameraman',
      'likeus',
      'LooneyTunesLogic',
      'MadeMeSmile',
      'masterhacker',
      'maybemaybemaybe',
      'meatcrayon',
      'megalophobia',
      'memeswithoutmods',
      'MemeVideos',
      'mildlycreepy',
      'mildlyinfuriating',
      'mmamemes',
      'MoldyMemes',
      'MyPeopleNeedMe',
      'NatureIsFuckingLit',
      'nevertellmetheodds',
      'nextfuckinglevel',
      'nononono',
      'nonononoyes',
      'nope',
      'NormalDayInArabia',
      'Notakeonlythrow',
      'oddlysatisfying',
      'oddlyterrifying',
      'okbuddyretard',
      'OneSecondBeforeDisast',
      'PeopleBeingJerks',
      'PeopleFalling',
      'PeopleFuckingDying',
      'peopleofwalmart',
      'Perfectfit',
      'physicsgifs',
      'powerwashingporn',
      'PraiseTheCameraMan',
      'Prematurecelebration',
      'PublicFreakout',
      'rarepuppers',
      'ReallyInteresting',
      'reverseanimalrescue',
      'RuinedMyDay',
      'satisfying',
      'Satisfyingasfuck',
      'scriptedasiangifs',
      'ShamelesslyStolen',
      'shitposting',
      'shittyrobots',
      'shittysimulated',
      'shockwaveporn',
      'Simulated',
      'specializedtools',
      'StartledCats',
      'Stepdadreflexes',
      'StupidFood',
      'SubwayCreatures',
      'SweatyPalms',
      'ThatLookedExpensive',
      'TheBullWins',
      'TheForgottenDepths',
      'therewasanattempt',
      'thisismylifenow',
      'TikTokCringe',
      'TiktokCringeTime',
      'tooktoomuch',
      'toptalent',
      'trashpandas',
      'trashy',
      'UNBGBBIIVCHIDCTIICBG',
      'Unexpected',
      'VRtoER',
      'WastedGifs',
      'WatchPeopleDieInside',
      'watchpeoplesurvive',
      'Wellthatsucks',
      'whatcouldgoright',
      'Whatcouldgowrong',
      'WhatsWrongWithYourDog',
      'whymenlivelonger',
      'WhyWereTheyFilming',
      'WinStupidPrizes',
      'woahdude',
      'worldnewsvideo',
      'WTF',
      'yesyesyesyesno',
      'yesyesyesno',
      'youseeingthisshit'
    ]

    subreddits.each do |subreddit|
      if AddedSubreddit.find_by(subreddit: subreddit, user_id: self.id).nil?
        AddedSubreddit.create!(subreddit: subreddit, user_id: self.id)
      end
    end
  end

  def create_default_playlist
    if Playlist.where(user_id: self.id).count == 0
      Playlist.create!(user_id: self.id, name: "#{self.first_name}'s playlist", source: "mix", private: true)
    end
  end

  def create_user_configuration
    if UserConfiguration.find_by(user_id: self.id).nil?
      UserConfiguration.create!(
        user_id: self.id, 
        youtube_search_limit: 1,
        screen_fit: 'full',
        last_requested: nil,
        youtube_channel_refresh_limit: 5,
        youtube_refresh_date: nil
      )
    end
  end
end
