package maklarhuset.samleannonse
{
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.Dictionary;
	
	import fortress.brokerservice.CompositeAdType;
	import fortress.core.fortress_internal;
	import fortress.templates.CompositeAdPageTemplate;
	import fortress.templates.CompositeAdTemplate;
	
	import maklarhuset.EmbeddedAssets_prop;
	import maklarhuset.common.LayoutElementFactory_parade;
	import maklarhuset.modulAnnonse.SingleAdViewer;
	
	import mx.controls.Alert;
	
	import no.papirfly.msp.application.core.AppImage;
	import no.papirfly.msp.application.layout.BaseLayout;
	import no.papirfly.msp.core.MspTextField;
	import no.papirfly.msp.ptp.core.PtPExternalAsset;
	import no.papirfly.msp.ptp.core.PtPImage;
	import no.papirfly.msp.ptp.core.PtPRectangle;
	import no.papirfly.msp.ptp.layout.GridElement;
	import no.papirfly.msp.ptp.layout.GridLayout;
	import no.papirfly.msp.ptp.layout.GridLayoutDefinition;
	import no.papirfly.msp.ptp.realEstate.PtPTextFieldWarning;
	import no.papirfly.msp.utils.SizingTools;

	use namespace fortress_internal

	public class SamleannonsePage extends CompositeAdPageTemplate
	{

		static public const TYPE:String="SamleannonsePage";
		
		static public var ADTYPE:String="";
		
		private var viewer:SingleAdViewer;

		//Variabler for oppslag
		private var cat:CompositeAdType;

		//External graphics
		private var gr_logo_1:PtPExternalAsset;
		private var gr_logo_2:PtPExternalAsset;
		private var gr_logo_3:PtPExternalAsset;

		private var gr_fullPlugg1:PtPExternalAsset;
		private var gr_fullPlugg2:PtPExternalAsset;
		private var gr_fullPlugg3:PtPExternalAsset;

		private var gr_halvPlugg1:PtPExternalAsset;
		private var gr_halvPlugg2:PtPExternalAsset;
		private var gr_halvPlugg3:PtPExternalAsset;

		private var pluggPicture:PtPImage;

		private var housebook:PtPTextFieldWarning;
		private var kontor:PtPTextFieldWarning;
		private var kontor2:PtPTextFieldWarning;
		private var kontor3:PtPTextFieldWarning;
		private var kontor4:PtPTextFieldWarning;
		private var kontor5:PtPTextFieldWarning;
		private var kontor6:PtPTextFieldWarning;
		private var kontor7:PtPTextFieldWarning;

		private var kontorPlugg:PtPTextFieldWarning;
		private var kontorPlugg2:PtPTextFieldWarning;

		private var helsidePluggCover:PtPRectangle;

		public function SamleannonsePage()
		{
			super();
			_type=TYPE;
		}

		override protected function addElements():void
		{

			var myGridDef:GridLayoutDefinition=new GridLayoutDefinition(); //myGrid.getDefinition()
			myGridDef.outOfBoundsWarning=true;
			myGridDef.overlapWarning=true;

			myGrid=new GridLayout("myGrid", 0, 0, 100, 100, myGridDef);
			myGrid.layoutGroup="adContainer"
			elements.push(myGrid);

			gr_logo_1=new PtPExternalAsset("gr_logo_1", mm(2), mm(2), mm(241));
			gr_logo_1.loadAsset(EmbeddedAssets_prop.GR_LOGOROSA2);
			elements.push(gr_logo_1);

			gr_logo_2=new PtPExternalAsset("gr_logo_2", mm(2), mm(2), mm(241), mm(42.47));
			gr_logo_2.loadAsset(EmbeddedAssets_prop.GR_LOGOLILLA2);
			elements.push(gr_logo_2);

			gr_logo_3=new PtPExternalAsset("gr_logo_3", mm(2), mm(2), mm(241), mm(42.47));
			gr_logo_3.loadAsset(EmbeddedAssets_prop.GR_LOGOTURKOS2);
			elements.push(gr_logo_3);

			pluggPicture=new PtPImage("pluggPicture", 0, 0, 1, 1);
			elements.push(pluggPicture);
			pluggPicture.addEventListener(AppImage.LOAD_COMPLETE, imageLoaded);

			housebook=new PtPTextFieldWarning("housebook", 0, 0, 1, "GN_B16_BC");
			housebook.editable=false;
			housebook.multiline=false;

			kontor=new PtPTextFieldWarning("kontor", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor);
			kontor.multiline=false;

			kontor2=new PtPTextFieldWarning("kontor2", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor2);

			kontor3=new PtPTextFieldWarning("kontor3", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor3);
			kontor3.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);

			kontor4=new PtPTextFieldWarning("kontor4", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor4);

			kontor5=new PtPTextFieldWarning("kontor5", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor5);
			kontor5.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);

			kontor6=new PtPTextFieldWarning("kontor6", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor6);
			kontor6.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);

			kontor7=new PtPTextFieldWarning("kontor7", 0, 0, 1, "GN_B9_MC");
			elements.push(kontor7);
			kontor7.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);

			helsidePluggCover=new PtPRectangle("helsidePluggCover", 0, 0, 0, 0, "white");
			elements.push(helsidePluggCover);

			//side=245x360, plugg=241x354
			gr_fullPlugg1=new PtPExternalAsset("gr_fullPlugg1", mm(2), mm(3), mm(241));
			gr_fullPlugg1.loadAsset(EmbeddedAssets_prop.GR_FULLPLUGG1);
			elements.push(gr_fullPlugg1);
			gr_fullPlugg1.visible=false;

			gr_fullPlugg2=new PtPExternalAsset("gr_fullPlugg2", mm(2), mm(3), mm(241));
			gr_fullPlugg2.loadAsset(EmbeddedAssets_prop.GR_FULLPLUGG2);
			elements.push(gr_fullPlugg2);
			gr_fullPlugg2.visible=false;

			gr_fullPlugg3=new PtPExternalAsset("gr_fullPlugg3", mm(0), mm(0), mm(245));
			gr_fullPlugg3.loadAsset(EmbeddedAssets_prop.GR_FULLPLUGG3);
			elements.push(gr_fullPlugg3);
			gr_fullPlugg3.visible=false;

			//side=248x178, plugg=242x178
			gr_halvPlugg1=new PtPExternalAsset("gr_halvPlugg1", mm(3), mm(0), mm(242));
			gr_halvPlugg1.loadAsset(EmbeddedAssets_prop.GR_HALVPLUGG1);
			elements.push(gr_halvPlugg1);
			gr_halvPlugg1.visible=false;

			gr_halvPlugg2=new PtPExternalAsset("gr_halvPlugg2", mm(3), mm(0), mm(242));
			gr_halvPlugg2.loadAsset(EmbeddedAssets_prop.GR_HALVPLUGG2);
			elements.push(gr_halvPlugg2);
			gr_halvPlugg2.visible=false;

			gr_halvPlugg3=new PtPExternalAsset("gr_halvPlugg3", mm(0), mm(0), mm(248));
			gr_halvPlugg3.loadAsset(EmbeddedAssets_prop.GR_HALVPLUGG3);
			elements.push(gr_halvPlugg3);
			gr_halvPlugg3.visible=false;

			kontorPlugg=new PtPTextFieldWarning("kontorPlugg", 0, 0, 1, "GN_R10_BC");
			elements.push(kontorPlugg);
			kontorPlugg.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);
			kontorPlugg.multiline=false;

			kontorPlugg2=new PtPTextFieldWarning("kontorPlugg2", 0, 0, 1, "GN_R10_LC");
			elements.push(kontorPlugg2);
			kontorPlugg2.addEventListener(MspTextField.TEXT_CHANGED, updatePositions);
			kontorPlugg2.multiline=false;

		}

		private function imageLoaded(e:Event=null):void
		{

			imagePosition();

		}


		private function imagePosition():void
		{

			var setContainerHeight:Number;
			var setContentHeight:Number;
			if ((setcompTypeInit == 1) || (setcompTypeInit == 2001))
			{
				setContainerHeight=mm(46);
				setContentHeight=964;
			}
			else if (setcompTypeInit == 2)
			{
				setContainerHeight=mm(23.5);
				setContentHeight=472;
			}

			var pictureHAlign:Number=0;
			var pictureVAlign:Number=(setContainerHeight / 2) - (setContentHeight / 2);

			pluggPicture.setCropPosition(pictureHAlign, pictureVAlign);

		}


		private function updatePositions(e:Event=null):void
		{

			kontor3.bottomY=kontor5.bottomY=28.33;
			kontorPlugg2.x=kontorPlugg.rightX - 3;

		}


		//UPDATE TEXTCOLOR IN ADS
		public static var updateTextFromViewerInit:Number=1; //IF NOT SET (1-3), USE SAVED MODE FROM ADS

		public function updateTextFromViewer(n:Number):void
		{

			var ad:SingleAdViewer;
			var ge:GridElement;
			var o:Object;

			updateTextFromViewerInit=n;
			trace("NUMBER OF ELEMENTS" + myGrid.elements.length);

			//Loop through grid and look for new element(s).
			for each (o in myGrid.elements)
			{

				ge=o as GridElement;
				if (ge.getElement() is SingleAdViewer)
				{
					ad=ge.getElement() as SingleAdViewer;

					try
					{
						ad.settextColor(n);
						SingleAdViewer.saveSetTextColor=n;
					}
					catch (error:Error)
					{
					}
				}
			}

		}




		private function updateTextFromViewerListener(e:Event=null):void
		{

			var ad:SingleAdViewer;
			var ge:GridElement;
			var o:Object;

			trace("NUMBER " + myGrid.elements.length);
			trace("LOADED " + myPageNumber);
			if ((myGrid.elements.length == 0))
			{
				setDepartmentPhoneFromAd="SÄTT IN ANNONS";
				setDepartmentNameFromAd="SÄTT IN ANNONS";
				setTextInfos();
			}

			//Loop through grid and look for new element(s).
			for each (o in myGrid.elements)
			{

				ge=o as GridElement;
				if (ge.getElement() is SingleAdViewer)
				{
					ad=ge.getElement() as SingleAdViewer;

					//SET KONTOR-INFO FROM AD
					trace("SET INFO " + setDepartmentNameFromAd);
					if ((myGrid.elements.length == 1) && ((setDepartmentPhoneFromAd == "") || (setDepartmentPhoneFromAd == "SÄTT IN TEXT") || (setDepartmentPhoneFromAd == "SÄTT IN ANNONS")))
					{

						setDepartmentNameFromAd=ad.readInfoTilSamle();
						setDepartmentPhoneFromAd=ad.readInfoTilSamle2();

						trace("TEXT " + setDepartmentNameFromAd);
						setTextInfos();
					}


					//trace ("LAYOUT : " + ad.LAYOUT);
					if (!isNaN(SingleAdViewer.saveSetTextColor))
					{
						updateTextFromViewerInit=SingleAdViewer.saveSetTextColor;

						try
						{
							ad.settextColor(updateTextFromViewerInit);
						}
						catch (error:Error)
						{
						}
					}

					else if (isNaN(SingleAdViewer.saveSetTextColor))
					{
						try
						{
							ad.settextColor(SamleannonseTemplate.setAddedPageLogoColor);							
						}
						catch (error:Error)
						{
						}

					}


				}
			}
		}




		//TEXT CHANGED LISTENER
		private function updateBoligTextField(e:Event=null):void
		{

		}

		//FOCUS IN LISTENER
		private function setAlphaToTextfield(e:Event=null):void
		{
			//trace ("FOCUS IN " + e.target.text + e.target.name);

		}

		//FOCUS OUT TEXTFIELD
		private function updateSelected(e:Event=null):void
		{

		}
		override protected function getAdViewerClass():Class
		{
			return SingleAdViewer;
		}


		override protected function doStuffAfterElementsAdded():void
		{

			super.doStuffAfterElementsAdded();

		}


		public function px(mm:Number):Number
		{
			var px:Number=SizingTools.mmToPoint(mm);
			return px;
		}


		//**********************************************************//
		//	layout elements creation								//
		//**********************************************************//
		override protected function initLayoutElementFactoryClass():void
		{
			layoutElementFactory=new LayoutElementFactory_parade(this);
		}



		private var _CompAdType:String;
		private  function set setCompAdType(value:String):void
		{
			
			_CompAdType=value;
		}
		
		private function get setCompAdType():String
		{
				return _CompAdType;
		}

		public function setBottom(cat:CompositeAdType):void
		{

			setCompAdType=cat.Name;
			setCompAdTypeFunct(setCompAdType);
		}

		public static var setcompTypeInit:Number=0;

		public function setCompAdTypeFunct(adType:String):void
		{
			if (adType == "Helsida (245x360) - HOUSEBOOK")
			{
				setcompTypeInit=1;

				setObjectProps(pluggPicture, mm(241), mm(46), mm(2), mm(2));
				setObjectProps(gr_logo_1, mm(245), NaN, -2, -2); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(245), NaN, -2, -2); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(245), NaN, -2, -2); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode	

				housebook.setTextStyle("GN_B16_BC");
				kontor.setTextStyle("GN_B9_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(4) - 4, true, NaN, mm(229) + 2.5);
				setObjectProps(kontor, NaN, NaN, NaN, mm(40), true, NaN, mm(229));

				setPlugg(saveSetPlugg);
			}


			else if (adType == "Helsida 12-mod (245x360) - HOUSEBOOK")
			{
				setcompTypeInit=2001;

				setObjectProps(pluggPicture, mm(241), mm(46), mm(2), mm(2));
				setObjectProps(gr_logo_1, mm(245), NaN, -2, -2); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(245), NaN, -2, -2); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(245), NaN, -2, -2); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode	

				housebook.setTextStyle("GN_B16_BC");
				kontor.setTextStyle("GN_B9_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(4) - 4, true, NaN, mm(229) + 2.5);
				setObjectProps(kontor, NaN, NaN, NaN, mm(40), true, NaN, mm(229));

				setPlugg(saveSetPlugg);
			}


			else if (adType == "Halvsida (248x178) - HOUSEBOOK")
			{
				setcompTypeInit=2;

				setObjectProps(pluggPicture, mm(118), mm(23.5), NaN, mm(2), true, NaN, mm(244));
				setObjectProps(gr_logo_1, mm(120), NaN, mm(3) - 1, mm(1) - 1); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(120), NaN, mm(3) - 1, mm(1) - 1); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(120), NaN, mm(3) - 1, mm(1) - 1); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B7_BC");
				kontor2.setTextStyle("GN_B7_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(4) - 4, true, NaN, mm(116) - 2);
				setObjectProps(kontor2, NaN, NaN, mm(21), mm(20) - 1);

				setPlugg(saveSetPlugg);
			}

			else if (adType == "Kvartsida liggande (248x88) - HOUSEBOOK")
			{
				setcompTypeInit=3;

				setObjectProps(gr_logo_1, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor3.setTextStyle("GN_B7_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(59) - 2);
				setObjectProps(kontor3, NaN, NaN, mm(63) + 3, mm(4) - 1);

				setPlugg(-1);
			}

			else if (adType == "Kvartsida stående (122x178) - HOUSEBOOK")
			{
				setcompTypeInit=4;
				setObjectProps(gr_logo_1, mm(120), NaN, mm(1) - 1, mm(1) - 1); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(120), NaN, mm(1) - 1, mm(1) - 1); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(120), NaN, mm(1) - 1, mm(1) - 1); //set size for layoutmode

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B7_BC");
				kontor4.setTextStyle("GN_B7_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(4) - 4, true, NaN, mm(114) - 2);
				setObjectProps(kontor4, NaN, NaN, mm(19), mm(20) - 1);

				setPlugg(-1);
			}

			else if (adType == "1/8-sida - HOUSEBOOK")
			{
				setcompTypeInit=5;

				setObjectProps(gr_logo_1, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(57.75), NaN, mm(3.5) - 0.5, mm(1.5) - 0.5); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor5.setTextStyle("GN_B7_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(57) - 2);
				setObjectProps(kontor5, NaN, NaN, mm(61) + 3, mm(4) - 1);

				setPlugg(-1);
			}


			else if (adType == "1/8-sida (184x95) - HOUSEBOOK")
			{
				setcompTypeInit=6;

				setObjectProps(gr_logo_1, mm(87) + 1, NaN, mm(3) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(87) + 1, NaN, mm(3) - 0.5, mm(1.5) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(87) + 1, NaN, mm(3) - 0.5, mm(1.5) - 0.5); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor6.setTextStyle("GN_B7_MC");

				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(87) + 1);
				setObjectProps(kontor6, NaN, NaN, mm(95) - 2, mm(8));

				setPlugg(-1);
			}


			else if (adType == "Kvartsida stående (137x195) - HOUSEBOOK")
			{
				setcompTypeInit=7;

				setObjectProps(gr_logo_1, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor4.setTextStyle("GN_B7_MC");
				kontor4.maxTextWidth=mm(108);
				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(59) - 2);
				setObjectProps(kontor4, NaN, NaN, mm(21), mm(25) - 1);

				setPlugg(-1);
			}

			else if (adType == "Kvartsida liggande (278x95) - HOUSEBOOK")
			{
				setcompTypeInit=7;

				setObjectProps(gr_logo_1, mm(65) + 1, NaN, mm(3) + 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(65), NaN, mm(3) + 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(65), NaN, mm(3) + 1, mm(1) - 0.5); //set size for layoutmode	

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor7.setTextStyle("GN_B7_MC");
				kontor7.maxTextWidth=mm(200);
				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(64));
				setObjectProps(kontor7, NaN, NaN, mm(72), mm(8) - 1);

				setPlugg(-1);
			}


			else if (adType == "3/4 sida (137x279) - HOUSEBOOK")
			{
				setcompTypeInit=8;

				setObjectProps(gr_logo_1, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(134) + 2, NaN, mm(1) - 1, mm(1) - 0.5); //set size for layoutmode		

				setOmslag(saveSetOmslag); //set colormode

				housebook.setTextStyle("GN_B4_BC");
				kontor4.setTextStyle("GN_B7_MC");
				kontor4.maxTextWidth=mm(108);
				setObjectProps(housebook, NaN, NaN, NaN, mm(2) - 1.5, true, NaN, mm(59) - 2);
				setObjectProps(kontor4, NaN, NaN, mm(21), mm(25) - 1);

				setPlugg(-1);
				trace("KPKPKPKPK");
			}
			else if (setCompAdType=="Helsida 12-modul, bilaga"||setCompAdType=="Helsida 9-modul, bilaga") {
			
				setOmslag(saveSetOmslag);
				
				setObjectProps(pluggPicture, mm(241), mm(46), mm(2), height-mm(2+46));
				kontorPlugg.visible=kontorPlugg2.visible=false;
				ADTYPE="Tidningsbilaga"
					
				updatedGridPosAndSize();
				
			}
			
			else if (adType == "Helsida 16-modul - HOUSEBOOK")
			{
				trace ("UUUUUUUUUUUUUUUUU");
				setcompTypeInit=9;
				
				setObjectProps(pluggPicture, mm(241), mm(46), mm(3.5), mm(3)+2);
				setObjectProps(gr_logo_1, mm(244), NaN, mm(2)-2, mm(1)); //set size for layoutmode
				setObjectProps(gr_logo_2, mm(244), NaN, mm(2)-2, mm(1)); //set size for layoutmode
				setObjectProps(gr_logo_3, mm(244), NaN, mm(2)-2, mm(1)); //set size for layoutmode		
				
				setOmslag(saveSetOmslag); //set colormode	
				
				housebook.setTextStyle("GN_B16_BC");
				kontor.setTextStyle("GN_B9_MC");
				
				setObjectProps(housebook, NaN, NaN, NaN, mm(5) - 2, true, NaN, mm(231) + 0.5);
				setObjectProps(kontor, NaN, NaN, NaN, mm(41)+2, true, NaN, mm(231)-2);
				
				setPlugg(saveSetPlugg);
			}
			
			//If not defined
			else
			{
				moveElements();
				updatedGridPosAndSize();
				imagePosition();
			}

		}


		private function moveElements():void
		{
		
			myPageNumber=myPageNumber % 2;

			trace("moveElements="+setCompAdType)

			kontor.visible=false;
			kontor2.visible=false;
			kontor3.visible=false;
			kontor4.visible=false;
			kontor5.visible=false;
			kontor6.visible=false;
			kontor7.visible=false;

			kontor.multiline=false;
			kontor2.multiline=false;
			kontor3.multiline=true;
			kontor4.multiline=false;
			kontor5.multiline=true;
			kontor6.multiline=true;
			kontor7.multiline=false;


			if (setCompAdType == "Helsida (245x360) - HOUSEBOOK")
			{
				kontor.visible=true;
				kontor.x=mm(38) - 2;
				kontor.maxTextWidth=mm(205);
				kontor.y=mm(40);
				kontor.maxLines=1;
				kontor.width=mm(205);
				
				//IF AUTOMATIC UPDATE IS NOT NEEDED, UNCOMMENT SWITCH-STATEMENT AND SET STATUS FROM FUNCTION setPageNumber
				switch (myPageNumber)
				{ 
					case (0):

						setOmslag(0); //set to invisible

						setNewPicture(savePluggSetting);
						break;

					default:
						if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
						{
							setOmslag(saveSetOmslag); //set colormode
						}
						else
						{
							setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
						}
						break;
				}

			}


			else if (setCompAdType == "Helsida 12-mod (245x360) - HOUSEBOOK")
			{
				kontor.visible=true;
				kontor.x=mm(38) - 2;
				kontor.maxTextWidth=mm(205);
				kontor.y=mm(40);
				kontor.maxLines=1;
				kontor.width=mm(205);
				
				//IF AUTOMATIC UPDATE IS NOT NEEDED, UNCOMMENT SWITCH-STATEMENT AND SET STATUS FROM FUNCTION setPageNumber
				switch (myPageNumber)
				{ 
					case (0):

						setOmslag(0); //set to invisible

						setNewPicture(savePluggSetting);
						break;

					default:
						if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
						{
							setOmslag(saveSetOmslag); //set colormode
						}
						else
						{
							setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
						}
						break;
				}

			}

			else if (setCompAdType == "Halvsida (248x178) - HOUSEBOOK")
			{
				kontor2.visible=true;
				kontor2.x=mm(21);
				kontor2.maxTextWidth=mm(101);
				kontor2.y=mm(20) - 1;
				kontor2.maxLines=1;
				kontor2.width=mm(101);

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				setNewPicture(savePluggSetting);
			}

			else if (setCompAdType == "Kvartsida liggande (248x88) - HOUSEBOOK")
			{

				kontor3.x=mm(63) + 3;
				kontor3.maxTextWidth=mm(120);
				kontor3.y=mm(4) - 1;
				kontor3.maxLines=2;
				kontor3.width=mm(120);
				kontor3.bottomY=28.33;

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor3.visible=true;

			}

			else if (setCompAdType == "Kvartsida stående (122x178) - HOUSEBOOK")
			{

				kontor4.x=mm(19);
				kontor4.maxTextWidth=mm(101);
				kontor4.y=mm(20) - 1;
				kontor4.maxLines=1;
				kontor4.width=mm(101);

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor4.visible=true;

			}

			else if (setCompAdType == "1/8-sida - HOUSEBOOK")
			{
				kontor5.x=mm(61) + 3;
				kontor5.y=mm(4) - 1;
				kontor5.maxLines=2;
				kontor5.width=mm(56);
				kontor5.bottomY=28.33;

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor5.visible=true;

			}


			else if (setCompAdType == "1/8-sida (184x95) - HOUSEBOOK")
			{
				trace("YOYOYOYOYO");
				kontor6.x=mm(95) - 2;
				kontor6.y=mm(8);
				kontor6.maxLines=2;
				kontor6.width=mm(86);

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor6.visible=true;
			}


			else if (setCompAdType == "Kvartsida stående (137x195) - HOUSEBOOK")
			{

				kontor4.x=mm(21);
				kontor4.maxTextWidth=mm(108);
				kontor4.y=mm(25) - 1;
				kontor4.width=mm(108);

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor4.visible=true;
			}


			else if (setCompAdType == "Kvartsida liggande (278x95) - HOUSEBOOK")
			{

				kontor7.x=mm(72);
				kontor7.maxTextWidth=mm(200);
				kontor7.y=mm(8) - 1;

				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor7.visible=true;
			}

			else if (setCompAdType == "3/4 sida (137x279) - HOUSEBOOK")
			{
				
				if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
				{
					setOmslag(saveSetOmslag); //set colormode
				}
				else
				{
					setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
				}

				pluggPicture.visible=false;
				kontor4.visible=true;
				kontor4.x=mm(21);
				kontor4.maxTextWidth=mm(108);
				kontor4.y=mm(25) - 1;
			}
			else if (setCompAdType=="Helsida 12-modul, bilaga"||setCompAdType=="Helsida 9-modul, bilaga")  {

				setOmslag(0);
				pluggPicture.visible=true;
				pluggPicture.width=mm(241);
				
				pluggPicture.x=mm(2)
					
			}

			
			else if (setCompAdType == "Helsida 16-modul - HOUSEBOOK")
			{
				kontor.visible=true;
				kontor.x=mm(38) - 2;
				kontor.maxTextWidth=mm(205);
				kontor.y=mm(40);
				kontor.maxLines=1;
				kontor.width=mm(205);
				
				switch (myPageNumber)
				{ //IF AUTOMATIC UPDATE IS NOT NEEDED, UNCOMMENT SWITCH-STATEMENT AND SET STATUS FROM FUNCTION setPageNumber
					case (0):
						
						setOmslag(0); //set to invisible
						
						setNewPicture(savePluggSetting);
						break;
					
					default:
						if (isNaN(SamleannonseTemplate.setAddedPageLogoColor))
						{
							setOmslag(saveSetOmslag); //set colormode
						}
						else
						{
							setOmslag(SamleannonseTemplate.setAddedPageLogoColor);
						}
						break;
				}
				
			}


		}


		override protected function updatedGridPosAndSize():void
		{

			super.updatedGridPosAndSize();
			trace ("setCompAdType updatedGridPosAndSize " + setCompAdType)
			
			if (setCompAdType == "Helsida (245x360) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(241);
			}

			else if (setCompAdType == "Helsida 12-mod (245x360) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(241);
			}

			else if (setCompAdType == "Halvsida (248x178) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(4);
				mainGridLayout.width=mm(240);
			}

			else if (setCompAdType == "Kvartsida liggande (248x88) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(4);
				mainGridLayout.width=mm(240);
			}

			else if (setCompAdType == "Kvartsida stående (122x178) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(118);
			}

			else if (setCompAdType == "1/8-sida - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(118);
			}


			else if (setCompAdType == "1/8-sida (184x95) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(3);
				mainGridLayout.width=mm(178);
			}

			else if (setCompAdType == "Kvartsida stående (137x195) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(133);
			}

			else if (setCompAdType == "Kvartsida liggande (278x95) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(4);
				mainGridLayout.width=mm(270);
			}

			else if (setCompAdType == "3/4 sida (137x279) - HOUSEBOOK")
			{
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(133);
			}
			else if (setCompAdType=="Helsida 12-modul, bilaga"||setCompAdType=="Helsida 9-modul, bilaga") 
			{
				trace("SET GRIDLAYOUT")
				mainGridLayout.x=mm(2);
				mainGridLayout.width=mm(241);
				mainGridLayout.y=mm(2);
				
			}

			if (setCompAdType == "Helsida 16-modul - HOUSEBOOK")
			{
				mainGridLayout.x=mm(4);
				mainGridLayout.width=mm(240);
			}

			mainGridLayout.forceUpdateLayout();

			//need to update status				
			moveElements();
		}


		private var setDepartmentNameFromAd:String="SÄTT IN ANNONS";
		private var setDepartmentPhoneFromAd:String="SÄTT IN ANNONS";

		public function setTextInfos():void
		{

			//HEADING
			housebook.text="HOME OF HOUSEBOOK"

			kontor.multiline=false;
			kontor.text="TEL: " + setDepartmentPhoneFromAd + " / LÄS MER OM VÅR ÖPPNA BUDGIVNING PÅ MAKLARHUSET.SE / LÅT DIG INSPIRERAS PÅ HOUSEBOOK.SE"

			kontor2.multiline=false;
			kontor2.text=setDepartmentNameFromAd + " / TEL: " + setDepartmentPhoneFromAd + " / MAKLARHUSET.SE";

			kontor3.multiline=true;
			kontor3.text=setDepartmentNameFromAd + "\rTEL: " + setDepartmentPhoneFromAd + " / MAKLARHUSET.SE";

			kontor4.multiline=false;
			kontor4.text=setDepartmentNameFromAd + " / TEL: " + setDepartmentPhoneFromAd + " / MAKLARHUSET.SE";

			kontor5.multiline=true;
			kontor5.text=setDepartmentNameFromAd + " / TEL: " + setDepartmentPhoneFromAd + " / LÄS MER OM\rVÅR ÖPPNA BUDGIVNING PÅ MAKLARHUSET.SE";

			kontor6.multiline=true;
			kontor6.text=setDepartmentNameFromAd + " / TEL: " + setDepartmentPhoneFromAd + "\rLÄS MER OM VÅR ÖPPNA BUDGIVNING PÅ MAKLARHUSET.SE";

			kontor7.multiline=false;
			kontor7.text=setDepartmentNameFromAd + " / TEL: " + setDepartmentPhoneFromAd + " / LÄS MER OM VÅR ÖPPNA BUDGIVNING PÅ MAKLARHUSET.SE";

			kontorPlugg.text=setDepartmentNameFromAd + ":"
			kontorPlugg2.text=setDepartmentPhoneFromAd + ", www.maklarhuset.se"

		}
		
		public function setSubtitleSize(style:String):void
		{
			kontor.setTextStyle(style);
			kontor2.setTextStyle(style);
			kontor3.setTextStyle(style);
			kontor4.setTextStyle(style);
			kontor5.setTextStyle(style);
			kontor6.setTextStyle(style);
			kontor7.setTextStyle(style);
		}
		
		public function getSubtitleSize():String
		{
			var k:Array = [kontor, kontor2, kontor3, kontor4, kontor5, kontor6, kontor7];
			for (var i:int = 0; i < k.length; i++) {
				if ((k[i] as PtPTextFieldWarning).visible)
					return (k[i] as PtPTextFieldWarning).getTextStyle();
			}
			
		return "";
		}


		//OTHER
		override public function putDefaultContent():void
		{

			super.putDefaultContent();

			setTextInfos();

			// use context menu for editing pluggpicture
			contextMenu=createAnnonseContextMenu();
			contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, function():void
			{
				updateAnnonseContextMenu();
			});


			cat=(_myTemplate as CompositeAdTemplate).getCompositeAdType();
			setSizeAndLayoutFromCAT();

		}



		private function updateAnnonseContextMenu():void
		{
			var myCM:ContextMenu=contextMenu
			var cmi:ContextMenuItem;

			if ((setcompTypeInit == 1 && myPageNumber % 2 == 0) || (setcompTypeInit == 2001 && myPageNumber % 2 == 0) || (setcompTypeInit == 2))
			{
				// called every time user context clicks. Rebuilds to ensure current parameters are used.

				// jiggery pokery to handle scoping. Referene to contextMenuItem in dictionary seems to be the only solution
				var cmiDict:Dictionary=new Dictionary;
				var selFunction:Function=function(e:ContextMenuEvent=null):void
				{
					setNewPicture(cmiDict[e.target]);
					//trace ("CMIDICT " + cmiDict[e.target])
				}
				myCM.customItems=[];
				myCM.customItems.push(new ContextMenuItem("PLUGG: ", false, false));

				var alt:Array=["Visa", "Visa inte"];
				for (var i:int=0; i < alt.length; i++)
				{
					cmi=new ContextMenuItem(alt[i]);
					cmiDict[cmi]=i + 1;
					cmi.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, selFunction);
					myCM.customItems.push(cmi)
				}
			}

			else
				myCM.customItems.splice(0);


		}

		private var savePluggSetting:Number;

		private function setNewPicture(setting:Number):void
		{

			if (isNaN(setting))
			{
				savePluggSetting=0
			}
			else
				savePluggSetting=setting;


			switch (savePluggSetting)
			{
				case 1:
					pluggPicture.visible=true;
					break;

				case 2:
					pluggPicture.visible=false;
					break;

				default:
					break;
			}



		}



		// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// 				Context menu handling
		// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		private function createAnnonseContextMenu(e:ContextMenuEvent=null):ContextMenu
		{
			// allow user to set ad parameters by contextmenu if part of a composite Ad.
			var myCM:ContextMenu=new ContextMenu()
			myCM.hideBuiltInItems()
			return myCM
		}




		private var saveSetOmslag:Number;

		public function setOmslag(n:Number):void
		{
		

			if ((saveSetLogoFarge != 1000) && isNaN(saveSetOmslag))
			{
				n=saveSetLogoFarge
			}


			if (isNaN(n))
				n=1;
			if (n != 0)
			{
				saveSetOmslag=saveSetLogoFarge=n
			}
			;

			gr_logo_1.visible=false;
			gr_logo_2.visible=false;
			gr_logo_3.visible=false;

			housebook.visible=false;
			kontor.visible=kontor2.visible=kontor3.visible=kontor4.visible=kontor5.visible=kontor6.visible=kontor7.visible=false;

			pluggPicture.visible=true;

			trace("KONTOR"+setCompAdType);

			if (setCompAdType == "Helsida (245x360) - HOUSEBOOK")
			{

				housebook.visible=true;
				kontor.visible=true;

				pluggPicture.visible=false;

				if (myPageNumber % 2 != 0)
				{
					switch (n)
					{
						case 1:
							gr_logo_1.visible=true;
							break;

						case 2:
							gr_logo_2.visible=true;
							break;

						case 3:
							gr_logo_3.visible=true;
							break;


						default:
							break;

					}
				}
				else
				{
					pluggPicture.visible=true;
					housebook.visible=false;
					kontor.visible=false;
				}



			}

			else if (setCompAdType == "Helsida 12-mod (245x360) - HOUSEBOOK")
			{

				housebook.visible=true;
				kontor.visible=true;

				pluggPicture.visible=false;

				if (myPageNumber % 2 != 0)
				{
					switch (n)
					{
						case 1:
							gr_logo_1.visible=true;
							break;

						case 2:
							gr_logo_2.visible=true;
							break;

						case 3:
							gr_logo_3.visible=true;
							break;


						default:
							break;

					}
				}
				else if  (setCompAdType=="Helsida 12-modul, bilaga"||setCompAdType=="Helsida 9-modul, bilaga") 	
				{
					pluggPicture.visible=true;
					housebook.visible=false;
					kontor.visible=false;
					gr_logo_3.visible=gr_logo_2.visible=gr_logo_1.visible=false;
				}
				else
				{
					pluggPicture.visible=true;
					housebook.visible=false;
					kontor.visible=false;
				}
			}

			else if (setCompAdType == "Halvsida (248x178) - HOUSEBOOK")
			{

				housebook.visible=true;
				kontor2.visible=true;

				pluggPicture.visible=true;


				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;

					case 2:
						gr_logo_2.visible=true;
						break;

					case 3:
						gr_logo_3.visible=true;
						break;


					default:
						pluggPicture.visible=true;
						housebook.visible=false;
						kontor2.visible=false;
						break;

				}
			}


			else if (setCompAdType == "Helsida 16-modul - HOUSEBOOK")
			{
			trace ("KOKOKOKOKOKOKOKOK " + n);	
				housebook.visible=true;
				kontor.visible=true;
				
				pluggPicture.visible=false;
				
				if (myPageNumber % 2 != 0)
				{
					switch (n)
					{
						case 1:
							gr_logo_1.visible=true;
							break;
						
						case 2:
							gr_logo_2.visible=true;
							break;
						
						case 3:
							gr_logo_3.visible=true;
							break;
						
						
						default:
							break;
						
					}
				}
				else
				{
					pluggPicture.visible=true;
					housebook.visible=false;
					kontor.visible=false;
				}
			}
			
			

			else
			{

				pluggPicture.visible=false;

				trace("COMPTYPE " + setCompAdType);
				if (setCompAdType == "Kvartsida liggande (248x88) - HOUSEBOOK")
				{
					kontor3.visible=true;
				}

				else if (setCompAdType == "Kvartsida stående (122x178) - HOUSEBOOK")
				{
					kontor4.visible=true;
				}

				else if (setCompAdType == "1/8-sida - HOUSEBOOK")
				{
					kontor5.visible=true;
				}

				else if (setCompAdType == "1/8-sida (184x95) - HOUSEBOOK")
				{
					kontor6.visible=true;
				}

				else if (setCompAdType == "Kvartsida liggande (278x95) - HOUSEBOOK")
				{
					kontor7.visible=true;
				}

				else if (setCompAdType == "Kvartsida stående (137x195) - HOUSEBOOK")
				{
					kontor4.visible=true;
				}

				else if (setCompAdType == "3/4 sida (137x279) - HOUSEBOOK")
				{
					kontor4.visible=true;
				}

				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;

					case 2:
						gr_logo_2.visible=true;
						break;

					case 3:
						gr_logo_3.visible=true;
						break;


					default:
						break;

				}
			}



		}




		private var saveSetLogoFarge:Number=1000;

		public function setLogoFarge(n:Number):void
		{

			if (isNaN(n))
				n=1;
				
			if (n != 0)
			{
				saveSetOmslag=saveSetLogoFarge=n
			};

			gr_logo_1.visible=false;
			gr_logo_2.visible=false;
			gr_logo_3.visible=false;

			housebook.visible=false;
			kontor.visible=false;

			pluggPicture.visible=true;



			if ((myPageNumber % 2 != 0) && (setCompAdType == "Helsida (245x360) - HOUSEBOOK"))
			{

				housebook.visible=true;
				kontor.visible=true;

				pluggPicture.visible=false;

				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;

					case 2:
						gr_logo_2.visible=true;
						break;

					case 3:
						gr_logo_3.visible=true;
						break;


					default:
						pluggPicture.visible=true;
						housebook.visible=false;
						kontor.visible=false;
						break;

				}
			}

			else if ((myPageNumber % 2 != 0) && (setCompAdType == "Helsida 12-mod (245x360) - HOUSEBOOK"))
			{

				housebook.visible=true;
				kontor.visible=true;

				pluggPicture.visible=false;

				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;

					case 2:
						gr_logo_2.visible=true;
						break;

					case 3:
						gr_logo_3.visible=true;
						break;


					default:
						pluggPicture.visible=true;
						housebook.visible=false;
						kontor.visible=false;
						break;

				}
			}

			
			else if ((myPageNumber % 2 != 0) && (setCompAdType == "Helsida 16-modul - HOUSEBOOK"))
			{
				trace ("NNNN " + n);
				housebook.visible=true;
				kontor.visible=true;
				
				pluggPicture.visible=false;
				
				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;
					
					case 2:
						gr_logo_2.visible=true;
						break;
					
					case 3:
						gr_logo_3.visible=true;
						break;
					
					
					default:
						pluggPicture.visible=true;
						housebook.visible=false;
						kontor.visible=false;
						break;
					
				}
			}

			else if ((setCompAdType != "Helsida (245x360) - HOUSEBOOK") || (setCompAdType != "Helsida 12-mod (245x360) - HOUSEBOOK") || (setCompAdType != "Helsida 16-modul - HOUSEBOOK"))
			{

				housebook.visible=true;
				kontor.visible=true;

				pluggPicture.visible=true;


				switch (n)
				{
					case 1:
						gr_logo_1.visible=true;
						break;

					case 2:
						gr_logo_2.visible=true;
						break;

					case 3:
						gr_logo_3.visible=true;
						break;


					default:
						pluggPicture.visible=true;
						housebook.visible=false;
						kontor.visible=false;
						break;

				}
			}

		}



		private var saveSetPlugg:Number;

		public function setPlugg(n:Number):void
		{

			if (n != -1)
			{
				saveSetPlugg=n
			}
			;

			helsidePluggCover.visible=false;
			gr_fullPlugg1.visible=false;
			gr_fullPlugg2.visible=false;
			gr_fullPlugg3.visible=false;
			gr_halvPlugg1.visible=false;
			gr_halvPlugg2.visible=false;
			gr_halvPlugg3.visible=false;

			kontorPlugg.visible=false;
			kontorPlugg2.visible=false;

			myGrid.visible=true;
		
			
			//default sizes
			gr_fullPlugg1.x = mm(2);
			gr_fullPlugg1.y = mm(3);
			gr_fullPlugg1.width = mm(241);
			
			gr_fullPlugg2.x = mm(2);
			gr_fullPlugg2.y = mm(3);
			gr_fullPlugg2.width = mm(241);
					
			gr_fullPlugg3.x = mm(0);
			gr_fullPlugg3.y = mm(0);
			gr_fullPlugg3.width = mm(245);
			
			
			if (setCompAdType == "Helsida (245x360) - HOUSEBOOK")
			{

				switch (n)
				{

					case 1:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg1.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(14);
						kontorPlugg.y=mm(340) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_R10_BC");
						kontorPlugg2.setTextStyle("GN_R10_LC");
						break;

					case 2:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg2.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(14) + 1.5;
						kontorPlugg.y=mm(340) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_L10_BC");
						kontorPlugg2.setTextStyle("GN_L10_LC");

						break;

					case 3:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg3.visible=true;

						break;

					default:
						break;

				}
				;

			}


			else if (setCompAdType == "Helsida 12-mod (245x360) - HOUSEBOOK")
			{
				switch (n)
				{

					case 1:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg1.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(14);
						kontorPlugg.y=mm(340) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_R10_BC");
						kontorPlugg2.setTextStyle("GN_R10_LC");
						break;

					case 2:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg2.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(14) + 1.5;
						kontorPlugg.y=mm(340) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_L10_BC");
						kontorPlugg2.setTextStyle("GN_L10_LC");

						break;

					case 3:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(245), mm(360), 0, 0);
						gr_fullPlugg3.visible=true;
	
						break;

					default:
						break;

				}
				;

			}


			else if (setCompAdType == "Halvsida (248x178) - HOUSEBOOK")
			{

				switch (n)
				{

					case 1:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(178), 0, 0);
						gr_halvPlugg1.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(15) + 0.5;
						kontorPlugg.y=mm(161) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_R10_BC");
						kontorPlugg2.setTextStyle("GN_R10_LC");
						break;

					case 2:
						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(178), 0, 0);
						gr_halvPlugg2.visible=true;

						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(15) + 0.5;
						kontorPlugg.y=mm(161) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;

						kontorPlugg.setTextStyle("GN_L10_BC");
						kontorPlugg2.setTextStyle("GN_L10_LC");
						break;

					case 3:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(178), 0, 0);
						gr_halvPlugg3.visible=true;
						break;

					default:
						break;

				}
				;

			}
			
			
			if (setCompAdType == "Helsida 16-modul - HOUSEBOOK")
			{
				
				switch (n)
				{
					
					case 1:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(355), 0, 0);
						gr_fullPlugg1.visible=true;
						
						gr_fullPlugg1.x = mm(3.5);
						gr_fullPlugg1.y = mm(0);
						gr_fullPlugg1.width = mm(241);
						
						
						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(15.5);
						kontorPlugg.y=mm(337) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;
						
						kontorPlugg.setTextStyle("GN_R10_BC");
						kontorPlugg2.setTextStyle("GN_R10_LC");
						break;
					
					case 2:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(355), 0, 0);
						gr_fullPlugg2.visible=true;
						
						gr_fullPlugg2.x = mm(3.5);
						gr_fullPlugg2.y = mm(0);
						gr_fullPlugg2.width = mm(241);
						
						kontorPlugg.visible=true;
						kontorPlugg2.visible=true;
						kontorPlugg.x=mm(15.5) + 1.5;
						kontorPlugg.y=mm(337) + 1;
						kontorPlugg2.x=kontorPlugg2.rightX - 3;
						kontorPlugg2.y=kontorPlugg.y;
						
						kontorPlugg.setTextStyle("GN_L10_BC");
						kontorPlugg2.setTextStyle("GN_L10_LC");
						
						break;
					
					case 3:
						myGrid.visible=false;
						setObjectProps(helsidePluggCover, mm(248), mm(355), 0, 0);
						gr_fullPlugg3.visible=true;
						
						gr_fullPlugg3.x = mm(4);
						gr_fullPlugg3.y = mm(1);
						gr_fullPlugg3.width = mm(240);
			
					break;
					
					default:
						break;
					
				}
				;	
			}			

		}





		public function setObjectProps(name:Object, width:Number, height:Number, x:Number, y:Number, visible:Boolean=true, bottomY:Number=NaN, rightX:Number=NaN):void
		{

			name=name;
			name.width=width;
			name.height=height;
			name.x=x;
			name.y=y;
			name.visible=visible;

			if (!isNaN(bottomY))
			{
				name.bottomY=bottomY
			};
			
			if (!isNaN(rightX))
			{
				name.rightX=rightX
			};

		}




		override public function setSizeAndLayoutFromCAT():void
		{
			super.setSizeAndLayoutFromCAT();

			cat=(_myTemplate as CompositeAdTemplate).getCompositeAdType();
			setBottom(cat);
			updatedGridPosAndSize();
		}



		public function getPublicAttr(key:String, formatting:String=null):String
		{
			return super.getAttr(key, formatting);
		}


		override public function getAddMenu():Array
		{
			return [{textStyles: [], other: [PtPImage.TYPE]}];
		}


		override protected function getAdGrid():GridLayout
		{
			return myGrid
		}


		//SETTING STATUS FROM PAGENUMBER
		private var myPageNumber:int;

		override public function setPageNumber(n:Number, totalNumPages:Number=NaN):void
		{
			super.setPageNumber(n, totalNumPages);
			myPageNumber=n;

			moveElements();
			myGrid.addEventListener(BaseLayout.NUM_ELEMENTS_CHANGE, updateTextFromViewerListener);
			myGrid.addEventListener(SingleAdViewer.LOAD_COMPLETE, updateTextFromViewerListener);

		}



		override protected function getExportDataCustom(ret:Object):Object
		{
			ret=super.getExportDataCustom(ret);


			if ((isNaN(SamleannonseTemplate.setAddedPageLogoColor)) && (saveSetLogoFarge == 1000))
			{
				ret.saveSetOmslag=saveSetOmslag;
			}
			else if (saveSetLogoFarge == 1000)
			{
				ret.saveSetOmslag=SamleannonseTemplate.setAddedPageLogoColor;
			}

			//trace (" saveSetLogoFarge " + saveSetLogoFarge);
			ret.saveSetOmslag=saveSetOmslag;

			ret.savePluggSetting=savePluggSetting;

			ret.saveSetPlugg=saveSetPlugg; //for helsidesplugger

			ret.setCompAdType=setCompAdType;

			ret.saveSetLogoFarge=saveSetLogoFarge;

			return ret;

		}





		override protected function putImportDataCustom(dataIn:Object):void
		{

			super.putImportDataCustom(dataIn);

			// use context menu for editing pluggpicture
			contextMenu=createAnnonseContextMenu();
			contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, function():void
			{
				updateAnnonseContextMenu();
			});


			setNewPicture(dataIn.savePluggSetting);

			setPlugg(dataIn.saveSetPlugg); //for helsidesplugger

			setCompAdType=dataIn.setCompAdType;
			setCompAdTypeFunct(setCompAdType);
			
			//not set from menu
			if (dataIn.saveSetLogoFarge == 1000)
			{ 
				SamleannonseTemplate.setAddedPageLogoColor=dataIn.saveSetOmslag;
				setOmslag(dataIn.saveSetOmslag);
					//trace ("DATA IN  " + dataIn.saveSetOmslag);
			}
			else
			{
				setLogoFarge(dataIn.saveSetLogoFarge);
			}

		}

	}
}
