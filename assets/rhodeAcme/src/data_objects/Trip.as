package  src.data_objects {
	
	import flashx.textLayout.elements.InlineGraphicElement;
	
	public class Trip {
		
		private var comments:Array;
		private var name:String;
		private var secondName:String;
		private var price:int;
		private var rating:Number;
		private var description:String;
		private var picture:String;
		private var pictureLarge:String;

		public function Trip(comments:Array, name:String, secondName:String, price:int, rating:Number, description:String, picture:String, pictureLarge:String) {
		
			this.comments = comments;
			this.name = name;
			this.secondName = secondName;
			this.price = price;
			this.rating = rating;
			this.description = description;
			this.picture = picture;
			this.pictureLarge = pictureLarge;
			
		}
		
		public function getComments():Array {
			return comments;
		}
		
		public function getName():String {
			return name;
		}
		public function getSecondName():String {
			return secondName;
		}
		
		public function getPrice():int {
			return price;
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
		
		public function getPictureLarge():String {
			return pictureLarge;
		}
	}
	
}
