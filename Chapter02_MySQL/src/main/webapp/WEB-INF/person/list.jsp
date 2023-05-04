<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2023-04-12
  Time: 오전 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<style>

html,
body {
  height: 100%;
}

body {
  margin: 0;
  background: linear-gradient(45deg, #49a09d, #5f2c82);
  font-family: sans-serif;
  font-weight: 100;
}

.container {
  position: absolute;
  top: 50px;
  left: 50px;
  
}

table {
 
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  margin: 20px;
}

th,
td {
  padding: 15px;
  background-color: rgba(255,255,255,0.2);
  color: #fff;
}

th {
  text-align: center;
}

thead {
  th {
    background-color: #55608f;
  }
}

tbody {
  tr {
    &:hover {
      background-color: rgba(255,255,255,0.3);
    }
  }
  td {
    position: relative;
    &:hover {
      &:before {
        content: "";
        position: absolute;
        left: 0;
        right: 0;
        top: -9999px;
        bottom: -9999px;
        background-color: rgba(255,255,255,0.2);
        z-index: -1;
      }
    }
  }
}

.divPaging {
	margin-top: 15px; 
	position: absolute;
	width: 850px; 
	text-align: center;
	  
}
.subjectA:link { color: black; text-decoration: none;}
.subjectA:visited { color: black; text-decoration: none;}
.subjectA:hover { color: green; text-decoration: underline;}
.subjectA:active { color: black; text-decoration: none;}

.selectBox {
	margin-top: 50px;
	position: absolute;
	width: 850px; 
	text-align: center;
	  

}

#currentDiv {
	float: left;  
	width: 20px; 
	height: 20px; 
	margin: 0 auto;
	margin-left: 5px;
}

#currentPaging{
	color: red;
	border: 1px solid red;
	padding: 5px 8px; /* top / bottom, left / right  */
	margin: 5px; /* top, right, bottom, left  */
	cursor: pointer;
}



#pagingDiv {
	float: left;  
	width: 20px; 
	height: 20px;
	margin: 0 auto; 
	margin-left: 5px;
}

#paging{
	color: black;
	padding: 5px;
	margin: 5px;
	cursor: pointer;
}


</style>
</head>
<body>
<input type="hidden" id="pg" name="pg" value="${param.pg}">
<h3>
    <a href="/">
        <img src="../image/applelogo.png" width="50" height="50"/>
    </a>목록
</h3>

<table id="userListTable" border="1" frame="hside" rules="rows">

    <tr>
        <th width="150">이름</th>
        <th width="150">나이</th>
        <th width="150">photo</th>
    </tr>

	
</table>

<div id="userListPaingDiv" style="margin-top: 15px; width: 850px; text-align: center;">
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
//등록
$(document).ready(function(){

	console.log($('#pg').val());

        $.ajax({
        	type: 'post',
        	url : '/person/getUserList',
        	data : {
        		"pg" : $('#pg').val()
        	},
            dataType : "json",
        	success : function(data) {
        		
        	/* 	$.each(data.list, function(index, items){
        			
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
        			
				}); */
				
				console.log(data.list);
				console.log(data.list);
				
				for (var i = 0; i <data.list.length; i++) {
					
					var html = `<tr>
								<td align="center">
									<img src="/storage/${data.list.photo}" width="100" height="100">
								</td>
								<td align="center">${data[i].age}</td>
								<td align="center">${data[i].photo}</td>
								</tr>`;
					
					
								console.log(html);
								$('#userListTable').append(html);
				}
				
				$('#userListPaingDiv').html(data.pagingHTML);

        	},
        	error : function(err) {
        		console.log(err);
        	}
        });



});

function boardPaging(pg) {
	location.href = "/person/list?pg=" + pg;
}
</script>
</body>
</html>
