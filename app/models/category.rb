class Category < ActiveHash::Base
  self.data = [  
    {id: 1, name: '食べる' },{id: 2, name: '観る' },
    {id: 3, name: '遊ぶ' }, {id: 4, name: '作る' },{id: 5, name: '癒される' },
    {id: 6, name: '学ぶ' }, {id: 7, name: '動く' },{id: 8, name: '体験する' },
    {id: 9, name: 'ビューティー' }, {id: 10, name: 'その他' }
 ]
    
  include ActiveHash::Associations
  has_many :plans

end

