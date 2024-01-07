/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MqttSubTest {
    public static void main(String[] args) {        
        String brokerUrl = "tcp://broker.hivemq.com"; // URL của HiveMQ
        String clientId = "clientId-oNUvE3iylT"; // Tên client
        String topic = "SENSORDATA"; // Tên chủ đề muốn lắng nghe
        String user = "hoangvanan";
        String pass = "123456";
        try {
            MqttClient client = new MqttClient(brokerUrl, clientId, new MemoryPersistence());
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);

            // Kết nối tới HiveMQ
            client.connect(connOpts);

            // Đăng ký lắng nghe chủ đề
            client.subscribe(topic);

            // Thiết lập callback để xử lý dữ liệu khi nhận được
            client.setCallback(new MqttCallback() {
                @Override
                public void connectionLost(Throwable cause) {
                    System.out.println("Connection lost: " + cause.getMessage());
                }

                @Override
                public void messageArrived(String topic, MqttMessage message) throws Exception {
                    String data = new String(message.getPayload(), "UTF-8");
                   // tdao.insertTest(data);
                    System.out.println("Received message: " + data);
                }

                @Override
                public void deliveryComplete(IMqttDeliveryToken token) {
                }
            });

            // Chờ cho đến khi ứng dụng kết thúc (Ctrl+C để dừng)
            Thread.sleep(Long.MAX_VALUE);
        } catch (MqttException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
