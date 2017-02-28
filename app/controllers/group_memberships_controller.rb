class GroupMembershipsController < ApplicationController
  def index
    show
  end

  def show
    @memberships = GroupMembership.all
  end

  def new
    @group_membership = GroupMembership.new
  end

  def create
    if group_exits?.nil?
      @group = group_obj_create
      @group_membership.group_id = @group # it think this can be refracted #sng:Filipe
      @group_membership = membership_params
    else
      @group = group_exits?
      @group_membership.group_id = @group # it think this can be refracted #sng:Filipe
      @group_membership = membership_params
    end

    if @group_membership.save
      redirect_to user_group_memberships
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
    params.require(admin: params.admin, user_id: current_user.id)
  end

  def group_params
    params.require(:name)
  end

  def group_exits?
    Group.find(group_params.name)
  end

  def group_obj_create
    @group = Group.new
    @group.name = group_params.name
  end
end
