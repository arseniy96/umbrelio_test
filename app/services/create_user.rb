module Services
  class CreateUser

    # attr_accessor :user

    def self.call(params)
      if User.find_by_login(params[:user][:login])
        user = User.find_by_login(params[:user][:login])
      else
        user = User.create(params.require(:user).permit(:login))
      end
    end

  end
end