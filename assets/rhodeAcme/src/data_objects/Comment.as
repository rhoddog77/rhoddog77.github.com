package src.data_objects {
	
	public class Comment {
		
		private var name:String;
		private var rating:Number;
		private var description:String;
		private var picture:String;

		public function Comment(name:String, rating:Number, description:String, picture:String) {
			
			this.name = name;
			this.rating = rating;
			this.description = description;
			this.picture = picture;
			
		}
		
		public function getName():String {
			return name;
		}
		
		public function getRating():Number {
			return rating;
		}
		
		public function getDescription():String {
			return description;
		}
		
		public function getPicture():String {
			return picture;
		}

	}
	
}
