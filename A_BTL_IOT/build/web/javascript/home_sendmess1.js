$(document).ready(function () {
    $("#onButton").click(function () {
        sendRequest("a");
    });

    $("#offButton").click(function () {
        sendRequest("b");
    });

    $("#onButtonquat").click(function () {
        sendRequest("c");
    });

    $("#offButtonquat").click(function () {
        sendRequest("d");
    });

    function sendRequest(command) {
        $.ajax({
            url: "/A_BTL_IOT/send", 
            method: "POST", 
            data: {command: command},
            success: function (response) {
                // xuli
                $("#responseMessage").html(response);
            },
            error: function () {
                alert("Có lỗi xảy ra khi gửi yêu cầu.");
            }
        });
    }
});