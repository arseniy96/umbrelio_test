module Services
  class CreateUser

    def self.call(params)
      User.find_by(login: params[:login]) || User.create(params)
    end

  end
end