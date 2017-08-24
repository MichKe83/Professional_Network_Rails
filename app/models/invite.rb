class Invite < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :invitee, :foreign_key => "invitee_id", :class_name => "User"
end
