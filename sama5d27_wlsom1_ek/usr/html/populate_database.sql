CREATE TABLE IF NOT EXISTS cards (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, card_no TEXT(50), name TEXT, tempo DATETIME, status TEXT(50) DEFAULT 'checked', UNIQUE KEY (card_no (50)));

CREATE TABLE IF NOT EXISTS users (id INT(20) NOT NULL, username VARCHAR(50) PRIMARY KEY, password TEXT, tempo DATETIME, auth INT, UNIQUE KEY (username (50)));

CREATE TABLE IF NOT EXISTS transactions (user_id VARCHAR(20), wallbox_status VARCHAR(20), start_time DATETIME, end_time DATETIME, duration VARCHAR(20), delivered_kwh VARCHAR(20), error VARCHAR(20), FOREIGN KEY(user_id) REFERENCES users(username));

CREATE TABLE IF NOT EXISTS configuration (id INT NOT NULL PRIMARY KEY, name VARCHAR(50) NOT NULL, tipo VARCHAR(50), value VARCHAR(50), unit VARCHAR(50), owner VARCHAR(50), UNIQUE (id), UNIQUE (name) );

INSERT IGNORE INTO configuration VALUES(0,'minimum_current_available_vehicle','float','1.0','Ampere','dsp');
INSERT IGNORE INTO configuration VALUES(1,'minimum_available_power','float','300.0','Watt','dsp');
INSERT IGNORE INTO configuration VALUES(2,'rfid_validity_timeout','uint32_t','60000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(3,'rfid_swipe_validity_timeout','uint32_t','3000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(4,'userstop_short_press','uint16_t','500','msec','dsp');
INSERT IGNORE INTO configuration VALUES(5,'userstop_long_press','uint16_t','5000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(6,'userstop_verylong_press','uint16_t','10000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(7,'led_light_on_time','uint16_t','1000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(8,'led_light_off_time','uint16_t','1000','msec','dsp');
INSERT IGNORE INTO configuration VALUES(9,'led_light_on_time_fast','uint16_t','150','msec','dsp');
INSERT IGNORE INTO configuration VALUES(10,'led_light_off_time_fast','uint16_t','150','msec','dsp');
INSERT IGNORE INTO configuration VALUES(11,'short_circuit_current','float','100','Ampere','dsp');
INSERT IGNORE INTO configuration VALUES(12,'enable_fixed_power_inhibit_mid','bool','false','','dsp');
INSERT IGNORE INTO configuration VALUES(13,'customer_username','string','','','microchip');
INSERT IGNORE INTO configuration VALUES(14,'customer_password','string','','','microchip');
INSERT IGNORE INTO configuration VALUES(15,'facility_configuration_id','int','0x40','','dsp');
INSERT IGNORE INTO configuration VALUES(16,'builder_name','string','','','microchip');
INSERT IGNORE INTO configuration VALUES(17,'facility_configuration','uint8_t','','facility_configuration','dsp');
INSERT IGNORE INTO configuration VALUES(18,'meter_power_rating','uint32_t','14000','Watt','dsp');
INSERT IGNORE INTO configuration VALUES(19,'modbus_address','int','','','microchip');
INSERT IGNORE INTO configuration VALUES(20,'activation_timestamp','uint32_t','','sec','dsp');
INSERT IGNORE INTO configuration VALUES(21,'language','string','it-IT','','microchip');
INSERT IGNORE INTO configuration VALUES(22,'polling_period_realtime_mqtt_data','int','5','sec','dsp');
INSERT IGNORE INTO configuration VALUES(23,'wallbox_type','uint8_t','0x80','tipologia_wallbox','dsp');
INSERT IGNORE INTO configuration VALUES(24,'wallbox_id','string','','','microchip');
INSERT IGNORE INTO configuration VALUES(25,'wallbox_serial_number','string','','','microchip');
INSERT IGNORE INTO configuration VALUES(26,'wallbox_rated_power','uint32_t','14000','Watt','dsp');
INSERT IGNORE INTO configuration VALUES(27,'max_temperature_on','float','60.0','celsius','dsp');
INSERT IGNORE INTO configuration VALUES(28,'min_temperature_off','float','40.0','celsius','dsp');
INSERT IGNORE INTO configuration VALUES(29,'min_voltage','float','180.0','Volt','dsp');
INSERT IGNORE INTO configuration VALUES(30,'max_voltage','float','280.0','Volt','dsp');
INSERT IGNORE INTO configuration VALUES(31,'wallbox_connection_timeout','int','','sec','microchip');
INSERT IGNORE INTO configuration VALUES(32,'wallbox_modbus_address','int','','','microchip');
INSERT IGNORE INTO configuration VALUES(33,'wallbox_ocpp_server_ip_address','uint32_t','','IP','microchip');
INSERT IGNORE INTO configuration VALUES(34,'wallbox_ocpp_ip_server_port','int','','IP','microchip');
INSERT IGNORE INTO configuration VALUES(35,'wallbox_ocpp_url_server','string','','url','microchip');

