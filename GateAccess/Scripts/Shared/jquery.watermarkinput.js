/*
Overview
This is a watermark input plugin for jQuery. Currently this is a beta release. This simple plugin allows forms with limited space to display additional information about the contents of a field.
Usage

First, include the watermark input javascript file.

<script src="jquery.watermarkinput.js" type="text/javascript"></script>

Next, call the watermark function for those items you wish to have watermarked.

jQuery(function($){
   $("#first").Watermark("First");
   $("#mi").Watermark("MI");
   $("#last").Watermark("Last");
   $("#suffix").Watermark("Suffix");
});

Optionally, if you are not satisfied with the default gray watermark color, you may pass a second argument to the watermark function.

jQuery(function($){
   $("#suffix").Watermark("Suffix","#369");
});

Finally, once you are ready to pull data from your watermarked input boxes, you can clear all of the watermarks and then replace them after you are finished.

function UseData(){
   $.Watermark.HideAll();
   //Do Stuff
   $.Watermark.ShowAll();
}
 */
 
(function($) {
	var map=new Array();
	$.Watermark = {
		ShowAll:function(){
			for (var i=0;i<map.length;i++){
				if(map[i].obj.val()==""){
					map[i].obj.val(map[i].text);					
					map[i].obj.css("color",map[i].WatermarkColor);
				}else{
				    map[i].obj.css("color",map[i].DefaultColor);
				}
			}
		},
		HideAll:function(){
			for (var i=0;i<map.length;i++){
				if(map[i].obj.val()==map[i].text)
					map[i].obj.val("");					
			}
		}
	}
	
	$.fn.Watermark = function(text,color) {
		if(!color)
			color="#aaa";
		return this.each(
			function(){		
				var input=$(this);
				var defaultColor=input.css("color");
				map[map.length]={text:text,obj:input,DefaultColor:defaultColor,WatermarkColor:color};
				function clearMessage(){
					if(input.val()==text)
						input.val("");
					input.css("color",defaultColor);
				}

				function insertMessage(){
					if(input.val().length==0 || input.val()==text){
						input.val(text);
						input.css("color",color);	
					}else
						input.css("color",defaultColor);				
				}

				input.focus(clearMessage);
				input.blur(insertMessage);								
				input.change(insertMessage);
				
				insertMessage();
			}
		);
	};
})(jQuery);