# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  id: 4,
  name: "name123",
  email: "name2@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: "admin"
)
user.save!

Book.create!([{
  namebook:"In Search of Lost Time",
  nameauthor: "Marcel Proust",
  description: "Swann's Way, the first part of A la recherche de temps perdu,
  Marcel Proust's seven-part cycle, was published in 1913.
  In it, Proust introduces the themes that run through the entire work.
   The narrator recalls his childhood, aided by the famous madeleine; and describes M. Swann's passion for Odette.
  The work is incomparable. ",
  price: "50",
  image: Rails.root.join("app/assets/images/1.jpg").open,
  user_id: user.id
},
{
  namebook:"Ulysses",
  nameauthor: "James Joyce",
  description: "Ulysses chronicles the passage of Leopold Bloom through Dublin during an ordinary day,
   June 16, 1904. The title parallels and alludes to Odysseus (Latinised into Ulysses)",
  price: "100",
  image: Rails.root.join("app/assets/images/2.jpg").open,
  user_id: user.id
},
{
  namebook:"Don Quixote",
  nameauthor: "Miguel de Cervantes",
  description: "Alonso Quixano, a retired country gentleman in his fifties, lives in an unnamed section of La Mancha with his niece and a housekeeper.
  He has become obsessed with books of chivalry, and believes their every word to be true,",
  price: "70",
  image: Rails.root.join("app/assets/images/3.jpg").open,
  user_id: user.id
},
{
  namebook:"The Great Gatsby",
  nameauthor: "F. Scott Fitzgerald",
  description: "The novel chronicles an era that Fitzgerald himself dubbed the . Following the shock and chaos of World War I, American society enjoyed unprecedented levels of prosperity during the ",
  price: "70",
  image: Rails.root.join("app/assets/images/5.jpg").open,
  user_id: user.id
},
{
  namebook:" One Hundred Years of Solitude",
  nameauthor: "Gabriel Garcia Marquez",
  description: "One of the 20th century's enduring works, One Hundred Years of Solitude is a widely beloved and acclaimed novel known throughout the world, and the ultimate achievement in a Nobel Prize–winning car...",
  price: "20",
  image: Rails.root.join("app/assets/images/6.jpg").open,
  user_id: user.id
},
{
  namebook:"Moby Dick",
  nameauthor: "Herman Melville",
  description: "First published in 1851, Melville's masterpiece is, in Elizabeth Hardwick's words, The saga of Captain Ahab and his monomaniacal pursuit of the white",
  price: "100",
  image: Rails.root.join("app/assets/images/7.jpg").open,
  user_id: user.id
},
{
  namebook:"War and Peace",
  nameauthor: "Leo Tolstoy",
  description: "Epic in scale, War and Peace delineates in graphic detail events leading up to Napoleon's invasion of Russia, and the impact of the Napoleonic era on Tsarist society, as seen through the eyes of fi...",
  price: "100",
  image: Rails.root.join("app/assets/images/8.jpg").open,
  user_id: user.id
}
])
