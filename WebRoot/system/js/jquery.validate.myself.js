jQuery.extend(jQuery.validator.messages, {  
        required: "该字段必须填写",  
remote: "请修正该字段",  
email: "请输入正确格式的电子邮件",  
url: "请输入合法的网址",  
date: "请输入合法的日期",  
dateISO: "请输入合法的日期 (ISO).",  
number: "请输入合法的数字",  
digits: "只能输入整数",  
creditcard: "请输入合法的信用卡号",  
equalTo: "请再次输入相同的值",  
accept: "请输入拥有合法后缀名的字符串",  
maxlength: jQuery.validator.format("请输入一个长度最多是 {0} 的字符串"),  
minlength: jQuery.validator.format("请输入一个长度最少是 {0} 的字符串"),  
rangelength: jQuery.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),  
range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),  
max: jQuery.validator.format("请输入一个最大为 {0} 的值"),  
min: jQuery.validator.format("请输入一个最小为 {0} 的值")  
});

//IP地址验证
jQuery.validator.addMethod("IP", function (value, element, param) {
    var reSpaceCheck = /^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;
    if (reSpaceCheck.test(value)) {
        value.match(reSpaceCheck);
        if (RegExp.$1 <= 255 && RegExp.$1 >= 0
          && RegExp.$2 <= 255 && RegExp.$2 >= 0
          && RegExp.$3 <= 255 && RegExp.$3 >= 0
          && RegExp.$4 <= 255 && RegExp.$4 >= 0) {
            return true;
        } else 
            return false;
    } else 
        return false;
}, $.validator.format("请输入正确的IP地址！每个字节数值在0-255范围内！"));