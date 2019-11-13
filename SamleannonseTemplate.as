package maklarhuset.samleannonse {
	import flash.events.Event;
	import flash.text.TextFormatAlign;
	
	import fortress.templates.CompositeAdTemplate;
	
	import mx.events.MenuEvent;
	
	import no.papirfly.msp.core.MspEvent;
	import no.papirfly.msp.managers.ColorManager;
	import no.papirfly.msp.managers.TextStyleManager;
	import no.papirfly.msp.ptp.pageLayout.PageLayout;
	import no.papirfly.msp.ptp.pageLayout.PageLayoutSettings;
	import no.papirfly.msp.ptp.templates.PageType;
	import no.papirfly.msp.ptp.templates.PageTypeSettings;
	import no.papirfly.msp.types.Cmyk;
	import no.papirfly.msp.types.Zoom;

	public class SamleannonseTemplate2011 extends CompositeAdTemplate {
		public function SamleannonseTemplate2011(name:String = TYPE) {
			super(name);
		}

		//**********************************************************//
		//	STANDARD OVERRIDES										//
		//**********************************************************//

		override protected function initPalette():void {
			
			ColorManager.addColor("yellow", 0xdcdb16, new Cmyk(0.17, 0.3, 1, 0));	
			ColorManager.addColor("red", 0xED1C24, new Cmyk(0, 1, 1, 0));	
			ColorManager.addColor("greenBox", 0x8CC63F, new Cmyk(0.5, 0, 1, 0));	
			ColorManager.addColor("gray", 0xcdced0, new Cmyk(0, 0, 0, 0.20));
			ColorManager.addColor("gray2", 0xdcdcdc, new Cmyk(0, 0, 0, 0.14));
			ColorManager.addColor("gray3", 0xe8e8e8, new Cmyk(0, 0, 0, 0.08));
			ColorManager.addColor("gray4", 0xefefef, new Cmyk(0, 0, 0, 0.04));
			ColorManager.addColor("rosa", 0xd20a5f, new Cmyk(0, 0.85, 0.25, 0));	
			ColorManager.addColor("lila", 0x9b2d96, new Cmyk(0.55, 0.95, 0, 0));
			ColorManager.addColor("turkos", 0x00b1ac, new Cmyk(0.60, 0, 0.30, 0));	
			ColorManager.addColor("introGray", 0xe1ded9, new Cmyk(0.1, 0.1, 0.15, 0));	
			ColorManager.addColor("introTurk", 0xbee6e6, new Cmyk(0.30, 0, 0.15, 0));	
			ColorManager.addColor("introGul", 0xf0e98e,  new Cmyk(0, 0, 0.55, 0));
			ColorManager.addColor("introRosa", 0xf0c3dc, new Cmyk(0, 0.3, 0, 0));	
		
		}

		override protected function initTextStyles():void {
			
			TextStyleManager.addStyle("C_R14_B", "", "Caslon224Std-Bold", 14, 1, "rosa",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_L14_B", "", "Caslon224Std-Bold", 14, 1, "lila",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_T14_B", "", "Caslon224Std-Bold", 14, 1, "turkos",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			
			TextStyleManager.addStyle("C_R11_B", "", "Caslon224Std-Bold", 11, 1, "rosa",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_L11_B", "", "Caslon224Std-Bold", 11, 1, "lila",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_T11_B", "", "Caslon224Std-Bold", 11, 1, "turkos",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			
			TextStyleManager.addStyle("C_R10_B", "", "Caslon224Std-Bold", 10, 1, "rosa",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_L10_B", "", "Caslon224Std-Bold", 10, 1, "lila",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("C_T10_B", "", "Caslon224Std-Bold", 10, 1, "turkos",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
		
			TextStyleManager.addStyle("G_B9_MC", "", "Gotham-Medium", 9, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
		
			TextStyleManager.addStyle("GN_B16_BC", "", "GothamNarrow-Bold", 16, 1, "black",true,null,null,flash.text.TextFormatAlign.LEFT,true);
			
			TextStyleManager.addStyle("GN_R10_BC", "", "GothamNarrow-Bold", 10, 1, "rosa",true,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_L10_BC", "", "GothamNarrow-Bold", 10, 1, "lila",true,null,null,flash.text.TextFormatAlign.LEFT,true);
			
			TextStyleManager.addStyle("GN_B7_BC", "", "GothamNarrow-Bold", 7, 1, "black",true,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B4_BC", "", "GothamNarrow-Bold", 4, 1, "black",true,null,null,flash.text.TextFormatAlign.LEFT,true);
		
			TextStyleManager.addStyle("GN_B24_LightC", "", "GothamNarrow-Light", 24, -4, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B22_LightC", "", "GothamNarrow-Light", 22, -4, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			
			TextStyleManager.addStyle("GN_B9_Book_C", "", "GothamNarrow-Book", 9, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true,true);	
			TextStyleManager.addStyle("GN_B9_Book", "", "GothamNarrow-Book", 9, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,false,true);
			TextStyleManager.addStyle("GN_B7_BookC", "", "GothamNarrow-Book", 7, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B7_Book_2", "", "GothamNarrow-Book", 7, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,false,true);
			TextStyleManager.addStyle("GN_B7_Book", "", "GothamNarrow-Book", 7, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,false,true);
			
			TextStyleManager.addStyle("GN_B9_MC", "", "GothamNarrow-Medium", 9, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B8_MC", "", "GothamNarrow-Medium", 8, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);	
			TextStyleManager.addStyle("GN_B7_MC", "", "GothamNarrow-Medium", 7, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B6_MC", "", "GothamNarrow-Medium", 6, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_B5_MC", "", "GothamNarrow-Medium", 5, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT,true);
			
			TextStyleManager.addStyle("GN_R10_LC", "", "GothamNarrow-Light", 10, 1, "rosa",true,null,null,flash.text.TextFormatAlign.LEFT,true);
			TextStyleManager.addStyle("GN_L10_LC", "", "GothamNarrow-Light", 10, 1, "lila",true,null,null,flash.text.TextFormatAlign.LEFT,true);	
			
			TextStyleManager.addStyle("G_B8_C", "", "Gotham-Book", 8, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT, true);
			TextStyleManager.addStyle("G_B7_C", "", "Gotham-Book", 7, 1, "black",false,null,null,flash.text.TextFormatAlign.LEFT, true);
	
		}
	
	
		override protected function initPageTypes():void {
			pageTypes[SamleannonsePage.TYPE] = new PageType(SamleannonsePage, new PageTypeSettings(true));
			pageTypes["default"] = pageTypes[SamleannonsePage.TYPE];
		}

		override protected function initPageLayout():void {
			pageLayout.setParams(new PageLayoutSettings(PageLayout.LAYOUT_GROUPS, 2, new Zoom(Zoom.FIT_ELEMENT), 20))
			maxEditZoom = 1.6
		}
		
		

		//**********************************************************//
		//	OTHER OVERRIDES 										//
		//**********************************************************//

		public var annonseIndex:int;
		public var dpRef:Array;	
		public var dp:Array = new Array();

		override protected function getMenuBarData():Array {
			dp = super.getMenuBarData();
			dp.push(menuBar.getAddMenu());

			dp.push({id: "tekstfarge",label: "Logo & textfärg", children: []});
			dp.push({id: "plugger",label: "Helsidepluggar (för hel- och halvsida)", children: []});
			
			dpRef=dp;
			return dp;
		
		}


		//NEW OVERRIDE
		//Run arrayfunction hver gang layout endres.
		override protected function onLoadCompositeAdComplete(e:MspEvent):void {
			super.onLoadCompositeAdComplete(e);
			setMenuData();
		}
		
		override protected function onAllPagesLoadedCustom():void {

			setMenuData();	
			
		}
		
		
		
		private var annonseIndex2:int;
		private var annonseIndex3:int;

		public function setMenuData():void
		{

			var dpRef2:Array = new Array();
			for (var i:int = 0; i < dpRef.length; i++)
			{

				if (dpRef[i].label == "Samlingsannonser")
				{
					annonseIndex = i;

					for (var j:int = 0; j < dpRef[i].children.length; j++)
					{

						if ((dpRef[i].children[j].label == "Helsida (245x360) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Helsida 12-mod (245x360) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Halvsida (248x178) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Kvartsida liggande (248x88) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Kvartsida stående (122x178) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "1/8-sida - HOUSEBOOK") || (dpRef[i].children[j].label == "1/8-sida (184x95) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Kvartsida stående (137x195) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Kvartsida liggande (278x95) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "3/4 sida (137x279) - HOUSEBOOK") ||
							(dpRef[i].children[j].label == "Helsida 16-modul - HOUSEBOOK"))	
						{
							dpRef2.push(dpRef[i].children[j]);
						}

					}
				}
			}

			for (j = 0; j < dpRef2.length; j++)
			{
				dpRef[annonseIndex].children[j] = dpRef2[j];

				annonseIndex2 = j;
			}
			dpRef[annonseIndex].children.splice(j, 50);

		}


		override protected function updateMenuBar(e:Event = null):void {
			super.updateMenuBar();
			
			try{		
				var setupMenu:Object = menuBar.getMenuItemByID("tekstfarge"); 
				setupMenu.children = new Array();
					
				var setupMenuTre:Object = menuBar.getMenuItemByID("plugger"); 
				setupMenuTre.children = new Array();
				
					if (currentPage != null){

						setupMenu.children.push({label: "Rosa", type: "radio", id: "tekstfarge", param: 1, groupName: "tekstfarge", enabled: true });
						setupMenu.children.push({label: "Lila",  type: "radio", id: "tekstfarge", param: 2, groupName: "tekstfarge", enabled: true});
						setupMenu.children.push({label: "Turkos",  type: "radio", id: "tekstfarge", param: 3, groupName: "tekstfarge", enabled: true});
						setupMenu.children.push({type:"separator"});
						setupMenu.children.push({label: "Underrubrik", children: 
							[
								{label: "9 pt", id: "subtitleSizemenu", param: "GN_B9_MC", type: "radio"}, 
								{label: "7 pt", id: "subtitleSizemenu", param: "GN_B7_MC", type: "radio"}
							]
					});
				
				menuBar.setRadioButtonValue("subtitleSizemenu", (currentPage as SamleannonsePage).getSubtitleSize());
				
					if(SamleannonsePage.ADTYPE!="Tidningsbilaga"){
						setupMenuTre.children.push({label: "AV", type: "radio", id: "plugger", param: 0, groupName: "plugger", enabled: true });
						setupMenuTre.children.push({label: "Förråd", type: "radio", id: "plugger", param: 1, groupName: "plugger", enabled: true });
						setupMenuTre.children.push({label: "Fräscha upp", type: "radio", id: "plugger", param: 2, groupName: "plugger", enabled: true });		
						setupMenuTre.children.push({label: "Stanna hemma", type: "radio", id: "plugger", param: 3, groupName: "plugger", enabled: true });		
					}
					else{
					
						setupMenuTre.children=[];
					
					}
				}
			}
			
			catch (error:Error){}
			
		}
		
		//**********************************************************//
		//	EVENT HANDLING											//
		//**********************************************************//



		//Custom menu items
		override protected function onMenuItemClick(e:MenuEvent):void {

			for(var j:int=0; j<dpRef[annonseIndex3].children.length; j++){
				dpRef[annonseIndex3].children[j].toggled=false;
			}
		
			switch (e.item.id) {
				case "tekstfarge": setTekstFarge(e.item.param); break;
				case "logofarge": setLogoFarge(e.item.param); break;
				case "plugger": setPlugg(e.item.param); break;
				case "subtitleSizemenu": setSubtitleSize(e.item.param); break;	
										
				default:
					super.onMenuItemClick(e);

			}
			
			updateMenuBar();
	
		}
		
		private function setSubtitleSize(param:String):void {
			(currentPage as SamleannonsePage).setSubtitleSize(param);
		}
		
		public static var setAddedPageLogoColor:Number; //set default color 1-3, if not set, use saved mode from ad
		public function setTekstFarge(n:Number):void{
		setAddedPageLogoColor = n;		

			for (var i:int = 0; i < pages.length; i++){	
				try{
					if(SamleannonsePage.ADTYPE!="Tidningsbilaga"){
					pages[i].setOmslag(n);
					//trace("setOmslag"+SamleannonsePage.ADTYPE)
					}
					pages[i].updateTextFromViewer(n);
				}
				catch (error:Error){}
			}
		
		}
		
	
		public function setLogoFarge(n:Number):void {
			
			for (var i:int = 0; i < pages.length; i++){	
				try{
					pages[i].setLogoFarge(n);
				}
				catch (error:Error){}
			}
		
		}
		
		public function setPlugg(n:Number):void {

				try{
					pages[currentPage.pageNumber-1].setPlugg(n);
				}
				catch (error:Error){}
		}

	}
}