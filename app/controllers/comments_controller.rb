class CommentsController < ApplicationController

    def create

        @post = Post.find(params[:post_id])
        @comment = Comment.new (comment_params)
        @comment.post = @post
        if @comment.save
        redirect_to posts_path

        else

        @comments = @post.comments.order(created_at: :ASC)
        render 'posts/show'
        end
    end

    def destroy
        @comment = Comment.find params[:id]

            @comment.destroy
            redirect_to post_path(@comment.post)

    end

    private

    def comment_params
        params.require(:comment).permit(:description, )
    end
  end
