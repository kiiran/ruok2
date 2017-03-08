class GroupMembershipsController < ApplicationController
# Doses are memberships
# memberships are a collection of the user associated groups
  before_action :set_group, except: [:index]
  before_action :set_group_membership, only: [:destroy]


  def index
    @group_memberships = GroupMembership.all
    @groups = Group.all
  end

  def new
    @group_membership = GroupMembership.new
    @user1 = User.new
    @user2 = User.new
    @user3 = User.new
    @user4 = User.new
    @user5 = User.new
  end

  def create
    # @group_membership = GroupMembership.new(group_membership_params)
    # @group_membership.group = @group
    @group_membership = @group.group_memberships.build(group_membership_params)

    if @group_membership.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @group = @group_membership.group
    @group_membership.destroy
    redirect_to group_path(@group)
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_membership_params
    params.require(:group_membership).permit(:user_id, :group_id, :admin)
  end

  def set_group_membership
    @group_membership = GroupMembership.find(params[:id])
  end
end
