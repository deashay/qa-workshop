class CartsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
  expose(:book)

  def add_book
    current_user.cart.books << book
    redirect_to root_path, notice: 'Book removed from cart!'
  end

  def remove_book
    current_user.cart.remove_book(book)
    head :ok
  end
end
