User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", username: 'bob', email: "john@doe.com", password: "password")

50.times do |i|
  project1 = user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}",
    description: "description #{i}", goal: 13000)
end