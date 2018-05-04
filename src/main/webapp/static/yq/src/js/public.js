
$(document).ready(function(){
	{
		var obj=$('#header');
		var url=$(obj).attr('data-url');
		var curHref = getUri();
		$.get(url,function(data){
			$(obj).html(data);
			$('#header .headNav-item').each(function(){
				var liUri = $(this).attr('href');
				var indexStart= liUri.indexOf(curHref);
				if(indexStart>=0){
					if( indexStart + curHref.length  == liUri.length  ){
						$(this).addClass('active');
					}
				}
			});
		});
	}
	{
		var obj2=$('#footer');
		var url2=$(obj2).attr('data-url');
		$.get(url2,function(data){
			$(obj2).html(data);
		});
	}
	function getUri(){
		var str=location.href; 
		var num=str.indexOf("?");
		if( num >-1)
			str=str.substr(0,num);
		var num2=str.indexOf("#");
		if( num2 >-1)
			str=str.substr(0,num2);
		return str.replace(/^.*\//,"");
	}
	// function init(){	
	// }
});