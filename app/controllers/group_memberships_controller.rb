class GroupMembershipsController < ApplicationController
  def show
  end

  def new
    @group_membership = GroupMembership.new
  end

  def create
    if group_exits?.nil?
      @group = group_obj_create
      @group_membership
    else

  end

  def update
  end

  def destroy
  end

private
  def membership_params
    params.require()

  end

  def group_exits?
    Group.find(params.group_name)
  end

  def group_obj_create
    @group = Group.new
    @group.name = params.group_name
  end
end
