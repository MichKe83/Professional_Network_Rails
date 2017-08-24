class NetworksController < ApplicationController

	def show
		@user = current_user
		
		@friends = @user.friends

		@invitees = @user.invitees

		@invitee = Invite.where.not(invitee_id: current_user)
			
			
	end
end
