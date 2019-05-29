class CommentsController < ApplicationController

def create
# byebug
@comment = Comment.new(comment_params)
@comment.user_id = 6 
@comment.item_id = 3
@comment.save
redirect_to(request.env["HTTP_REFERER"])
end

private

def comment_params
	params.require(:comment).permit(:description, :rating)
end

end
