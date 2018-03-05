module Services
  class GroupByUserIp

    def self.call
      hh = {}
      ips = Post.pluck(:user_ip).uniq
      ips.each {|ip| hh[ip] = Post.where(user_ip: ip).pluck(:user_id).uniq}
      hh.each_key do |key|
        hh.delete(key) if hh[key].size < 2
      end
    end

  end
end