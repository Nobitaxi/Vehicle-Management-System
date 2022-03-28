var remenber_pwd = document.getElementById("remenber_pwd");
var user = document.getElementById("user");
var pwd = document.getElementById("pwd");
var message = document.getElementById("login_message")

//记住密码
//将function函数赋值给onload对象
window.onload = function ()
{
    //从Cookie获取到用户名
    var username = getCookie("This is username") ;
    //如果用户名为空,则给表单元素赋空值
    if ( username == "" )
    {
        user.value="" ;
        pwd.value="" ;
        remenber_pwd.checked = false ;
    }
    //获取对应的密码,并把用户名,密码赋值给表单
    else
    {
        var password = getCookie(username) ;
        user.value = username ;
        pwd.value = password ;
        remenber_pwd.checked = true ;
    }
}
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}
function delCookie(name)
{
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
function setCookie(name,value)
{
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
//登陆
function login() {
    var username = user.value;
    var password = pwd.value;
    var isRmbPwd = remenber_pwd.checked;
    if(!username || !password){ //拦截空内容
        msg("block","red","用户名或密码为空");
    }else{
        //请求操作
        if(username == "admin" && password == "admin" ){
            msg("block","green","登陆成功，1s后自动跳转...");
            //若复选框勾选,则添加Cookie,记录密码
            if ( isRmbPwd == true )
            {
                setCookie ( "This is username", username, 7 ) ;
                setCookie ( username, password, 7 ) ;
            }
            //否则清除Cookie
            else
            {
                delCookie ( "This is username" ) ;
                delCookie ( username ) ;
            };
            setTimeout(function(){ //2s跳转到首页
                window.reload();
            },1000)
        }else{
            msg("block","red","登陆失败，请确认用户名或密码")
        }
    }


}
//提示信息
function msg(show,color,txt) {
    message.style.display = show;
    message.style.background = color;
    message.innerText = txt;
}
