

function jsonCall(url, data, selectorId){
	$.ajax({
		type: "POST",
		url: url,
		data: data,
		dataType: "json",
		async: false,
		beforeSend: function(xhr){
			
		},
		success: function(data){
			var html = data;
			alert(data);
			if(data){
				$(selectorId).html(html);
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			
		}
	});
}