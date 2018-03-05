require 'net/http'
require 'uri'

ips = []
logins = []
50.times {ips << '192.168.1.' + rand(255).to_s}
100.times {logins << (0..5).map {(65 + rand(26)).chr}.join.downcase}

20.times do
  uri = URI.parse('http://localhost:3000/posts')
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data({
                            "user[login]" => logins[rand(100)] + '@example.com',
                            "post[title]" => (0..10).map {(65 + rand(26)).chr}.join,
                            "post[text]" => (0..20).map {(65 + rand(26)).chr}.join.downcase,
                            "post[user_ip]" => ips[rand(50)]
                        })

  http.request(request)
end