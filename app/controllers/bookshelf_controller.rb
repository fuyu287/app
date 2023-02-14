class BookshelfController < ApplicationController
    def index
        @books = Book.all
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
    
      private
      def book_params
        params.require(:book).permit(:body, :book_name, :author_name, :price)
      end

end
