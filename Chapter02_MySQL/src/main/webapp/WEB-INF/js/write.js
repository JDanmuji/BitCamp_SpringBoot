//등록
$(document).ready(function(){

    $('#writeBtn').click(function () {
        
		$('#nameDiv').empty();
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		
        if(!$('#name').val()) {
            $('#nameDiv').text('name넣으삼');
            $('#name').foucs();
            return;
        }

        if(!$('#id').val()) {
            $('#idDiv').text('id넣으삼');
            $('#id').foucs();
            return;
        }

        if(!$('#pwd').val()) {
            $('#pwdDiv').text('pwd넣으삼');
            $('#pwd').foucs();
            return;
        }
        
        
        $.ajax({
        	type: 'post',
        	url : '/user/write',
        	date: $('#writeForm').serialize(),
        	success : function() {
        		alert("회원가입을 축하드립니다!");
        		location.href="/user/list";
        	},
        	error : function(err) {
        		console.log(err);
        	}
        });

    });
	
	
	
	
});


//아이디 중복체크


$('#id').focusout(function() {
 
 	console.log($('#id').val());
 	
 	if(!$('#id').val()) {
 		$('#idDiv').text('id넣으삼');
    	$('#id').foucs();
    	return;
 	} 
 	
   	$.ajax({
       	type: 'post',
       	url : '/user/isExistId',
       	data: {
       		'id' : $('#id').val()
       },
       	dataType: 'text',
       	success : function(data) {
       		console.log(data);
       	},
       	error : function(err) {
       		console.log(err);
       	}
    });



});


