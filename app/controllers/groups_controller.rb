class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.group_memberships.first.admin = true
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    redirect_to current_user_profile_path
  end

  def destroy
    @group.destroy
    redirect_to current_user_profile_path
  end

  def send_questionnaire_to
    @group.send_questionnaire_to
  end

private
  def group_params
    params.require(:group).permit(:name, :photo)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
