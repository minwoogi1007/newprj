<%@ page contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8" %>


<html>
<script type="text/javascript">
   
	
   
	function doLogin(){

		
	  if(MasterForm.USER_ID.value==""){
		  alert("ID 입력하세요");
		  document.MasterForm.USER_ID.focus();
		  return;
	  };
	  
	  MasterForm.USER_ID.value =MasterForm.USER_ID.value.toUpperCase();
	 // console.log(MasterForm.USER_ID.value);
	 // console.log(MasterForm.ID_SAVE.checked);
	  
	  if ( MasterForm.ID_SAVE.checked ) {
	//	  console.log("1");
		  saveCookie("twowin", MasterForm.USER_ID.value, 10);
		//  getCookie("twowin");
	  } else {
		//  console.log("2");
		  saveCookie("twowin", "", -1);
		//  getCookie("twowin");
	  }
	  var _url  = 'ajaxUrl.SheetAction?S_CONTROLLER=EXEC_SRC.COMM.UserSession';
	  var param = "";
	  param += "&S_METHOD=ajaxLogin"
	  param += "&SCH_ID="+MasterForm.USER_ID.value
	  param += "&SCH_PWD="+MasterForm.USER_PW.value;
	  
	  //return;
	  submitAjax('POST', _url, param, ajaxLoginCallBack);
	  
	}

		

	function ajaxLoginCallBack(http_request) {	
		
		 var result = http_request.responseText;
		 doFrame(result);
	}
		

	function doFrame(_result){
		if(_result == '-1'){
			 alert('비밀번호&아이디 확인 ');
		}else if(_result == '1'){
			//alert('로그인 성공 page move');
			doFrameOpen();
			
		}else if(_result == '2'){
			$('#result').modal("show");
		}else if(_result == '3'){
			alert('승인 거절 ');
		}
	}

	function doFrameOpen(){
		var intWidth    = parseInt(window.screen.availWidth );
		var intHeight   = parseInt(window.screen.availHeight);
		var strStatus ="";

		MasterForm.USER_ID.value =MasterForm.USER_ID.value .toUpperCase();

		
		var strOpenPage ="/EXEC_APP/MAIN/CON1000M1.jsp";
		//var strOpenPage ="/index1.jsp";
		location.href=strOpenPage;
				
		
	}


   
	function doReg() {
	alert();
		
			$('#id').on('click',function(e){
				
			//	e.preventDefault();
				$('#idModal').modal("show");
				
			});
			
		
			$('#emp').on('click',function(e){
				
			//	e.preventDefault();
				$('#empModal').modal("show");
			
			});
			
			
		
		
	}
	
	

	function doWaiting() {
		
		$('#result').modal("show");
			
	}

	function doEntKeyPress(obj) {

		   if(event.keyCode==13){
			   doLogin();
		   }
	}

	function init(){
		
		
		document.MasterForm.USER_ID.focus();
		getCookie("twowin");
		initCombo1('saup_gubn','0000');
		//showImage();
		
	}
	function saveCookie(name, str, validity){
		
		var exdate = new Date(); 
		exdate.setDate(exdate.getDate() + validity); //
		var cookie_value = escape(str) + ((validity == null) ? '' : '; expires=' + exdate.toUTCString()); 
		document.cookie = name + '=' + cookie_value; 

		//console.log();
		
	}
	
	function getCookie(str){
		//console.log(document.cookie);
		var x, y; 
		var val = document.cookie.split(';'); 
		for (var i = 0; i < val.length; i++) { 
			x = val[i].substr(0, val[i].indexOf('=')); 
			y = val[i].substr(val[i].indexOf('=') + 1); 
			x = x.replace(/^\s+|\s+$/g, ''); 		
		}
		if(x==str){
			MasterForm.USER_ID.value = y;
			MasterForm.ID_SAVE.checked =true;
			document.MasterForm.USER_PW.focus();
		}
	}
	
	
	
</script>

<body> 

 
   <form class="user" name="MasterForm" method="post">
   
   
    <div class="auth-wrapper">
        <div class="auth-content">
            <div class="auth-bg">
                <span class="r"></span>
                <span class="r s"></span>
                <span class="r s"></span>
                <span class="r"></span>
            </div>
            <div class="card">
                <div class="card-body text-center">
                    <div class="mb-4">
                        <i class="feather icon-unlock auth-icon"></i>
                    </div>
                    <h3 class="mb-4">Login</h3>
                    <div class="input-group mb-3">
                       <input class="form-control" id="USER_ID" placeholder="ID를 입력하세요">
                    </div>
                    
                    <div class="input-group mb-4">
                     <input type="password" class="form-control form-control-user"
                                                id="USER_PW" placeholder="Password" onkeypress ="doEntKeyPress(this);">
                    </div>
                    <div class="form-group text-left">
                        <div class="checkbox checkbox-fill d-inline">
                            <input type="checkbox" name="ID_SAVE"  id="ID_SAVE">
                            <label for="ID_SAVE" class="cr"> ID 저장하기</label>
                        </div>
                    </div>
                    <a href="javascript:doLogin();"  class="btn btn-primary shadow-2 mb-4" >Login</a>
                    <p class="mb-2 text-muted">임직원  <a id="id"  href="javascript:doReg()">신청</a></p>
                    <p class="mb-0 text-muted">거래처  <a id="emp" href="javascript:doReg()">신청</a></p>
                    
                    
                </div>
            </div>
        </div>
    </div>
   
   
     <!-- End of Page Wrapper -->
	 
	
    <div class="modal" id="result" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			
			<div class="modal-body">
				  <fieldset>
			    	<div class="form-group">
			    	<div class="modal-body">아이디 신청 승인대기 중입니다. <br>
			    	승인까지는 1~3일 정도 소요됩니다.
			    	</div>
				    </div>
				  </fieldset>
				</div>
				
			</div>
		</div>
	</div>-->
 </form>
 
    <!-- Required Js -->
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
 
   </body>
</html>
