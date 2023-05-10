//등록
$(document).ready(function(){

	

        $.ajax({
        	type: 'post',
        	url : '/user/getUserList',
        /*	data : {
        		"pg" : $('#pg').val()
        	},*/
            dataType : "json",
        	success : function(data) {
        		console.log(JSON.stringify(data));
        		
        		$.each(data, function(index, items){
        			
        			$('<tr/>').append($('<td/>', {
        				align : 'center',
        				text : items.name		      						
        			})).append($('<td/>', {
        				align : 'center',
        				text : items.id	      						
        			})).append($('<td/>', {
        				align : 'center',
        				text : items.pwd		      						
        			})).appendTo($('#userListTable tbody'));
        			
				});
				
				$('#userListPaingDiv').html(data.pagingHTML);

        	},
        	error : function(err) {
        		console.log(err);
        	}
        });



});

$('#searchBtn').click(function() {
	
	if($('#keyword').val() == '') {
		alert('검색어를 입력하세요');
		return;
	}
	
	$.ajax({
       type: 'post',
       url : '/user/search',
       data : {
		   'searchOption' : $('#searchOption').val(),
		   'keyword' : $('#keyword').val()
	   }, 
       dataType : "json",
       success : function(data) {
       	console.log(JSON.stringify(data));
       	
       	$('#userListTable tbody tr').remove();
       	$.each(data, function(index, items){
       		
       		$('<tr/>').append($('<td/>', {
       			align : 'center',
       			text : items.name		      						
       		})).append($('<td/>', {
       			align : 'center',
       			text : items.id	      						
       		})).append($('<td/>', {
       			align : 'center',
       			text : items.pwd		      						
       		})).appendTo($('#userListTable tbody'));
       		
		});
				

        },
        error : function(err) {
        		console.log(err);
   		}
   });
});

function boardPaging(pg) {
	location.href = "/user/list?pg=" + pg;
}