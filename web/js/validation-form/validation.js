function loginForms() {

    var txtUser = document.forms["loginForm"]["txtUser"].value;

    var txtPass = document.forms["loginForm"]["txtPass"].value;

    if (txtUser === "" || txtPass === "") {

        if (txtUser === "") {
            document.getElementById("txt_username").innerHTML = "Tên tài khoảng không được để trống";
        } else {
            document.getElementById("txt_username").innerHTML = "";
        }
        if (txtPass === "") {
            document.getElementById("txt_password").innerHTML = "Mật khẩu không được để trống";
        } else {
            document.getElementById("txt_password").innerHTML = "";
        }
        return false;
    }

}
