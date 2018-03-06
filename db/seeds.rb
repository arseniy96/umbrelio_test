require 'net/http'
require 'uri'

[User, Post, Rating].each do |m|
  ActiveRecord::Base.connection.execute("TRUNCATE #{m.table_name} CASCADE")
end

ips = []
logins = []
60.times { ips << Faker::Internet.ip_v4_address }
120.times { logins << Faker::Internet.email }

2000.times do
  user = Services::CreateUser.call(login: logins[rand(100)])
  post = Services::CreatePost.call(user, {title: Faker::GameOfThrones.house, text: Faker::GameOfThrones.character, user_ip: ips[rand(50)]})
  rand(3).times {Services::EvaluatePost.call(post_id: post.id, vote: rand(1..5))}
end

# 10_000.times {logins << Faker::Internet.user_name(1..100)}
#
# Parallel.each(logins, in_processes: 4) do |c|
#   Services::CreateUser.call(login: c)
# end
#
####################################
#
# 50.times {ips << '192.168.1.' + rand(255).to_s}
# 100.times {logins << (0..5).map {(65 + rand(26)).chr}.join.downcase}
#
# 200.times do |i|
#   uri = URI.parse('http://localhost:3000/posts')
#   http = Net::HTTP.new(uri.host, uri.port)
#   request = Net::HTTP::Post.new(uri.request_uri)
#   request.set_form_data({
#                             "user[login]" => logins[rand(100)] + '@example.com',
#                             "post[title]" => (0..10).map {(65 + rand(26)).chr}.join,
#                             "post[text]" => (0..20).map {(65 + rand(26)).chr}.join.downcase,
#                             "post[user_ip]" => ips[rand(50)]
#                         })
#
#   http.request(request)
#
#   uri = URI.parse('http://localhost:3000/rate')
#   http = Net::HTTP.new(uri.host, uri.port)
#   request = Net::HTTP::Post.new(uri.request_uri)
#
#   rand(3).times do
#     request.set_form_data({
#                               "post_id" => i,
#                               "vote" => rand(1..5)
#                           })
#     http.request(request)
#   end
# end
