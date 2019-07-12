# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# To run your seeds, do:
# rails db:seed




NUM_QUESTIONS = 100


Post.destroy_all
Comment.destroy_all


NUM_QUESTIONS.times do
  created_at = Faker::Date.backward(365 * 5)
  q=Post.create(
    # Faker is a ruby module. We access classes
    # or other modules inside of it with ::.
    # Here, Hacker is a class inside of the
    # Faker module
    title: Faker::TvShows::GameOfThrones.character,
    body: Faker::TvShows::GameOfThrones.quote,
    created_at: created_at,
    updated_at: created_at
    )
    if q.valid?
      q.comments = rand(0..15).times.map do
        Comment.new({
          description: Faker::Games::WorldOfWarcraft.quote
        })
      end
    end
end

post = Post.all
comment=Comment.all

puts Cowsay.say("Generated #{Post.count} posts", :frogs)
puts Cowsay.say("Generated #{Comment.count} comments", :tux)
