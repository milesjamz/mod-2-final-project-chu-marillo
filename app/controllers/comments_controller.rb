class CommentsController < ApplicationController

def create
@comment = Comment.new(comment_params)
# byebug
@comment.save
redirect_to(request.env["HTTP_REFERER"])
end

private

def comment_params
	params.require(:comment).permit(:description, :rating, :user_id, :item_id)
end

end
