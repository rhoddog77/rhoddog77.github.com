package src {
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import src.data_objects.*;
	
	/*---
	Model
	---*/
	
	public class ACMEModel extends URLLoader{
		
		private var xml:XML;
		private var currentState:String;
		var season:Season;
		
		public function ACMEModel() {
					}
		
		public function setState(state:String):void {
			currentState = state;
			dispatchEvent(new Event("State Change"));
		}
		
		public function getState(){
			return currentState;
		}
		
		public function getSeason() {
			return season;
		}
		
		public function loadXML():void {
			addEventListener(Event.COMPLETE, onComplete);
			switch(currentState){
				case "Spring": load(new URLRequest("xml/spring.xml"));
				break;
				case "Summer": load(new URLRequest("xml/summer.xml"));
				break;
				case "Fall": load(new URLRequest("xml/fall.xml"));
				break;
				case "Winter": load(new URLRequest("xml/winter.xml"));
				break;
			}
			
		}
		
		private function onComplete(e:Event) {
			xml = new XML(e.target.data);
			parseXML();
		}
		
		private function parseXML(){
			XML.ignoreWhitespace = true;
			
			var arrayTrip:Array = new Array();
						
			for each(var trip in xml.trip)
			{
				var arrayComments:Array = new Array();
				for each(var comment in trip.comments.comment)
				{
					arrayComments.push(new Comment(comment.name, Number(comment.rating), comment.desc, comment.picture));
				}
				
				var tripTemp:Trip = new Trip(arrayComments, trip.name, trip.secondName, int(trip.price), Number(trip.rating), trip.description, trip.picture, trip.pictureLarge);
				arrayTrip.push(tripTemp);
			}
			season = new Season(currentState, arrayTrip);
			dispatchEvent(new Event("Parsed"));
		}

	}
	
}
