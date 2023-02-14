class MemosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :index, :edit]
    def index
        @memo = Memo.all
    end

    def top
    end

    def new
        @memo = Memo.new
    end

    def create
        memo = Memo.new(memo_params)
        memo.user_id = current_user.id
        if memo.save
          redirect_to :action => "show", :id => memo.id
        else
          redirect_to :action => "new"
        end
      end

      def show
        @memo = Memo.find(params[:id])
      end

      def edit
        @memo = Memo.find(params[:id])
      end

      def update
        memo = Memo.find(params[:id])
        if memo.update(memo_params)
          redirect_to :action => "show", :id => memo.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        memo = Memo.find(params[:id])
        memo.destroy
        redirect_to action: :index
      end
    
      private
      def memo_params
        params.require(:memo).permit(:memo_date, :memo_name, :memo_body, :image)
      end
end
