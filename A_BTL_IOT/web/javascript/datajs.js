/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var selectElement = document.getElementById("pageSelect");
$(document).ready(function() {
    // Bắt sự kiện khi người dùng nhấn vào nút sắp xếp
    $("#id-up-link, #id-down-link, #time-up-link, #time-down-link, #nhietdo-up-link, #nhietdo-down-link, #doam-up-link, #doam-down-link, #light-up-link, #light-down-link").click(function() {
        // Loại bỏ lớp CSS disabled-button từ tất cả các nút
        $("a, i").removeClass("disabled-button");
        // Vô hiệu hóa tất cả các nút
        $("a, i").attr("disabled", "disabled");
        // Bỏ vô hiệu hóa và thêm lớp CSS disabled-button vào nút được nhấn
        $(this).removeAttr("disabled");
        $(this).addClass("disabled-button");
    });
});

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
fetchDownData("time");

document.getElementById("id-up-link").addEventListener("click", function(event) {
    fetchUpData("time");
});

document.getElementById("id-down-link").addEventListener("click", function(event) {
    fetchDownData("time");
});

document.getElementById("time-up-link").addEventListener("click", function(event) {
    fetchUpData("time");
});

document.getElementById("time-down-link").addEventListener("click", function(event) {
    fetchDownData("time");
});

document.getElementById("light-up-link").addEventListener("click", function(event) {
    fetchUpData("anhsang");
});

document.getElementById("light-down-link").addEventListener("click", function(event) {
    fetchDownData("anhsang");
});

document.getElementById("doam-up-link").addEventListener("click", function(event) {
    fetchUpData("doam");
});

document.getElementById("doam-down-link").addEventListener("click", function(event) {
    fetchDownData("doam");
});

document.getElementById("nhietdo-up-link").addEventListener("click", function(event) {
    fetchUpData("nhietdo");
});

document.getElementById("nhietdo-down-link").addEventListener("click", function(event) {
    fetchDownData("nhietdo");
});


//Tim kiem
var searchInput = document.getElementById("searchInput");
var searchResultsContainer = document.getElementById("searchResults");
var searchFilter = document.getElementById("filterValue");
searchInput.addEventListener("input", function() {
    var searchKeyword = searchInput.value;
    var filter = searchFilter.value;
    
    // Kiểm tra xem đã nhập đủ số ký tự mà bạn muốn trước khi tìm kiếm, ví dụ 3 ký tự
    if (searchKeyword.length >= 1) {
        searchFunction(searchKeyword, filter);
    }
});
function searchFunction(keyword, filter) {
    var mess = "/A_BTL_IOT1/action?command=search&text=" + keyword + "&fil=" + filter;
    $.get(mess, function (data) {
        // Xóa dữ liệu cũ trong bảng
        $("#data-table").empty();
        if (data.length === 0) {
            searchResultsContainer.innerHTML = "Không tìm thấy kết quả.";
        }
        else{
            searchResultsContainer.innerHTML = "";
        }
        // Thêm dữ liệu mới vào bảng
        data.forEach(function (thongSo) {
            var row = "<tr>" +
                    "<td>" + thongSo.id + "</td>" +
                    "<td>" + thongSo.time + "</td>" +
                    "<td>" + thongSo.nhietdo + "</td>" +
                    "<td>" + thongSo.doam + "</td>" +
                    "<td>" + thongSo.anhsang + "</td>" +
                    "</tr>";
            $("#data-table").append(row);
        });
    });
    while (selectElement.options.length > 0) {
            selectElement.remove(0);
    }
    for (var i = 1; i <= 10; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = "Trang " + i;
        selectElement.add(option);
    }
}
document.getElementById("sub-search").addEventListener("click", function(event) {
    var searchKeyword = document.getElementById("searchInput").value;
    searchFunction(searchKeyword, searchFilter);
});