class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
