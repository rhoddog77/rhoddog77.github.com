package  src.user_views{
	
	import flash.display.MovieClip;
	import flash.net.*;
	
	import src.data_objects.Comment;
	
	public class CommentOverview extends MovieClip{
		
		private var comments:Comment;
		private var commentContainer:ViewComment;

		public function CommentOverview(comments:Comment) {
			this.comments = comments;
			commentContainer = new ViewComment();
			commentContainer.commFirst.text = comments.getName();
			commentContainer.commRating.text = comments.getRating().toString();
			commentContainer.commentPic.load(new URLRequest(comments.getPicture()));
			commentContainer.userComment.text = comments.getDescription();
			this.addChild(commentContainer);
		}

	}
	
}
