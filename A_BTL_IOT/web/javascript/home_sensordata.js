/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Tạo biểu đồ
var ctx = document.getElementById('weatherChart').getContext('2d');
var chart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [], // Danh sách các thời điểm
        datasets: [
            {
                label: 'Nhiệt Độ (°C)',
                data: [], // Dữ liệu nhiệt độ
                borderColor: 'red',
                fill: false
            },
            {
                label: 'Độ Ẩm (%)',
                data: [], // Dữ liệu độ ẩm
                borderColor: 'blue',
                fill: false
            },

            {
                label: 'Ánh Sáng (Lux)',
                data: [], // Dữ liệu ánh sáng
                borderColor: 'orange',
                fill: false
            }
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

var ctx1 = document.getElementById('khigaChart').getContext('2d');
var chart1 = new Chart(ctx1, {
    type: 'line',
    data: {
        labels: [], // Danh sách các thời điểm
        datasets: [
            {
                label: 'Khì ga (%)',
                data: [], // Dữ liệu nhiệt độ
                borderColor: 'violet',
                fill: false
            }
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// Hàm cập nhật dữ liệu từ fetchData và vẽ lại biểu đồ
function updateData(thongSo) {
    // Lấy thời điểm từ thongSo
    var rawTime = thongSo.time;
    var part = rawTime.split(' ');
    // Định dạng lại chuỗi thời gian để chỉ hiển thị giờ
    var currentTime = part[1];

    // Lấy dữ liệu từ thongSo
    var temperature = thongSo.nhietdo;
    var humidity = thongSo.doam;
    var light = thongSo.anhsang;
    var gas = Math.floor(Math.random() * 100) + 1;

    // Lấy dữ liệu hiện tại của biểu đồ
    var currentLabels = chart.data.labels;
    var currentLabels1 = chart1.data.labels;
    var currentTemperature = chart.data.datasets[0].data;
    var currentHumidity = chart.data.datasets[1].data;
    var currentLight = chart.data.datasets[2].data;
    var currentgas = chart1.data.datasets[0].data;

    // Thêm thời điểm mới và xóa thời điểm cũ nếu đã có 10 thời điểm
    if (currentLabels.length >= 10) {
        currentLabels.shift();
        currentTemperature.shift();
        currentHumidity.shift();
        currentLight.shift();

    }
    // Xu li thong so gas
    if (currentLabels1.length >= 10) {
        currentLabels1.shift();
        currentgas.shift();
    }

    currentLabels.push(currentTime);
    currentLabels1.push(currentTime);
    currentTemperature.push(temperature);
    currentHumidity.push(humidity);
    currentLight.push(light);
    
    currentgas.push(gas);

    // Cập nhật dữ liệu vào biểu đồ
    chart.update();
    chart1.update();
    
    //Dua thong so vao 3 the dau
    document.getElementById('temperatureValue').textContent = temperature + ' °C';
    document.getElementById('averageTemperature').textContent = temperature;
    //var temperatureWidget = document.getElementById('temperatureWidget');
    var randomTemperature = temperature;
    var cssClass = "";
    if (randomTemperature >= 30 && randomTemperature < 50) {
        cssClass = "#FF0066"; // Màu đỏ nhạt
    } else if (randomTemperature >= 50 && randomTemperature < 75) {
        cssClass = "#FF0000"; // Màu đỏ vừa
    } else if (randomTemperature >= 75) {
        cssClass = "#CC0000"; // Màu đỏ đậm nhất
    }
    //dValueElement.style.backgroundColor = cssClass;

    document.getElementById('humidityValue').textContent = humidity + ' %';
    document.getElementById('averageHumidity').textContent = humidity;
    var bValueElement = document.getElementById('bValue');
    var randomHumidity = humidity;
    var cssClass = "";
    if (randomHumidity >= 30 && randomHumidity < 50) {
        cssClass = "#33CCFF"; // Màu lam nhạt
    } else if (randomHumidity >= 50 && randomHumidity < 75) {
        cssClass = "#0099FF"; // Màu lam vừa
    } else if (randomHumidity >= 75) {
        cssClass = "#0066FF"; // Màu lam đậm nhất
    }
    bValueElement.style.backgroundColor = cssClass;



    document.getElementById('lightValue').textContent = light + ' Lux';
    document.getElementById('averageLight').textContent = light;
    var cValueElement = document.getElementById('cValue');
    var randomLight = light;
    var cssClass = "";
    if (randomLight >= 0 && randomLight < 100) {
        cssClass = "#CC9900"; //Màu vàng nhạt
    } else if (randomLight >= 100 && randomLight < 500) {
        cssClass = "#FF9900"; //Màu vàng vừa
    } else if (randomLight >= 500) {
        cssClass = "#FFFF00"; // Màu cam
    }
    cValueElement.style.backgroundColor = cssClass;



    //var dobui = Math.floor(Math.random() * 100) + 1;
    document.getElementById('nhietValue').textContent = gas + "%";
    document.getElementById('averageGas').textContent = gas;
    var dValueElement = document.getElementById('dValue');
    var randomGas = gas;
    var cssClass = "";
    if (randomGas >= 75 && randomGas <= 100) {
        cssClass = "#990066"; //Màu tím đậm
    } else if (randomGas >= 40 && randomGas < 70) {
        cssClass = "#9900CC"; //Màu tím vừa
    } else{
        cssClass = "#9900FF"; // Màu tím nhạt
    }
    dValueElement.style.backgroundColor = cssClass;

    document.getElementById('timecontrol1').textContent = rawTime;
    document.getElementById('timecontrol2').textContent = rawTime;
    document.getElementById('timecontrol3').textContent = rawTime;
    document.getElementById('timecontrol4').textContent = rawTime;

    const flashingDiv = document.getElementById("flashingDiv");
    const flashingDiv1 = document.getElementById("flashingDiv1");
    const flashingDiv2 = document.getElementById("flashingDiv2");
    if (gas > 75) {
        flashingDiv.style.animation = "flash 1s infinite";
        flashingDiv1.style.animation = "flash 1s infinite";
        flashingDiv2.style.animation = "flash 1s infinite";
        sendCommand("e");
    } else {
        flashingDiv.style.animation = "none";
        flashingDiv1.style.animation = "none";
        flashingDiv2.style.animation = "none";
        sendCommand("f");
    }

}

// Gọi hàm fetchData để lấy dữ liệu và cập nhật biểu đồ
function fetchDataAndUpdateChart() {
    $.get("/A_BTL_IOT1/thongso", function (data) {
        // Kiểm tra xem dữ liệu có tồn tại không
        if (data.length > 0) {
            var thongSo = data[data.length - 1]; // Lấy phần tử cuối cùng của mảng
            updateData(thongSo); // Gọi hàm updateData để cập nhật biểu đồ
        }
    });
}
// Gọi hàm fetchDataAndUpdateChart và vẽ lại biểu đồ mỗi 2 giây
setInterval(fetchDataAndUpdateChart, 2000);