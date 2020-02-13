class GroupsController < ApplicationController
  before_action :set_group, only: [:join, :exit]

  # GET /groups
  # GET /groups.json
  def index
    @groups = params[:gametitle_id].present? ? Gametitle.find(params[:gametitle_id]).groups.order(created_at: :DESC) : current_user.groups.order(created_at: :DESC)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    # binding.pry
    @group = Group.find(params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group)
    else
      render :new
    end
    # respond_to do |format|
    #   if @group.save
    #     format.html { redirect_to @group, notice: 'Group was successfully created.' }
    #     format.json { render :show, status: :created, location: @group }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @group.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    if current_user.id == @group.leader_id
      if @group.update(group_params)
        redirect_to group_messages_path(@group)
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def join
    group_users = current_user.group_users.new(group_id: @group.id)
    group_users.save
    redirect_to group_messages_path(@group)
  end

  def exit
    group_users = current_user.group_users.find_by(group_id: @group.id)
    group_users.destroy
    redirect_to group_messages_path(@group)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :image, :memo, gametitle_ids: []).merge(leader_id: current_user.id, user_ids: current_user.id )
    end

    def group_join
      params.require(:group).permit(user_ids: [])
    end
end
