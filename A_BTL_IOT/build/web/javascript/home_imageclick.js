/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function sendRequest(command) {
    $.ajax({
        url: "/A_BTL_IOT/test", // Đường dẫn đến servlet
        method: "POST", // Hoặc "GET" tùy thuộc vào servlet của bạn
        data: {command: command}, // Dữ liệu bạn muốn gửi đến servlet
        success: function (response) {
            // Xử lý phản hồi từ servlet
            $("#responseMessage").html(response);
        },
        error: function () {
            alert("Có lỗi xảy ra khi gửi yêu cầu.");
        }
    });
}


// Lấy tham chiếu đến các phần tử DOM
const lightImage = document.getElementById("lightImage");
const onButton = document.getElementById("onButton");
const offButton = document.getElementById("offButton");

// Xử lý sự kiện khi nút "ON" được nhấn
offButton.style.display = "none";
onButton.addEventListener("click", function () {
    lightImage.src = "./assets/img/den_sang.png";
    onButton.style.display = "none"; // Tắt nút "ON"
    offButton.style.display = "inline-block"; // Kích hoạt nút "OFF"
    sendRequest("a");
});

// Xử lý sự kiện khi nút "OFF" được nhấn
offButton.addEventListener("click", function () {
    lightImage.src = "./assets/img/den_tat.png";
    offButton.style.display = "none"; // Tắt nút "OFF"
    onButton.style.display = "inline-block"; // Kích hoạt nút "ON"
    sendRequest("b");
});



// Lấy tham chiếu đến các phần tử DOM
const quatImage = document.getElementById("quatImage");
const onButtonq = document.getElementById("onButtonquat");
const offButtonq = document.getElementById("offButtonquat");

// Xử lý sự kiện khi nút "ON" được nhấn
offButtonq.style.display = "none"; // Ẩn nút "OFF" ban đầu
onButtonq.addEventListener("click", function () {
    quatImage.classList.add("image-container");
    onButtonq.style.display = "none"; // Ẩn nút "ON"
    offButtonq.style.display = "inline-block"; // Hiện nút "OFF"
    //sendRequest("c");
});

// Xử lý sự kiện khi nút "OFF" được nhấn
offButtonq.addEventListener("click", function () {
    quatImage.classList.remove("image-container");
    offButtonq.style.display = "none"; // Ẩn nút "OFF"
    onButtonq.style.display = "inline-block"; // Hiện nút "ON"
    //sendRequest("d");
});


// Lấy tham chiếu đến các phần tử DOM
const lightImage1 = document.getElementById("lightImage1");
const onButton1 = document.getElementById("onButton1");
const offButton1 = document.getElementById("offButton1");

// Xử lý sự kiện khi nút "ON" được nhấn
offButton1.style.display = "none";
onButton1.addEventListener("click", function () {
    lightImage1.src = "./assets/img/den_sang.png";
    onButton1.style.display = "none"; // Tắt nút "ON"
    offButton1.style.display = "inline-block"; // Kích hoạt nút "OFF"
});

// Xử lý sự kiện khi nút "OFF" được nhấn
offButton1.addEventListener("click", function () {
    lightImage1.src = "./assets/img/den_tat.png";
    offButton1.style.display = "none"; // Tắt nút "OFF"
    onButton1.style.display = "inline-block"; // Kích hoạt nút "ON"
});