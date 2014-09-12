var clientHeight = document.documentElement.clientHeight;
var oContent = document.getElementById('content');
var height = (clientHeight - oContent.offsetHeight)/2;
oContent.style.marginTop = height + 'px';

$('#edit_password').validate({
	rules:{
		old_password:{
			required : true,
			remote: { 
				url: "",
				type: "post",
				dataType: "json",
				data: {
					old_password: function() { 
						return $("#old_password").val(); 
					}
				} 
			}
		},
		new_password:{
			required : true,
			rangelength : [6,16],
			user : true
		},
		confirm_password:{
			required : true,
			equalTo : '#new_password'
		}
	},
	messages:{
		old_password:{
			required : '请输入原密码！',
			remote : '原密码输入错误！'
		},
		new_password:{
			required : '请输入新密码！',
			rangelength : '密码为6-16位！'
		},
		confirm_password:{
			required : '请输入确认密码！',
			equalTo : '两次输入密码不一致！'
		}
	},
	wrapper:"em",
	submitHandler:function(form) {
		form.submit();
	}
});