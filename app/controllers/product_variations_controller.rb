class ProductVariationsController < ApplicationController
  before_action :set_product_variation, only: [:show, :edit, :update, :destroy]

  # GET /product_variations
  # GET /product_variations.json
  def index
    @product_variations = ProductVariation.all
  end

  # GET /product_variations/1
  # GET /product_variations/1.json
  def show
  end

  # GET /product_variations/new
  def new
    @product_variation = ProductVariation.new
  end

  # GET /product_variations/1/edit
  def edit
  end

  # POST /product_variations
  # POST /product_variations.json
  def create
    @product_variation = ProductVariation.new(product_variation_params)

    respond_to do |format|
      if @product_variation.save
        format.html { redirect_to @product_variation, notice: 'Product variation was successfully created.' }
        format.json { render :show, status: :created, location: @product_variation }
      else
        format.html { render :new }
        format.json { render json: @product_variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_variations/1
  # PATCH/PUT /product_variations/1.json
  def update
    respond_to do |format|
      if @product_variation.update(product_variation_params)
        format.html { redirect_to @product_variation, notice: 'Product variation was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_variation }
      else
        format.html { render :edit }
        format.json { render json: @product_variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_variations/1
  # DELETE /product_variations/1.json
  def destroy
    @product_variation.destroy
    respond_to do |format|
      format.html { redirect_to product_variations_url, notice: 'Product variation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variation
      @product_variation = ProductVariation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_variation_params
      params.require(:product_variation).permit(:sku, :title, :price, :product_id)
    end
end
