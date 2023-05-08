//등록
$(document).ready(function(){

	

        $.ajax({
        	type: 'post',
        	url : '/person/getUserList',
        	data : {
        		"pg" : $('#pg').val()
        	},
            dataType : "json",
        	success : function(data) {
        		
        		
        		console.log(data.list);
        		
        		$.each(data.list, function(index, items){
        			
        			$('<tr/>').append($('<td/>', {
        				align : 'center',
        				text : items.name		      						
        			})).append($('<td/>', {
        				align : 'center',
        				text : items.age	      						
        			})).append($('<td/>', {
        				align : 'center',
        				text : items.photo		      						
        			})).appendTo($('#userListTable'));
        			
				});
				
				$('#userListPaingDiv').html(data.pagingHTML);

        	},
        	error : function(err) {
        		console.log(err);
        	}
        });



});

function boardPaging(pg) {
	location.href = "/user/list?pg=" + pg;
}