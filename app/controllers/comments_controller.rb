class CommentsController < ApplicationController
# コメントを保存、投稿するためのアクションです。
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @topic = @comment.topic
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
        format.js { render :index, notice: 'コメントを投稿しました。' }
    end
  end

  def destroy
      # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
      @comment = Comment.find(params[:id])
      @comment = current_user.comments.destroy(comment_params)
      @topic = @comment.topic
      # クライアント要求に応じてフォーマットを変更
      respond_to do |format|
        @comment.destroy
      format.js { render :index, notice: 'コメントを削除しました' }
      end
  end


  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
