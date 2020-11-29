class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy]
  # 在所有 action 先執行方法, 只要這些 [ :action ]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path, notice: '新增看板成功' 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to root_path, notice: '更新看板成功'
    else
      render :edit
    end
  end

  def destroy
      @board.destroy
      redirect_to root_path, notice: '看板已刪除'
  end





  private

    def board_params
      params.require(:board).permit(:title)
    end

    def find_board
      @board = Board.find(params[:id])
    end

end
