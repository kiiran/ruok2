class GroupMembershipsController < ApplicationController
  def index
    show
  end

  def show
    @memberships = GroupMembership.all
  end

  def new
    @group_membership = GroupMembership.new
    @groups = Group.all
  end

  def create
    @group_membership = GroupMembership.new(membership_params)
    @group_membership.user_id = current_user.id

    if @group_membership.save
      redirect_to user_group_memberships_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

private
  def membership_params
    params.require(:group_membership).permit(:group_id)
  end

end
