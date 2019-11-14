class Admin::DashboardController < ApplicationController
  def show
    @prods = Product.all
    @cats = Category.all
  end
end

