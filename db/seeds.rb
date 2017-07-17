#Create Users
10.times do
    pw = Faker::Internet.password(8)
    User.create!(
        name: Faker::GameOfThrones.character,
        email: Faker::Internet.safe_email,
        password: pw,
        password_confirmation: pw,
        confirmed_at: Time.now
    )
end
users = User.all

#Create Wikis
25.times do
    Wiki.create!(
        user: users.sample,
        title: Faker::Lovecraft.deity,
        private: false,
        body: %Q{
# #{Faker::Lovecraft.sentence}

---

[#{Faker::Lorem.word}](#{Faker::Internet.url})

#{Faker::Markdown.random}

#{Faker::Lovecraft.paragraph}

![#{Faker::Lorem.word}](#{Faker::LoremPixel.image})

#{Faker::Lovecraft.paragraph}
}
    )
end

#Create an admin user
admin = User.create!(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'admin'
)

#Create a premium user
premium = User.create!(
    name: 'Premium User',
    email: 'premium@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'premium'
)

#Create a standard user
standard = User.create!(
    name: 'Standard User',
    email: 'standard@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    confirmed_at: Time.now,
    role: 'standard'
)

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"