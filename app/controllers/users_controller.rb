class UsersController < ApplicationController

	def index		
	end

	def create
		@user = User.new(user_params)

		if @user.save 
			session[:user_id] = @user.id

			return redirect_to "/networks/#{@user.id}"
		end

		flash[:errors] = @user.errors.full_messages 
		

		return redirect_to :back
	end

	def show
		@user = current_user
		@users = User.all_except(current_user) & User.where(@user.invitees == current_user)
		# & Invite.where.not(invitee: current_user)
		@invitee = Invite.where(invitee: current_user)
	end

	def description
		@user = User.find(params[:id])

		return render "userdescription.html"
		
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :description, :password, :password_confirmation)
		end

end






