/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.ThongSoDAO;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MqttListenerContext implements ServletContextListener {
    ThongSoDAO tsdao = new ThongSoDAO();
    
    private MqttClient mqttClient;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        String brokerUrl = "tcp://broker.hivemq.com"; // Điền URL của HiveMQ brokeR
        String clientId = "clientId-oNUvE3iylT"; // Điền ID của khách hàng MQTT
        String topic = "SENSORDATA"; // Điền chủ đề muốn đăng ký lắng nghe
        
        MemoryPersistence persistence = new MemoryPersistence();

        try {
            mqttClient = new MqttClient(brokerUrl, clientId, persistence);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);

            mqttClient.setCallback(new MqttCallback() {
                @Override
                public void connectionLost(Throwable cause) {
                    // Xử lý khi mất kết nối
                }
                
                @Override
                public void messageArrived(String topic, MqttMessage message) throws Exception {
                    LocalDateTime now = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                    String formattedDateTime = now.format(formatter);

                    // Xử lý tin nhắn MQTT khi nhận được
                    String payload = new String(message.getPayload(), "UTF-8");
                    System.out.println("Received message on topic: " + topic);
                    System.out.println("Message: " + formattedDateTime + "-" + payload);
                    
                    String[] mess = payload.split("-");
                    
                    
                    if(mess.length >=3){
                        String time = formattedDateTime;
                        String doam = mess[0];
                        String nhietdo = mess[1];
                        String anhsang = mess[2];
                        tsdao.insertThongSo(time, nhietdo, doam, anhsang);
                    }
                    //String m = formattedDateTime + "-" + payload;
                }

                @Override
                public void deliveryComplete(IMqttDeliveryToken token) {
                    // Xử lý khi tin nhắn đã được gửi thành công
                }
            });

            mqttClient.connect(connOpts);
            mqttClient.subscribe(topic);

            // Bắt đầu lắng nghe tin nhắn MQTT trong một luồng riêng biệt
            new Thread(() -> {
                while (true) {
                    try {
                        Thread.sleep(2000); // Đặt thời gian ngủ thích hợp
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }).start();

        } catch (MqttException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        try {
            mqttClient.disconnect();
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }
}
