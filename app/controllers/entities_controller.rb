class EntitiesController < ApplicationController
    before_action :require_login
  def index
    @group = Group.find(params[:group_id])
    @group_transactions = Entity.where(group: @group).order(created_at: :desc)
  end

  def new
    @new_transaction = Entity.new
    @user_groups = Group.where(user: current_user)
  end

  def create
    @new_transaction = Entity.new(entity_params)

    return unless @new_transaction.save

    flash[:success] = 'Transaction created successfully.'
    redirect_to group_entities_path(entity_params[:group_id])
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :author_id, :group_id)
  end
end