$(document).ready(function(){
	var default_email_txt = "email@example.com";
	$("input[type=\"text\"]#email").val(default_email_txt);
	
	$("input[type=\"text\"]#email").focus(function(){
		if (this.value == default_email_txt)
		{			
			this.className = this.className.replace(/\s*tip-text\s*/, " ");
			this.value = "";
		}
	});
	
	$("input[type=\"text\"]#email").blur(function(){
		if (this.value == "")
		{
			this.className += " tip-text";
			this.value = default_email_txt;
		}
	});
	
});