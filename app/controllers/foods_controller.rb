class FoodsController < ApplicationController
    before_action :set_food, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: %i[index show]
  def index
    @foods = current_user ? current_user.foods : []
  end

  def show
    
  end

  def new
    @food = Food.new
  end

  def edit
  end
 
  def create
    @food = Food.new(**food_params, user_id: current_user.id)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url(@food), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(**food_params, user_id: current_user.id)
        format.html { redirect_to foods_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @food.destroy
     respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end   

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:Name, :Measurement_id, :Price, :Quantity)
  end
end

