package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import com.greensock.*;
	import src.*;	
	
	/*--------
	Controller
	--------*/
	
	public class Main extends MovieClip{
		
		private var model:ACMEModel;
		private var view:ACMEView;
		
		public function Main() {
			
			model = new ACMEModel();
			view = new ACMEView(model, this);
			
			view.menu.spring_btn.addEventListener(MouseEvent.CLICK, setState);
			view.menu.summer_btn.addEventListener(MouseEvent.CLICK, setState);
			view.menu.fall_btn.addEventListener(MouseEvent.CLICK, setState);
			view.menu.winter_btn.addEventListener(MouseEvent.CLICK, setState);
			view.menu.menuDrop_btn.addEventListener(MouseEvent.CLICK, setState);
			
		}
		
		private function setState(e:Event):void {
			switch(e.target.name) {
				case "spring_btn": 
					model.setState("Spring");
					view.menuUp();
					model.loadXML();
					view.addEventListener("menuUp", loadList);

				break;
				case "summer_btn": 
					model.setState("Summer");
					view.menuUp();
					model.loadXML();
					view.addEventListener("menuUp", loadList);
				break;
				case "fall_btn":
					model.setState("Fall");
					view.menuUp();
					model.loadXML();
					view.addEventListener("menuUp", loadList);
				break;
				case "winter_btn": 
					model.setState("Winter");
					view.menuUp();
					model.loadXML();
					view.addEventListener("menuUp", loadList);
				break;
				case "menuDrop_btn":
					model.setState("Menu");
					view.menuDown();
			}
		
		}
		
		private function loadList(e:Event):void {
			view.loadViewList();
		}

	}
	
}
