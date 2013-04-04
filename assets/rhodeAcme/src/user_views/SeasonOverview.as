package  src.user_views{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.*;	
	import src.data_objects.Season;
	
	public class SeasonOverview extends MovieClip {
		
		private var season:Season;
		var viewContainer:ViewContainer;

		public function SeasonOverview() {
		}
		
		public function loadSeason(season:Season) {
			if(season != null) {
				this.season = season;
				viewContainer = new ViewContainer();
				addChild(viewContainer);
				viewContainer.seasonTitle.text = season.getSeason();
				var trips:Array = this.season.getTrip();
				for (var i:uint=0; i<trips.length; i++){
					var seasonLocation:MovieClip = new ViewLocation();
					var clicker:Sprite = new Sprite();
					clicker.graphics.beginFill(0x000000, 0);
					clicker.graphics.drawRect(-193,-40, seasonLocation.width, seasonLocation.height);
					clicker.graphics.endFill();
					clicker.name = String(i);
					seasonLocation.addChild(clicker);
					seasonLocation.locationTextLarge.text = trips[i].getName();
					seasonLocation.locationTextSmall.text = trips[i].getSecondName();
					seasonLocation.upperRating.text = trips[i].getRating();
					seasonLocation.imageLoader.load(new URLRequest(trips[i].getPicture()));
					this.addChild(seasonLocation);
					seasonLocation.y = ((seasonLocation.height + 15)*i) - 120;
					seasonLocation.buttonMode = true;
				}
			}
		}
		
	}
	
}
