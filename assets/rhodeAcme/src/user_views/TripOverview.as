package src.user_views {
	
	import flash.display.MovieClip;
	import fl.controls.UIScrollBar;
	import src.data_objects.Trip;
	import flash.net.URLRequest;
	
	public class TripOverview extends MovieClip {
		
		private var trip:Trip;
		private var tripContainer:ViewTrip;

		public function TripOverview(trip:Trip) {
				this.trip = trip;
				tripContainer = new ViewTrip();
				tripContainer.tripTitle.text = trip.getName();
				tripContainer.tripTitle2.text = trip.getSecondName();
				tripContainer.tripPrice.text = "$" + trip.getPrice().toString();
				tripContainer.tripDescription.text = trip.getDescription();
				tripContainer.upperRating.text = trip.getRating().toString();
				tripContainer.tripPic.load(new URLRequest(trip.getPictureLarge()));
				if (tripContainer.tripDescription.length > 890){
					var scrollBar:UIScrollBar = new UIScrollBar(); 
					scrollBar.scrollTarget = tripContainer.tripDescription;
					scrollBar.height = tripContainer.tripDescription.height;
					scrollBar.move(( 3 + tripContainer.tripDescription.x) + tripContainer.tripDescription.width, tripContainer.tripDescription.y);
					tripContainer.addChild(scrollBar);
				}
				this.addChild(tripContainer);
			
		}
		public function getTrip() {
			return trip;
		}

	}
	
}
