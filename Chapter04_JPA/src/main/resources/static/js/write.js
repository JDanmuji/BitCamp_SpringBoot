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
        
        
        console.log($('#writeForm').serialize());
        
        $.ajax({
        	type: 'post',
        	url : '/user/write',
        	data: $('#writeForm').serialize(), //문자열 'name=홍길동&id=...'
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
			 if(data == 'exist') {
				 $('#idDiv').text('사용 불가능');
				 $('#idDiv').css('color', 'red');
			 } else if(data == 'non_exist' ){
				 $('#idDiv').text('사용 가능');
				 $('#idDiv').css('color', 'blue');
			 } 
			   
       	},
       	error : function(err) {
       		console.log(err);
       	}
    });



});


