class InvitesController < ApplicationController

	def create
		user = current_user
		invitee = User.find(params[:id])
		newinvite = Invite.new(user: invitee, invitee: user) 
		

		if newinvite.save 
			return redirect_to :back
		end
	end

	def destroy
		user = current_user
		invitee = User.find(params[:id])

		request = Invite.find_by(invitee: invitee, user: user)

		request.destroy

		return redirect_to :back

	end
end
