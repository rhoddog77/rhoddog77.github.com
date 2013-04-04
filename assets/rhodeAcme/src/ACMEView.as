package src {
	import flash.display.MovieClip;
	import flash.events.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.events.EventDispatcher;
	import fl.controls.Button;
	import fl.video.FLVPlayback;	
	import src.data_objects.Trip;
	import src.user_views.*;
	import src.insta_poll.countData;

	/*--
	View
	--*/
	
	public class ACMEView extends MovieClip{
		
		public var menu:ViewMenu;
		private var model:ACMEModel;
		private var controller:Main;
		private var seasonOverview:SeasonOverview;
		private var trip:TripOverview;
		private var comments:CommentOverview;
		private var leftComment:buttonLeft;
		private var rightComment:buttonRight;
		private var leftTrip:buttonLeft;
		private var rightTrip:buttonRight;
		private var currComment:uint;
		private var currTrip:uint;
		private var fromLeft:Boolean = true;
		private var seasonTxt:seasonText;
		private var myPlay:playBtn;
		private var video:ViewVideo;
		private var poll:ViewPoll;
		private var myPoll:countData;
		
		
		public function ACMEView(model:ACMEModel, controller:Main) {
			this.model = model;
			this.controller = controller;
			controller.addChild(this);
			model.addEventListener("State Change", loadState);
			model.setState("ViewMenu");
			myPoll = new countData();
		}
		
		//waits for model to finish loading
		private function loadState(e:Event):void {
			if(model.getState() == "ViewMenu") loadViewMenu();
		}
		
		//adds the main menu to the stage
		private function loadViewMenu():void {
			menu = new ViewMenu();
			addChild(menu);
			menu.x = 252, menu.y = 308;
			
		}
		
		//adds the season overview to the stage
		public function loadViewList():void {
			seasonOverview = new SeasonOverview();
			seasonOverview.alpha = 0;
			seasonOverview.scaleX = .5;
			seasonOverview.scaleY = .5;
			TweenLite.to(seasonOverview, .5, {alpha:1, scaleX:1, scaleY:1, onCompleteParams:controller.addChild(seasonOverview)});
			seasonOverview.loadSeason(model.getSeason());
			seasonOverview.x = 250, seasonOverview.y = 300;
			seasonOverview.addEventListener(MouseEvent.CLICK, overviewClicked);
		}
		
		//sets the current trip to the one clicked, then adds controlling buttons to stage
		private function overviewClicked(e:Event){
			if(controller.contains(seasonOverview))controller.removeChild(seasonOverview);
			currTrip = uint(e.target.name);
			leftTrip = new buttonLeft();
			rightTrip = new buttonRight();
			leftTrip.x = 12, leftTrip.y = 250;
			rightTrip.x = 487, rightTrip.y = 250;
			controller.addChild(leftTrip);
			controller.addChild(rightTrip);
			leftTrip.addEventListener(MouseEvent.CLICK, scrollLeft);
			rightTrip.addEventListener(MouseEvent.CLICK, scrollRight);
			seasonTxt = new seasonText();
			seasonTxt.value.text = model.getSeason().getSeason();
			seasonTxt.x = 250, seasonTxt.y = 570;
			controller.addChild(seasonTxt);
			displayTrip(currTrip);
		}
		
		//adds the current trip to the stage
		public function displayTrip(tripVal:uint):void {
			trip = new TripOverview(model.getSeason().getTrip()[tripVal]);
			trip.y = 240;
			
			//adds video for Montpellier
			if(trip.getTrip().getName() == "Montpellier") {
				myPlay = new playBtn();
				myPlay.x = -170, myPlay.y = 330;
				trip.addChild(myPlay);
				myPlay.addEventListener(MouseEvent.CLICK, loadVideo);
			}
			
			if(fromLeft == false) trip.x = -250;
			else trip.x = 750;
			controller.addChild(trip);
			TweenLite.to(trip, .75, {x:250, ease:Cubic.easeOut});
			leftComment = new buttonLeft();
			leftComment.x = -230, leftComment.y = 240;
			trip.addChild(leftComment);
			rightComment = new buttonRight();
			rightComment.x = 230, rightComment.y = 240;
			trip.addChild(rightComment);
			leftComment.addEventListener(MouseEvent.CLICK, commentLeft);
			rightComment.addEventListener(MouseEvent.CLICK, commentRight);
			poll = new ViewPoll();
			poll.x = -140, poll.y = 90;
			trip.addChild(poll);
			poll.likeBtn.addEventListener(MouseEvent.CLICK, likeUp);
			poll.dislikeBtn.addEventListener(MouseEvent.CLICK, likeDown);
			poll.numLikes.text = myPoll.getLikes(trip.getTrip().getName()).toString();
			poll.numDislikes.text = myPoll.getDislikes(trip.getTrip().getName()).toString();
			displayComments(uint(0));
		}
		
		//increases number of likes for trip
		private function likeUp(e:Event):void {
			myPoll.likeUp(trip.getTrip().getName());
			poll.numLikes.text = myPoll.getLikes(trip.getTrip().getName()).toString();
		}
		
		//increses number of dislikes for trip
		private function likeDown(E:Event):void {
			myPoll.likeDown(trip.getTrip().getName());
			poll.numDislikes.text = myPoll.getDislikes(trip.getTrip().getName()).toString();
		}
		
		private function loadVideo(e:Event):void {
			video = new ViewVideo();
			video.y = 50;
			video.swfLoader.source = "video/montpellier.flv";
			video.scaleX = .5, video.scaleY = .5;
			video.alpha = 0;
			video.closeBtn.addEventListener(MouseEvent.CLICK, tweenVideo);
			TweenLite.to(video, .5, {alpha:1, scaleX:1, scaleY:1, onCompleteParams:trip.addChild(video)});
		}
		
		private function tweenVideo(e:Event):void {
			video.swfLoader.stop();
			TweenLite.to(video, .5, {alpha:0, scaleX:.5, scaleY:.5, onComplete:closeVideo});
		}
		
		private function closeVideo():void {
			trip.removeChild(video);
		}
		
		private function displayComments(i:uint):void {
			comments = new CommentOverview(trip.getTrip().getComments()[i]);
			comments.x=0, comments.y=240;
			trip.addChild(comments);
			
		}
		
		private function commentRight(e:Event):void {
			if(trip.contains(comments))trip.removeChild(comments);
			if(currComment < (trip.getTrip().getComments().length - 1)){
				currComment++;
				displayComments(currComment);
			   }
			else {
				currComment = 0;
				displayComments(currComment);
			}
		}
		
		private function commentLeft(e:Event):void {
			if(trip.contains(comments))trip.removeChild(comments);
			if(currComment > 0){
				currComment--;
				displayComments(currComment);
			   }
			else {
				currComment = (trip.getTrip().getComments().length-1);
				displayComments(currComment);
			}
		}
		
		private function tripRight():void {
			fromLeft = true;
			if(controller.contains(trip))controller.removeChild(trip);
			if(currTrip < 2) {
				currTrip++;
				displayTrip(currTrip);
			}
			else {
				currTrip = 0;
				displayTrip(currTrip);
			}
		}
		
		private function tripLeft():void {
			fromLeft = false;
			if(controller.contains(trip))controller.removeChild(trip);
			if(currTrip > 0) {
				currTrip--;
				displayTrip(currTrip);
			}
			else {
				currTrip = 2;
				displayTrip(currTrip);
			}
		}
		
		private function scrollRight(e:Event):void {
			TweenLite.to(trip, .5, {x:-275, onComplete:tripRight});
		}
		
		private function scrollLeft(e:Event):void {
			TweenLite.to(trip, .5, {x:780, onComplete:tripLeft});
		}
		
		public function menuUp():void {
			TweenLite.to(menu, 1, {y:-292, ease:Cubic.easeOut, onComplete:menuUpComplete});
		}
		
		private function menuUpComplete(){
			dispatchEvent(new Event("menuUp"));
		}
		
		public function menuDown():void {
			if(controller.contains(seasonOverview))controller.removeChild(seasonOverview);
			if(trip == null){}
			else {if(controller.contains(trip))controller.removeChild(trip);}
			
			if(leftTrip == null){}
			else {if(controller.contains(leftTrip))controller.removeChild(leftTrip);}
			
			if(rightTrip == null){}
			else {if(controller.contains(rightTrip))controller.removeChild(rightTrip);}
			
			if(seasonTxt == null) {}
			else {if(controller.contains(seasonTxt))controller.removeChild(seasonTxt);}
			
			TweenLite.to(menu, 1, {y:308, ease:Cubic.easeOut});
		}

	}
	
}
