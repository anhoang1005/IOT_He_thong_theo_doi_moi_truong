/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function fetchData() {
    $.get("/A_BTL_IOT1/lichsu", function (data) {
        // Xóa dữ liệu cũ trong bảng
        $("#data-table").empty();

        // Thêm dữ liệu mới vào bảng
        data.reverse().forEach(function (thongSo) {
            var row = "<tr>" +
                    "<td>" + thongSo.id + "</td>" +
                    "<td>" + thongSo.time + "</td>" +
                    "<td>" + thongSo.doituong + "</td>" +
                    "<td>" + thongSo.trangthai + "</td>" +
                    "</tr>";
            $("#data-table").append(row);
        });
    });
}
// Cập nhật dữ liệu mỗi 2 giây
setInterval(fetchData, 1000);
// Khởi đầu, gọi fetchData để lấy dữ liệu ban đầu
fetchData();

