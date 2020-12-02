class Timezone < ActiveHash::Base
  self.data = [  
    {id: 1, name: '朝' },
    {id: 2, name: '昼' },{id: 3, name: '夕' },
    {id: 4, name: '夜' },{id: 5, name: '早朝' },
    {id: 6, name: '深夜' }, {id: 7, name: '1日中' }
  ]
    
  include ActiveHash::Associations
  has_many :plans

end