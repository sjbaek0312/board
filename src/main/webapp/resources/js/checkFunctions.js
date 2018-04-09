/**
 * 
 */
function validateJoinform()
{
	var reg_userId = /^[0-9a-zA-Z_]{4,20}$/;
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var userId = document.getElementById("userId").value;
	var userPw = document.getElementById("userPw").value;
	var userPwconfirm = document.getElementById("userPwconfirm").value;
	var userName = document.getElementById("userName").value;
	var email = document.getElementById("email").value;
		
	// id check
	if (userId.length < 1)
	{
		alert('아이디를 입력하세요.');l
		return false;
	}
	else if (userId.length < 4)
	{
		alert('4자 이상의 아이디를 입력하세요.');
		return false;
	}
	if (! reg_userId.test(userId))
	{
		alert('조건에 맞는 아이디를 입력하세요.');
		return false;
	}		
	// pw check
	if (userPw.length < 1)
	{
		alert('비밀번호를 입력하세요.');
		return false;
	}
	// name check
	if (userName.length < 1)
	{
		alert("이름을 입력하세요.");
		return false;
	}
	// email check
	if (email.length < 1)
	{
		alert('이메일을 입력하세요.');
		return false;
	}
	if (! reg_email.test(email))
	{
		alert('이메일 형식이 올바르지 않습니다.');
		return false;
	}
	// pwconfirm check
	if (userPw != userPwconfirm)
	{
		alert("비밀번호 값과 비밀번호 확인 값이 다릅니다.")
		return false;
	}
	
	alert("회원 가입을 축하합니다!");
	return true;
}

function validateJoinformAdmin()
{
	var reg_userId = /^[0-9a-zA-Z_]{4,20}$/;
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var userId = document.getElementById("userId").value;
	var userPw = document.getElementById("userPw").value;
	var userName = document.getElementById("userName").value;
	var email = document.getElementById("email").value;
	var userFlag = document.getElementById("userFlag").value;
	
	// id check
	if (userId.length < 1)
	{
		alert('아이디를 입력하세요.');
		return false;
	}
	else if (userId.length < 4)
	{
		alert('4자 이상의 아이디를 입력하세요.');
		return false;
	}
	if (! reg_userId.test(userId))
	{
		alert('조건에 맞는 아이디를 입력하세요.');
		return false;
	}		
	// pw check
	if (userPw.length < 1)
	{
		alert('비밀번호를 입력하세요.');
		return false;
	}
	// name check
	if (userName.length < 1)
	{
		alert("이름을 입력하세요.");
		return false;
	}
	// email check
	if (email.length < 1)
	{
		alert('이메일을 입력하세요.');
		return false;
	}
	if (! reg_email.test(email))
	{
		alert('이메일 형식이 올바르지 않습니다.');
		return false;
	}
	if (userFlag < 1)
	{
		alert('userFlag를 입력하세요.');
		return false;
	}
	if (userFlag != 'Y' && userFlag != 'N')
	{
		alert('userFlag는 Y 또는 N 값만 가능합니다.');
		return false;
	}
	
	alert("회원이 추가되었습니다.");
	return true;
}

function validateModifyform()
{
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var userPw = document.getElementById("userPw").value;
	var userPwconfirm = document.getElementById("userPwconfirm").value;
	var userName = document.getElementById("userName").value;
	var email = document.getElementById("email").value;
	
	// validation check
	if (userPw.length < 1)
	{
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if (userName.length < 1)
	{
		alert("이름을 입력하세요.");
		return false;
	}
	if (email.length < 1)
	{
		alert('이메일을 입력하세요.');
		return false;
	}	
	if (! reg_email.test(email))
	{
		alert('이메일 형식이 올바르지 않습니다.');
		return false;
	}
	if (userPw != userPwconfirm)
	{
		alert("비밀번호 값과 비밀번호 확인 값이 다릅니다.")
		return false;
	}
	// modify success
	alert("정보가 수정되었습니다.");
	return true;
}

function validateModifyformAdmin()
{
	var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var userPw = document.getElementById("userPw").value;
	var userName = document.getElementById("userName").value;
	var email = document.getElementById("email").value;
	var userFlag = document.getElementById("userFlag").value;
			
	// validation check
	if (userPw.length < 1)
	{
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if (userName.length < 1)
	{
		alert("이름을 입력하세요.");
		return false;
	}
	if (email.length < 1)
	{
		alert('이메일을 입력하세요.');
		return false;
	}
	if (! reg_email.test(email))
	{
		alert('이메일 형식이 올바르지 않습니다.');
		return false;
	}
	if (userFlag < 1)
	{
		alert('userFlag를 입력하세요.');
		return false;
	}
	if (userFlag != 'Y' && userFlag != 'N')
	{
		alert('userFlag는 Y 또는 N 값만 가능합니다.');
		return false;
	}

	// modify success
	alert("정보가 수정되었습니다.");
	return true;
}

