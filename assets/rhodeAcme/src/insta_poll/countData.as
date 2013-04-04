package src.insta_poll {
	
	public class countData {
		
			private var lusanne:Array;
			private var niseko:Array;
			private var prague:Array;
			private var patagonia:Array;
			private var sanjuan:Array;
			private var montpellier:Array;
			private var puerto:Array;
			private var nyc:Array;
			private var maine:Array
			private var maui:Array;
			private var miami:Array;
			private var bahama:Array;
			
		public function countData() {
			lusanne = new Array();
			niseko = new Array();
			prague = new Array();
			patagonia = new Array();
			sanjuan = new Array();
			montpellier = new Array();
			puerto = new Array();
			nyc = new Array();
			maine = new Array();
			maui = new Array();
			miami = new Array();
			bahama = new Array();
			for (var i:uint; i<2; i++) {
			lusanne[i] = 0;
			niseko[i] = 0;
			prague[i] = 0;
			patagonia[i] = 0;
			sanjuan[i] = 0;
			montpellier[i] = 0;
			puerto[i] = 0;
			nyc[i] = 0;
			maine[i] = 0;
			maui[i] = 0;
			miami[i] = 0;
			bahama[i] = 0;
			}
			
		}
		
		public function likeUp(trip:String):void {
			switch(trip) {
			case "New York City": nyc[0]++;
			break;
			case "Bahama": bahama[0]++;
			break;
			case "Miami": miami[0]++;
			break;
			case "Maui": maui[0]++;
			break;
			case "Maine": maine[0]++;
			break;
			case "Puerto Vallarta": puerto[0]++;
			break;
			case "Montpellier": montpellier[0]++;
			break;
			case "San Juan": sanjuan[0]++;
			break;
			case "Patagonia": patagonia[0]++;
			break;
			case "Prague": prague[0]++;
			break;
			case "Niseko": niseko[0]++;
			break;
			case "Lusanne": lusanne[0]++;
			break;
			}
		}
		public function getLikes(trip:String) {
			switch(trip) {
			case "New York City":return nyc[0];
			break;
			case "Bahama": return bahama[0];
			break;
			case "Miami": return miami[0];
			break;
			case "Maui": return maui[0];
			break;
			case "Maine": return maine[0];
			break;
			case "Puerto Vallarta": return puerto[0];
			break;
			case "Montpellier": return montpellier[0];
			break;
			case "San Juan": return sanjuan[0];
			break;
			case "Patagonia": return patagonia[0];
			break;
			case "Prague": return prague[0];
			break;
			case "Niseko": return niseko[0];
			break;
			case "Lusanne": return lusanne[0];
			break;
			}
		}
	public function likeDown(trip:String):void {
			switch(trip) {
			case "New York City": nyc[1]++;
			break;
			case "Bahama": bahama[1]++;
			break;
			case "Miami": miami[1]++;
			break;
			case "Maui": maui[1]++;
			break;
			case "Maine": maine[1]++;
			break;
			case "Puerto Vallarta": puerto[1]++;
			break;
			case "Montpellier": montpellier[1]++;
			break;
			case "San Juan": sanjuan[1]++;
			break;
			case "Patagonia": patagonia[1]++;
			break;
			case "Prague": prague[1]++;
			break;
			case "Niseko": niseko[1]++;
			break;
			case "Lusanne": lusanne[1]++;
			break;
			}
		}
		public function getDislikes(trip:String) {
			switch(trip) {
			case "New York City": return nyc[1];
			break;
			case "Bahama": return bahama[1];
			break;
			case "Miami": return miami[1];
			break;
			case "Maui": return maui[1];
			break;
			case "Maine": return maine[1];
			break;
			case "Puerto Vallarta": return puerto[1];
			break;
			case "Montpellier": return montpellier[1];
			break;
			case "San Juan": return sanjuan[1];
			break;
			case "Patagonia": return patagonia[1];
			break;
			case "Prague": return prague[1];
			break;
			case "Niseko": return niseko[1];
			break;
			case "Lusanne": return lusanne[1];
			break;
			}
		}
			
	}
	
}
