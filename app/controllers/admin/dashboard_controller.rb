class Admin::DashboardController < Admin::BaseController
  def show
    @products = Product.count
    @category = Category.count
  end
end
