CREATE DATABASE laptops;
USE laptops;

CREATE TABLE storage_drives(
	id BIGINT NOT NULL PRIMARY KEY,
    model VARCHAR(45) NOT NULL UNIQUE,
	storage_type VARCHAR(20) NOT NULL,
	storage_capacity_GB FLOAT NOT NULL,
    read_speed_MB INTEGER NOT NULL,
    write_speed_MB INTEGER NOT NULL,
    interface VARCHAR(15) NOT NULL
);

CREATE TABLE ram_sticks(
	id BIGINT NOT NULL PRIMARY KEY,
    model VARCHAR(45) UNIQUE,
	RAM_type VARCHAR(10) NOT NULL,
	format_factor VARCHAR(15) NOT NULL
);

CREATE TABLE screens(
  id BIGINT NOT NULL PRIMARY KEY,
  model VARCHAR(45) UNIQUE,
  screen_size_IN FLOAT NOT NULL,
  screen_width_resolution_px INT NOT NULL,
  screen_height_resolution_px INT NOT NULL,
  glossy_screen BOOLEAN NOT NULL,
  touch_screen BOOLEAN NOT NULL,
  screen_type VARCHAR(20) NOT NULL,
  refresh_rate INTEGER NOT NULL
);


CREATE TABLE laptops(
  id BIGINT NOT NULL PRIMARY KEY,
  model VARCHAR(45) NOT NULL UNIQUE,
  name_laptop VARCHAR(45) NOT NULL,
  price FLOAT NOT NULL,
  date_year DATE NOT NULL,
  weight_kg FLOAT NOT NULL,
  available_RAM_GB FLOAT NOT NULL,
  max_RAM_GB FLOAT NOT NULL,
  removable_RAM_GB FLOAT NOT NULL,  
  RAM_slots INT NOT NULL,
  battery_duration_hr FLOAT NOT NULL,
  battery_design_capacity FLOAT NOT NULL,
  battery_life_percentage FLOAT NOT NULL,
  removable_battery BOOLEAN NOT NULL,
  operative_system VARCHAR(50) NOT NULL,
  keyboard_languages VARCHAR(50) NOT NULL,
  numeric_pad BOOLEAN NOT NULL,
  current_condition VARCHAR(80) NOT NULL,
  warranty_months INT NOT NULL,
  color VARCHAR(30) NOT NULL,
  USB_ports INT NOT NULL,
  thunderbolt BOOLEAN NOT NULL,
  thunderbolt_version FLOAT NOT NULL,
  removable_keyboard BOOLEAN NOT NULL,
  HDMI BOOLEAN NOT NULL,
  VGA BOOLEAN NOT NULL,
  DisplayPort BOOLEAN NOT NULL,
  Optical_Drive BOOLEAN NOT NULL,
  Fingerprint_sensor BOOLEAN NOT NULL,
  SD_Card_Reader BOOLEAN NOT NULL,
  Bluetooth BOOLEAN NOT NULL,
  Mobile_Data BOOLEAN NOT NULL,
  Ethernet_Port BOOLEAN NOT NULL,
  Webcam BOOLEAN NOT NULL,
  Trackpad BOOLEAN NOT NULL,
  Trackpoint BOOLEAN NOT NULL,
  Camera_cover_slide BOOLEAN NOT NULL,
  box_content VARCHAR(50) NOT NULL
);

CREATE TABLE manufacturer(
  id BIGINT NOT NULL PRIMARY KEY,
  DUNS CHAR(9) NOT NULL UNIQUE,
  name_manufacturer VARCHAR(45) NOT NULL,
  country VARCHAR(45) NOT NULL,
  web_page VARCHAR(45) NOT NULL,
  still_active BOOLEAN NOT NULL
);

CREATE TABLE processor(
  id BIGINT NOT NULL PRIMARY KEY,
  model VARCHAR(45) NOT NULL UNIQUE,
  name_processor VARCHAR(45) NOT NULL,
  generation VARCHAR(45) NOT NULL,
  num_cores INT NOT NULL,
  speed FLOAT NOT NULL,
  tdp FLOAT NOT NULL
);

CREATE TABLE graphics_card(
  id BIGINT NOT NULL PRIMARY KEY,
  model VARCHAR (45) NOT NULL UNIQUE,
  name_graphics_card VARCHAR(45) NOT NULL,
  arquitecture VARCHAR(45) NOT NULL,
  memory_space FLOAT NOT NULL,
  memory_type VARCHAR(45) NOT NULL,
  manufacturer_date DATE NOT NULL,
  tdp FLOAT NOT NULL
);

CREATE TABLE series(
	id BIGINT NOT NULL PRIMARY KEY,
    identifier BIGINT NOT NULL UNIQUE,
	launch_year YEAR NOT NULL,
    laptop_type VARCHAR(45) NOT NULL,
    production BOOLEAN NOT NULL
);


/*DESCRIBE laptops;
DESCRIBE processor;
DESCRIBE graphics_card;
DESCRIBE manufacturer;
DESCRIBE series;*/

ALTER TABLE laptops
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE laptops
ADD CONSTRAINT fk_manufacturer_laptops
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);


CREATE TABLE laptops_graphics (
	id BIGINT NOT NULL,
    laptop_model_fk VARCHAR(45) NOT NULL,
    graphics_card_model_fk VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (laptop_model_fk) REFERENCES laptops(model),
    FOREIGN KEY (graphics_card_model_fk) REFERENCES graphics_card(model)
);

CREATE TABLE laptops_processors (
	id BIGINT NOT NULL,
    laptop_model_fk VARCHAR(45) NOT NULL,
    processor_model_fk VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (laptop_model_fk) REFERENCES laptops(model),
    FOREIGN KEY (processor_model_fk) REFERENCES processor(model)
);

ALTER TABLE laptops
ADD serie_fk BIGINT NOT NULL;
ALTER TABLE laptops
ADD CONSTRAINT fk_series_laptops
FOREIGN KEY (serie_fk) REFERENCES series(identifier);


CREATE TABLE laptops_storages (
	id BIGINT NOT NULL,
    laptop_model_fk VARCHAR(45) NOT NULL,
    storage_model_fk VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (laptop_model_fk) REFERENCES laptops(model),
    FOREIGN KEY (storage_model_fk) REFERENCES storage_drives(model)
);


CREATE TABLE laptops_ram (
	id BIGINT NOT NULL,
    laptop_model_fk VARCHAR(45) NOT NULL,
    ram_model_fk VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (laptop_model_fk) REFERENCES laptops(model),
    FOREIGN KEY (ram_model_fk) REFERENCES ram_sticks(model)
);

ALTER TABLE screens
ADD laptop_fk VARCHAR(45) NOT NULL;
ALTER TABLE screens
ADD CONSTRAINT fk_laptop_model
FOREIGN KEY (laptop_fk) REFERENCES laptops(model);


ALTER TABLE screens
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE screens
ADD CONSTRAINT fk_manufacturer
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);


ALTER TABLE storage_drives
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE storage_drives
ADD CONSTRAINT fk_manufacturer_storage
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);


ALTER TABLE ram_sticks
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE ram_sticks
ADD CONSTRAINT fk_manufacturer_ram
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);


ALTER TABLE processor
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE processor
ADD CONSTRAINT fk_manufacturer_processor
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);


ALTER TABLE graphics_card
ADD manufacturer_fk CHAR(9) NOT NULL;
ALTER TABLE graphics_card
ADD CONSTRAINT fk_manufacturer_graphics
FOREIGN KEY (manufacturer_fk) REFERENCES manufacturer(DUNS);

/* Hasta aqui lo trabajo Andre  */
CREATE TABLE endpoint_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  endpoint VARCHAR(100) NOT NULL,
  start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(500) NOT NULL,
  browser VARCHAR(250) NOT NULL,
  os VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP NOT NULL
);


CREATE TABLE users (
    id BIGINT NOT NULL PRIMARY KEY auto_increment,
    username varchar(255) NOT NULL UNIQUE,
    passw varchar(255) NOT NULL,
    register_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(1,'967508198',"Acer","Taiwán","https://www.acer.com/mx-es/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(2,'153345173',"Lenovo","China","https://www.lenovo.com/mx/es/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(3,'107913261',"HP","Estados Unidos","https://www.hp.com/mx-es/home.html",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(4,'913542965',"Apple","Estados Unidos","https://www.apple.com/mx/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(5,'117463409',"Alienware","Estados Unidos","https://www.dell.com/en-us/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(6,'968282009',"Toshiba","Japon","https://toshiba.com.mx/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(7,'003233384',"Dell","Estados Unidos","https://www1.la.dell.com/content/r",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(8,'227720521',"ASUS","Taiwán","https://www.asus.com/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(9,'077010254',"Samsung","Corea del Sur","https://www.samsung.com/mx/",0); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(10,'058151010',"Gateway","Estados Unidos","https://www.gateway.com/gw/es/",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(11,'005902150',"Sony","Japon","https://www.sony.com/en/",0); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(12,'828666466',"MSI","Taiwán","https://mx.msi.com/",0); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(13,'070094818',"LG","Corea del Sur","https://www.lg.com/mx",0); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(14,'047897855',"Intel","Estados Unidos","https://www.intel.la/content/www/xl/es/homepage.html",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(15,'950543002',"AMD","Estados Unidos","https://www.amd.com/es",1); 
INSERT INTO manufacturer (id, DUNS, name_manufacturer, country, web_page, still_active) VALUES(16,'806724555',"NVIDIA","Estados Unidos","https://www.nvidia.com/es-la/",1); 

INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(1,0,2022,"MacBook Pro 13 M2",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(2,0,2021,"Ideapad Flex 5 14ALC",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(3,0,2020,"GRAM 15 Z95N-H",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(4,0,2020,"Yoga 7 14ITL",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(5,0,2021,"Inspiron 15 5515",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(6,0,2022,"XPS 15 9520",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(7,0,2020,"Thinkpad X1 Carbon 9th gen",1);

INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(8,0,2021,"Clevo X170KM-G",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(9,0,2020,"Gaming Raider GE66 10UG",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(10,0,2021,"Gaming Raider GE76 11UG",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(11,0,2021,"ROG Strix G15 G513QR",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(12,0,2022,"Omen 16t-k00",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(13,0,2020,"Nitro 5 15 AN515-55",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(14,0,2021,"Legion 5 15ITH",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(15,0,2020,"Predator Helios 300 15 PH315-53",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(16,0,2021,"Legion Pro 16 ACH",1);

INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(17,0,2021,"Precision 15 7560",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(18,0,2020,"Thinkpad T14 Gen 2",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(19,0,2020,"EliteBook 840 G8",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(20,0,2020,"EliteBook 850 G8",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(21,0,2021,"Thinkpad L14 Gen 2",1);
INSERT INTO series (id, identifier, launch_year, laptop_type, production) VALUES(22,0,2021,"Zbook Firefly 14 G8",1);









