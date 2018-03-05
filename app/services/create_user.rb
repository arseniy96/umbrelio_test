module Services
  class CreateUser

    def self.call(params)
      user(params) || User.create(params)
    end

    private

    def self.user(params)
      user ||= User.find_by_login(params.dig(:login))
    end

  end
end