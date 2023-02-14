class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
    def index
        @books = Book.all
        @books = params[:tag_id].present? ? Tag.find(params[:tag_id]).books : Book.all
    end

    def form
    end

    

    def edit
      @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        book = Book.new(book_params)
        if book.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @book = Book.find(params[:id])
      end

      def update
        book = Book.find(params[:id])
        if book.update(book_params)
          redirect_to :action => "show", :id => book.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to action: :index
      end
    
      private
      def book_params
        params.require(:book).permit(:body, :book_name, :author_name, :price, :body, :image, :title, tag_ids: [])
      end

end