//등록
$(document).ready(function(){

	$("#updateDiv").hide(); 
	
});


$('#searchIdBtn').on("click", function() {
	$("#updateDiv").hide(); 
	$('#resultDiv').empty();
 	
 	if(!$('#searchId').val()) {
 		alert("아이디를 입력하세요");
    	return;
 	} 
 	
   	$.ajax({
       	type: 'post',
       	url : '/user/getUser',
       	data: {
       		'searchId' : $('#searchId').val()
       },
       	dataType: 'json',
       	success : function(data) {
       		
       		if(!data){
				$('#resultDiv').text("찾고자 하는 아이디가 없습니다.");
			} else {
				$('#name').val(data.name);
	       		$('#id').val(data.id);
	       		$('#pwd').val(data.pwd);
	       		
	       		$("#updateDiv").show();	   
				
			}
       		 
       	},
       	error : function(err) {
       		$('#resultDiv').text("찾고자 하는 아이디가 없습니다.");
       		
       	}
    });



});



$('#deleteBtn').on("click", function() {
	
	if(confirm("정말로 삭제하시겠습니까?")) {
		
		$.ajax({
			type: 'post',
			url : '/user/delete',
			data: $('#deleteForm').serialize(),
			success : function() {
				alert("회원삭제가 완료되었습니다!");
				location.href="/user/list";
			},
			error : function(err) {
				console.log(err);
	
			}
		});

	}
	



});


$('#resetBtn').on("click", function() {

	$('#searchIdBtn').trigger('click');

});


