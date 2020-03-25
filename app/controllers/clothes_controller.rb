class ClothesController < ApplicationController
  def index
  	@q = Clothe.ransack(params[:q])
    @clothes = @q.result(distinct: true)
  end
end
