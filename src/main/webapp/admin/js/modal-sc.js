
function handleAddAdmin() {
    $.post(
        {
            url: 'addAdmin',
            data: $("#addAdminModalForm").serialize(),
            success: function (result) {
                alert(result);
                if(result != "Failed")
                    $("#addAdminModal").modal('hide');
            }

        }
    );
    return false;

}

function changePasswordModal(e) {
    e = $(e);
    var user_id = e.data('user_id');
    console.log(user_id);
    $("#changePasswordUserId").val(user_id);

    $("#changePasswordModal").modal('show');

}

function handleChangePassword() {
    $.post(
        {
            url: 'changePasswordServlet',
            data: $("#changePasswordForm").serialize(),
            success: function (result) {
                alert(result);
                $("#changePasswordModal").modal('hide');
            }

        }
    );
    return false;
}
