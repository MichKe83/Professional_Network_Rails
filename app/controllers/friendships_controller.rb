class FriendshipsController < ApplicationController

	def create
		user = current_user
		notfriend = User.find(params[:id])
		newfriend = Friendship.new(user: user, friend: notfriend) 
		addnewfriend = Friendship.new(user: notfriend, friend: user)
		
		if newfriend.save && addnewfriend.save
				
			invitee = User.find(params[:id])

			
			request = Invite.find_by(invitee: invitee, user: user)

			
			request.destroy

			return redirect_to :back
		end

		return redirect_to :back
	end
	

	def destroy
		user = current_user
		friend = User.find(params[:id])


		friendship = Friendship.find_by(friend: friend, user: user)
		addnewfriend = Friendship.find_by(user: friend, friend: user)

		friendship.destroy
		addnewfriend.destroy

		return redirect_to :back

	end


end
