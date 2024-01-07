/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var selectElement = document.getElementById("pageSelect");
function fetchUpData(sensor) {
    var mess = "/A_BTL_IOT1/action?command=" + sensor + "up";
    $.get(mess, function (data) {
        // Xóa dữ liệu cũ trong bảng
        $("#data-table").empty();
        
        // Thêm dữ liệu mới vào bảng
        data.forEach(function (thongSo){
            var row = "<tr>" +
                    "<td>" + thongSo.id + "</td>" +
                    "<td>" + thongSo.time + "</td>" +
                    "<td>" + thongSo.nhietdo + "</td>" +
                    "<td>" + thongSo.doam + "</td>" +
                    "<td>" + thongSo.anhsang + "</td>" +
                    "</tr>";
            $("#data-table").append(row);
        });
        while (selectElement.options.length > 0) {
            selectElement.remove(0);
        }
        for (var i = 1; i <= data.length/30; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = "Trang " + i;
            selectElement.add(option);
        }
    });
    
}
function fetchDownData(sensor) {
    var mess = "/A_BTL_IOT1/action?command=" + sensor + "down";
    $.get(mess, function (data) {
        // Xóa dữ liệu cũ trong bảng
        $("#data-table").empty();
        
        // Thêm dữ liệu mới vào bảng
        data.reverse().forEach(function (thongSo){
            var row = "<tr>" +
                    "<td>" + thongSo.id + "</td>" +
                    "<td>" + thongSo.time + "</td>" +
                    "<td>" + thongSo.nhietdo + "</td>" +
                    "<td>" + thongSo.doam + "</td>" +
                    "<td>" + thongSo.anhsang + "</td>" +
                    "</tr>";
            $("#data-table").append(row);
        });
        while (selectElement.options.length > 0) {
        selectElement.remove(0);
        }
        for (var i = 1; i <= data.length/30; i++) {
            var option = document.createElement("option");
            option.value = i;
            option.text = "Trang " + i;
            selectElement.add(option);
        }
    });
    
}
fetchUpData("time");

