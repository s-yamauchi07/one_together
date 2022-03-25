class DogType < ActiveHash::Base
  self.data = [
    { id: 1,  name: '--' },
    { id: 2,  name: 'アメリカン・コッカー・スパニエル' },
    { id: 3,  name: 'イタリアン・グレーハウンド' },
    { id: 4,  name: 'キャバリア' },
    { id: 5,  name: 'コリー'},
    { id: 6,  name: 'コーギー' },
    { id: 7,  name: 'ゴールデン・レトリバー'},
    { id: 8,  name: 'シーズー' },
    { id: 9,  name: 'シェパード' },
    { id: 10, name: 'シェットランドシープドッグ'},
    { id: 11, name: '柴犬(豆柴)' },
    { id: 12, name: 'シベリアンハスキー'},
    { id: 13, name: 'ジャック・ラッセル・テリア'},
    { id: 14, name: 'チワワ' },
    { id: 15, name: 'トイプードル' },
    { id: 16, name: 'パグ'},
    { id: 17, name: 'ビーグル'},
    { id: 18, name: 'ビション・フリーぜ'},
    { id: 19, name: 'フレンチ・ブルドッグ' },
    { id: 20, name: 'ブルドッグ'},
    { id: 21, name: 'ポメラニアン' },
    { id: 22, name: 'マルチーズ'},
    { id: 23, name: 'ミニチュア・ダックスフンド' },
    { id: 24, name: 'ミニチュア・シュナウザー' },
    { id: 25, name: 'ユークシャ・テリア' },
    { id: 26, name: 'ヨークシャー・テリア'},
    { id: 27, name: 'ラブラドール・レトリバー'},
    { id: 28, name: 'ミックス犬'},
    { id: 29, name: 'その他'}

  ]
  include ActiveHash::Associations
  has_many :users
end