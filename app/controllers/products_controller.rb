class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = "Product created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_url
  end

  private
    def product_params
      params.require(:product).permit(:name, :text, :price)
    end
end
