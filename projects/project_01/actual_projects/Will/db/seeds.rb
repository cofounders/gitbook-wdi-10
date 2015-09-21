User.destroy_all
u1 = User.create :email => 'william.tanzy@gmail.com', :name => 'Will Tan', :password => 'chicken', :admin => true
u2 = User.create :email => 'nicomele1@gmail.com', :name => 'Nico Mele', :password => 'chicken'

Letter.destroy_all
l1 = Letter.create :recipient => 'Will Tan', :email => 'twillzy89@gmail.com', :content => 'Dear Future Me, lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi ea, facilis, ab delectus, eaque mollitia sunt adipisci corporis aut harum dolorem labore eos provident voluptas libero repellat iusto recusandae error!', :deliver_date => '2016-01-01'
l2 = Letter.create :recipient => 'Nico Mele', :email => 'nicomele1@gmail.com', :content => 'Dear Future Me, lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem adipisci dolore corporis, accusantium animi officia sunt maxime totam voluptate nemo reprehenderit nisi aliquam, natus dolores maiores repudiandae quam, incidunt qui!', :deliver_date => '2018-12-31'
l3 = Letter.create :recipient => 'Baobao', :email => 'william.tanzy@gmail.com', :content => 'Dear Future Bao, you were a cunt and you still are!', :deliver_date => '2016-08-28'
l4 = Letter.create :recipient => 'Baobei', :email => 'twillzy89@gmail.com', :content => 'Dear Baobei, I love you', :deliver_date => '2015-12-31'

Mood.destroy_all
m1 = Mood.create :name => 'Love'
m2 = Mood.create :name => 'Morbid'
m3 = Mood.create :name => 'Existential'
m4 = Mood.create :name => 'Emo'
m5 = Mood.create :name => 'Other'

l1.moods << m1 << m2
l2.moods << m3 << m4
l3.moods << m1 << m2 << m4
l4.moods << m1 << m2 << m3 << m4

u1.letters << l1 << l3
u2.letters << l2 << l4 