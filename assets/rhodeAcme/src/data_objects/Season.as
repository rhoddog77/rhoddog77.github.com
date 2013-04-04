package src.data_objects  {
	
	public class Season {
		
		private var trip:Array;
		private var season:String;

		public function Season(season:String, trip:Array) {
			this.trip = trip;
			this.season = season;
		}
		
		public function getSeason():String {
			return season;
		}
		
		public function getTrip():Array {
			return trip;
		}

	}
	
}
