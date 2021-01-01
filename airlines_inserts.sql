
-- continents

INSERT INTO continents VALUES
    ('AF', 'Africa');
    
INSERT INTO continents VALUES
    ('AN', 'Antarctica');

INSERT INTO continents VALUES
    ('AS', 'Asia');
    
INSERT INTO continents VALUES
    ('EU', 'Europe');
    
INSERT INTO continents VALUES
    ('NA', 'North America');
    
INSERT INTO continents VALUES
    ('SA', 'South America');
    
INSERT INTO continents VALUES
    ('AU', 'Australia');
    

-- countires

INSERT INTO countries VALUES
    ('FR', 'France', 'EU');
    
INSERT INTO countries VALUES
    ('SP', 'Spain', 'EU');

INSERT INTO countries VALUES
    ('US', 'United States', 'NA');

INSERT INTO countries VALUES
    ('CN', 'China', 'AS');
    
INSERT INTO countries VALUES
    ('IT', 'Italy', 'EU');

INSERT INTO countries VALUES
    ('TU', 'Turkey', 'AS');
    
INSERT INTO countries VALUES
    ('MX', 'Mexico', 'NA');

INSERT INTO countries VALUES
    ('UK', 'United Kingdom', 'EU');

INSERT INTO countries VALUES
    ('GE', 'Germany', 'EU');
    
INSERT INTO countries VALUES
    ('AS', 'Austria', 'EU');
    
INSERT INTO countries VALUES
    ('JP', 'Japan', 'AS');

INSERT INTO countries VALUES
    ('GR', 'Greece', 'EU');

INSERT INTO countries VALUES
    ('PT', 'Portugal', 'EU');
    
INSERT INTO countries VALUES
    ('BE', 'Belgium', 'EU');

INSERT INTO countries VALUES
    ('CR', 'Croatia', 'EU');
    
INSERT INTO countries VALUES
    ('CA', 'Canada', 'NA');

INSERT INTO countries VALUES
    ('IN', 'India', 'AS');

INSERT INTO countries VALUES
    ('AU', 'Australia', 'AU');
    
INSERT INTO countries VALUES
    ('EG', 'Egypt', 'AF');

INSERT INTO countries VALUES
    ('BR', 'Brazil', 'SA');

INSERT INTO countries VALUES
    ('AR', 'Argentina', 'SA');

INSERT INTO countries VALUES
    ('PL', 'Poland', 'EU');

INSERT INTO countries VALUES
    ('TN', 'Tunisia', 'AF');
    

--airports

INSERT INTO airports VALUES
    ('CDG', 'Charles de Gaulle International Airport', 'Paris', '5711 Roissy Charles de Gaulle', 'FR');
    
INSERT INTO airports VALUES
    ('MRS', 'Marseille Provence Airport', 'Marseille', '13700 Marignane', 'FR');
    
INSERT INTO airports VALUES
    ('LYS', 'Lyon Saint-Exupéry Airport', 'Lyon', '69125 Colombier-Saugnie', 'FR');

INSERT INTO airports VALUES
    ('BCN', 'Barcelona International Airport', 'Barcelona', '08820 El Prat de Llobregat', 'SP');
    
INSERT INTO airports VALUES
    ('MAD', 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', '28042, Av de la Hispanidad', 'SP');
    
INSERT INTO airports VALUES
    ('PMI', 'Palma De Mallorca Airport', 'Palme De Mallorca', '07611 Palma', 'SP');

INSERT INTO airports VALUES
    ('ATL', 'Hartsfield–Jackson Atlanta International Airport', 'Atlanta', '6000 N Terminal Pkwy', 'US');
    
INSERT INTO airports VALUES
    ('LAX', 'Los Angeles International Airport', 'Los Angeles', '1 World Way', 'US');
    
INSERT INTO airports VALUES
    ('ORD', 'O`Hare International Airport', 'Chicago', '10000 W O`Hare Ave', 'US');

INSERT INTO airports VALUES
    ('PEK', 'Beijing Capital International Airport', 'Beijing', 'Shunyi District', 'CN');
    
INSERT INTO airports VALUES
    ('PVG', 'Shanghai Pudong International Airport', 'Shanghai', '900 Qihang Road', 'CN');

INSERT INTO airports VALUES
    ('FOC', 'Rome Fiumicino Airport', 'Rome', 'Via dell` Aeroporto di Fiumicino', 'IT');
    
INSERT INTO airports VALUES
    ('MXP', 'Milan Malpensa Airport', 'Milan', '21010 Ferno, Varese', 'IT');

INSERT INTO airports VALUES
    ('IST', 'Istanbul Airport', 'Istanbul', '34283 Arnavutköy', 'TU');
    
INSERT INTO airports VALUES
    ('AYT', 'Antalya Airport', 'Antalya', '07230 Muratpaşa', 'TU');

INSERT INTO airports VALUES
    ('IST', 'Istanbul Airport', 'Istanbul', '34283 Arnavutköy', 'TU');
    
INSERT INTO airports VALUES
    ('MEX', 'Licenciado Benito Juarez International Airport', 'Mexico City', '15620 Ciudad de México', 'MX');

INSERT INTO airports VALUES
    ('LHR', 'London Heathrow Airport', 'London', 'Longford TW6', 'UK');
    
INSERT INTO airports VALUES
    ('MAN', 'Manchester Airport', 'Manchester', 'Manchester M90 1QX', 'UK');

INSERT INTO airports VALUES
    ('FRA', 'Frankfurt am Main Airport', 'Frankfurt am Main', '60547 Frankfurt', 'GE');
    
INSERT INTO airports VALUES
    ('BER', 'Airport Berlin Brandenburg', 'Berlin', 'Willy-Brandt-Platz, 12529 Schönefeld', 'GE');
    
INSERT INTO airports VALUES
    ('VIE', 'Vienna International Airport', 'Vienna', '1300 Schwechat', 'AS');

INSERT INTO airports VALUES
    ('NRT', 'Narita International Airport', 'Tokyo', '1-1 Furugome, Narita, Chiba 282-0004,', 'JP');
    
INSERT INTO airports VALUES
    ('ATH', 'Eleftherios Venizelos International Airport', 'Athens', 'Attiki Odos, Spata Artemida 190 04', 'GR');
    
INSERT INTO airports VALUES
    ('LIS', 'Lisbon Portela Airport', 'Lisbon', 'Alameda das Comunidades Portuguesas, 1700-111', 'PT');

INSERT INTO airports VALUES
    ('CAI', 'Cairo International Airport', 'Cairo', ' Oruba، Road، El Nozha', 'EG');
    
INSERT INTO airports VALUES
    ('GRU', 'Guarulhos International Airport', 'São Paulo', 'Rod. Hélio Smidt, 07190-100', 'BR');
    
INSERT INTO airports VALUES
    ('WAW', 'Warsaw Chopin Airport', 'Warsaw', 'Żwirki i Wigury, 00-001', 'PL');
    
INSERT INTO airports VALUES
    ('TUN', 'Tunis Carthage International Airport', 'Tunis', '1080 Tunis Cedex', 'TN');
    
        
-- flights

INSERT INTO flights VALUES
    (1, 3.50, TO_DATE('15/12/2020 8:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('15/12/2020 12:00', 'DD/MM/YYYY HH24:MI'), 2290.33, 'WAW', 'MAD');

INSERT INTO flights VALUES
    (2, 2, TO_DATE('16/12/2020 20:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('16/12/2020 22:30', 'DD/MM/YYYY HH24:MI'), 1053.20, 'MAD', 'CDG');

INSERT INTO flights VALUES
    (3, 13.83, TO_DATE('17/12/2020 18:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('18/12/2020 7:50', 'DD/MM/YYYY HH24:MI'), 9464.02, 'LYS', 'LAX');

INSERT INTO flights VALUES
    (4, 2.33, TO_DATE('16/12/2020 15:20', 'DD/MM/YYYY HH24:MI'), TO_DATE('16/12/2020 17:40', 'DD/MM/YYYY HH24:MI'), 1188.56, 'MXP', 'MAD');

INSERT INTO flights VALUES
    (5, 14.75, TO_DATE('19/12/2020 0:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('19/12/2020 15:15', 'DD/MM/YYYY HH24:MI'), 9655.87 , 'BCN', 'LAX');

INSERT INTO flights VALUES
    (6, 3.1, TO_DATE('20/12/2020 9:40', 'DD/MM/YYYY HH24:MI'), TO_DATE('20/12/2020 12:46', 'DD/MM/YYYY HH24:MI'), 1953.32, 'MRS', 'IST');

INSERT INTO flights VALUES
    (7, 3, TO_DATE('16/12/2020 20:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('16/12/2020 23:30', 'DD/MM/YYYY HH24:MI'), 1864.50, 'BCN', 'WAW');

INSERT INTO flights VALUES
    (8, 16.5, TO_DATE('18/12/2020 18:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('19/12/2020 10:30', 'DD/MM/YYYY HH24:MI'), 9488.23, 'MRS', 'PVG');

INSERT INTO flights VALUES
    (9, 2.25, TO_DATE('24/12/2020 19:20', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/12/2020 21:35', 'DD/MM/YYYY HH24:MI'), 1107.39, 'CDG', 'FOC');

INSERT INTO flights VALUES
    (10, 2.66, TO_DATE('22/12/2020 0:50', 'DD/MM/YYYY HH24:MI'), TO_DATE('22/12/2020 03:30', 'DD/MM/YYYY HH24:MI'), 1435.93, 'FOC', 'LHR');

INSERT INTO flights VALUES
    (11, 2.4, TO_DATE('19/12/2020 05:12', 'DD/MM/YYYY HH24:MI'), TO_DATE('19/12/2020 7:36', 'DD/MM/YYYY HH24:MI'), 1461.93 , 'ATH', 'MXP');

INSERT INTO flights VALUES
    (12, 2.9, TO_DATE('25/12/2020 19:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/12/2020 21:54', 'DD/MM/YYYY HH24:MI'), 1683.08, 'LIS', 'MXP');

INSERT INTO flights VALUES
    (13, 15.9, TO_DATE('22/12/2020 4:50', 'DD/MM/YYYY HH24:MI'), TO_DATE('22/12/2020 20:44', 'DD/MM/YYYY HH24:MI'), 10436.27, 'NRT', 'TUN');

INSERT INTO flights VALUES
    (14, 3.75, TO_DATE('23/12/2020 23:20', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/12/2020 03:05', 'DD/MM/YYYY HH24:MI'), 2921.79, 'FRA', 'CAI');

INSERT INTO flights VALUES
    (15, 2.8, TO_DATE('22/12/2020 11:50', 'DD/MM/YYYY HH24:MI'), TO_DATE('22/12/2020 14:38', 'DD/MM/YYYY HH24:MI'), 1802.75, 'FRA', 'ATH');

INSERT INTO flights VALUES
    (16, 5.4, TO_DATE('19/12/2020 07:12', 'DD/MM/YYYY HH24:MI'), TO_DATE('19/12/2020 12:36', 'DD/MM/YYYY HH24:MI'), 13511.59 , 'CAI', 'LHR');

INSERT INTO flights VALUES
    (17, 2.9, TO_DATE('25/12/2020 19:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/12/2020 21:54', 'DD/MM/YYYY HH24:MI'), 7747.73, 'FOC', 'ORD');

INSERT INTO flights VALUES
    (18, 12.3, TO_DATE('25/12/2020 16:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('26/12/2020 04:48', 'DD/MM/YYYY HH24:MI'), 2093.77, 'PMI', 'WAW');

INSERT INTO flights VALUES
    (19, 4.6, TO_DATE('23/12/2020 20:00', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/12/2020 00:36', 'DD/MM/YYYY HH24:MI'), 2737.57, 'IST', 'MAD');

INSERT INTO flights VALUES
    (20, 1.4, TO_DATE('25/12/2020 17:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('25/12/2020 18:54', 'DD/MM/YYYY HH24:MI'), 523.79, 'VIE', 'BER');

INSERT INTO flights VALUES
    (21, 1.25, TO_DATE('24/12/2020 21:30', 'DD/MM/YYYY HH24:MI'), TO_DATE('24/12/2020 22:45', 'DD/MM/YYYY HH24:MI'), 555.7, 'VIE', 'WAW');


-- seats

INSERT INTO seats VALUES
    ('1.1', 'available', 'first class', 1);
    
INSERT INTO seats VALUES
    ('1.2', 'available', 'first class', 1);
    
INSERT INTO seats VALUES
    ('1.3', 'available', 'first class', 1);
    
INSERT INTO seats VALUES
    ('1.4', 'available', 'business class', 1);
    
INSERT INTO seats VALUES
    ('1.5', 'reserved', 'business class', 1);
    
INSERT INTO seats VALUES
    ('1.6', 'available', 'business class', 1);
    
INSERT INTO seats VALUES
    ('1.7', 'available', 'economy class', 1);
    
INSERT INTO seats VALUES
    ('1.8', 'reserved', 'economy class', 1);
    
INSERT INTO seats VALUES
    ('1.9', 'available', 'economy class', 1);
    
INSERT INTO seats VALUES
    ('1.10', 'unavailable', 'economy class', 1);
    
INSERT INTO seats VALUES
    ('2.1', 'available', 'first class', 2);
    
INSERT INTO seats VALUES
    ('2.2', 'available', 'first class', 2);
    
INSERT INTO seats VALUES
    ('2.3', 'available', 'first class', 2);
    
INSERT INTO seats VALUES
    ('2.4', 'available', 'business class', 2);
    
INSERT INTO seats VALUES
    ('2.5', 'available', 'business class', 2);
    
INSERT INTO seats VALUES
    ('2.6', 'available', 'business class', 2);
    
INSERT INTO seats VALUES
    ('2.7', 'unavailable', 'economy class', 2);
    
INSERT INTO seats VALUES
    ('2.8', 'available', 'economy class', 2);

INSERT INTO seats VALUES
    ('2.9', 'available', 'economy class', 2);
    
INSERT INTO seats VALUES
    ('2.10', 'available', 'economy class', 2);
    
INSERT INTO seats VALUES
    ('3.1', 'available', 'first class', 3);
    
INSERT INTO seats VALUES
    ('3.2', 'reserved', 'first class', 3);
    
INSERT INTO seats VALUES
    ('3.3', 'available', 'first class', 3);
    
INSERT INTO seats VALUES
    ('3.4', 'available', 'business class', 3);
    
INSERT INTO seats VALUES
    ('3.5', 'available', 'business class', 3);
    
INSERT INTO seats VALUES
    ('3.6', 'available', 'business class', 3);
    
INSERT INTO seats VALUES
    ('3.7', 'available', 'economy class', 3);
    
INSERT INTO seats VALUES
    ('3.8', 'available', 'economy class', 3);
    
INSERT INTO seats VALUES
    ('3.9', 'available', 'economy class', 3);
    
INSERT INTO seats VALUES
    ('3.10', 'available', 'economy class', 3);
    
INSERT INTO seats VALUES    
    ('4.1', 'available', 'first class', 4);
    
INSERT INTO seats VALUES
    ('4.2', 'available', 'first class', 4);
    
INSERT INTO seats VALUES
    ('4.3', 'available', 'first class', 4);
    
INSERT INTO seats VALUES
    ('4.4', 'available', 'business class', 4);
    
INSERT INTO seats VALUES
    ('4.5', 'available', 'business class', 4);
    
INSERT INTO seats VALUES
    ('4.6', 'available', 'business class', 4);
    
INSERT INTO seats VALUES
    ('4.7', 'available', 'economy class', 4);
    
INSERT INTO seats VALUES
    ('4.8', 'available', 'economy class', 4);
    
INSERT INTO seats VALUES
    ('4.9', 'available', 'economy class', 4);
    
INSERT INTO seats VALUES
    ('4.10', 'available', 'economy class', 4);
    
INSERT INTO seats VALUES
    ('5.1', 'available', 'first class', 5);
    
INSERT INTO seats VALUES
    ('5.2', 'reserved', 'first class', 5);
    
INSERT INTO seats VALUES
    ('5.3', 'available', 'first class', 5);
    
INSERT INTO seats VALUES
    ('5.4', 'available', 'business class', 5);
    
INSERT INTO seats VALUES
    ('5.5', 'available', 'business class', 5);
    
INSERT INTO seats VALUES
    ('5.6', 'available', 'business class', 5);

INSERT INTO seats VALUES
    ('5.7', 'available', 'economy class', 5);
    
INSERT INTO seats VALUES
    ('5.8', 'available', 'economy class', 5);

INSERT INTO seats VALUES
    ('5.9', 'available', 'economy class', 5);

INSERT INTO seats VALUES
    ('5.10', 'available', 'economy class', 5);

INSERT INTO seats VALUES    
    ('6.1', 'available', 'first class', 6);

INSERT INTO seats VALUES
    ('6.2', 'unavailable', 'business class', 6);
    
INSERT INTO seats VALUES
    ('6.3', 'available', 'economy class', 6);
    
INSERT INTO seats VALUES    
    ('7.1', 'available', 'first class', 7);

INSERT INTO seats VALUES
    ('7.2', 'reserved', 'economy class', 7);
    
INSERT INTO seats VALUES
    ('7.3', 'available', 'economy class', 7);
    
INSERT INTO seats VALUES    
    ('8.1', 'available', 'first class', 8);

INSERT INTO seats VALUES
    ('8.2', 'unavailable', 'business class', 8);
    
INSERT INTO seats VALUES
    ('8.3', 'available', 'economy class', 8);
    
INSERT INTO seats VALUES    
    ('9.1', 'available', 'first class', 9);

INSERT INTO seats VALUES
    ('9.2', 'available', 'economy class', 9);
    
INSERT INTO seats VALUES
    ('9.3', 'available', 'economy class', 9);
  
INSERT INTO seats VALUES  
    ('10.1', 'available', 'first class', 10);
    
INSERT INTO seats VALUES
    ('10.2', 'available', 'first class', 10);
    
INSERT INTO seats VALUES
    ('10.3', 'available', 'first class', 10);

INSERT INTO seats VALUES
    ('11.1', 'available', 'first class', 11);
    
INSERT INTO seats VALUES
    ('11.2', 'available', 'first class', 11);
    
INSERT INTO seats VALUES
    ('11.3', 'available', 'first class', 11);
    
INSERT INTO seats VALUES
    ('12.1', 'available', 'business class', 12);
    
INSERT INTO seats VALUES
    ('12.2', 'available', 'business class', 12);
    
INSERT INTO seats VALUES
    ('12.3', 'available', 'economy class', 12);

INSERT INTO seats VALUES    
    ('13.1', 'available', 'first class', 13);

INSERT INTO seats VALUES
    ('13.2', 'available', 'business class', 13);
    
INSERT INTO seats VALUES
    ('13.3', 'available', 'economy class', 13);
    
INSERT INTO seats VALUES    
    ('14.1', 'available', 'first class', 14);

INSERT INTO seats VALUES
    ('14.2', 'available', 'business class', 14);
    
INSERT INTO seats VALUES
    ('14.3', 'available', 'economy class', 14);
    
INSERT INTO seats VALUES    
    ('15.1', 'available', 'first class', 15);

INSERT INTO seats VALUES
    ('15.2', 'reserved', 'business class', 15);
    
INSERT INTO seats VALUES
    ('15.3', 'available', 'economy class', 15);
    
INSERT INTO seats VALUES    
    ('16.1', 'available', 'first class', 16);

INSERT INTO seats VALUES
    ('16.2', 'available', 'economy class', 16);
    
INSERT INTO seats VALUES
    ('16.3', 'available', 'economy class', 16);

INSERT INTO seats VALUES    
    ('17.1', 'available', 'first class', 17);

INSERT INTO seats VALUES
    ('17.2', 'available', 'business class', 17);
    
INSERT INTO seats VALUES
    ('17.3', 'available', 'economy class', 17);
    
INSERT INTO seats VALUES    
    ('18.1', 'available', 'first class', 18);

INSERT INTO seats VALUES
    ('18.2', 'available', 'business class', 18);
    
INSERT INTO seats VALUES
    ('18.3', 'available', 'economy class', 18);
    
INSERT INTO seats VALUES    
    ('19.1', 'available', 'first class', 19);

INSERT INTO seats VALUES
    ('19.2', 'available', 'economy class', 19);
    
INSERT INTO seats VALUES
    ('19.3', 'available', 'economy class', 19);

INSERT INTO seats VALUES    
    ('20.1', 'available', 'first class', 20);

INSERT INTO seats VALUES
    ('20.2', 'available', 'business class', 20);
    
INSERT INTO seats VALUES
    ('20.3', 'available', 'economy class', 20);
    
INSERT INTO seats VALUES    
    ('21.1', 'available', 'first class', 21);

INSERT INTO seats VALUES
    ('21.2', 'available', 'economy class', 21);
    
INSERT INTO seats VALUES
    ('21.3', 'available', 'economy class', 21);

--passengers

INSERT INTO passengers VALUES
    (1, 'Steven', 'King', 'sking@co.uk', '515-123-456', 'London', '', '', 'Gold');

INSERT INTO passengers VALUES
    (2, 'Neena', 'Kochhar','nkochhar@co.uk', '513-456-678', 'London', '', '', 'Silver');

INSERT INTO passengers VALUES
    (3, 'Lex', 'De Haan', 'ldehann@co.it', '678-980-123', 'Rome', '', '', 'Normal');
    
INSERT INTO passengers VALUES
    (4, 'Alexander', 'Hunold', 'ahunold@co.it', '562-345-767', 'Milan', '', '', 'Gold');
    
INSERT INTO passengers VALUES
    (5, 'Bruce', 'Ernest', 'bernest@co.us', '590.423.4568', 'Chicago', '', '', 'Normal');
    
INSERT INTO passengers VALUES
    (6, 'David', 'Austin', 'daustin@co.ge', '900-324-766', 'Berlin', '', '', 'Gold');

INSERT INTO passengers VALUES
    (7, 'Julia', 'Dark','jdark@co.ge', '513-456-678', 'Hamburg', '', '', 'Silver');

INSERT INTO passengers VALUES
    (8, 'Diana', 'Lorentz', 'dlorentz@co.fr', '278-900-123', 'Paris', '', '', 'Silver');
    
INSERT INTO passengers VALUES
    (9, 'Jan', 'Kowalski', 'jkowalski@co.pl', '234-567-890', 'Krakow', '', '', 'Normal');
    
INSERT INTO passengers VALUES
    (10, 'Will', 'Nester', 'wnester@co.fr', '591-423-328', 'Lyon', '', '', 'Normal');   




-- reservations

INSERT INTO reservations VALUES
    (1, 'waiting for approval', 156.32, TO_DATE('06/12/2020', 'DD/MM/YYYY'), TO_DATE('09/12/2020', 'DD/MM/YYYY'), '5.2', 5);
    
INSERT INTO reservations VALUES
    (2, 'waiting for approval', 225.5, TO_DATE('01/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '7.2', 7);
    
INSERT INTO reservations VALUES
    (3, 'waiting for approval', 89.75, TO_DATE('03/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '1.5', 8);
    
INSERT INTO reservations VALUES
    (4, 'waiting for approval', 156.32, TO_DATE('02/12/2020', 'DD/MM/YYYY'), TO_DATE('08/12/2020', 'DD/MM/YYYY'), '1.8', 9);
    
INSERT INTO reservations VALUES
    (5, 'waiting for approval', 225.5, TO_DATE('01/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '3.2', 1);
    
INSERT INTO reservations VALUES
    (6, 'waiting for approval', 89.75, TO_DATE('03/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '15.2', 6);
    
INSERT INTO reservations VALUES
    (7, 'approved', 156.32, TO_DATE('17/12/2020', 'DD/MM/YYYY'), NULL, '1.10', 2);
    
INSERT INTO reservations VALUES
    (8, 'approved', 225.5, TO_DATE('15/12/2020', 'DD/MM/YYYY'), NULL, '6.2', 4);
    
INSERT INTO reservations VALUES
    (9, 'approved', 45.9, TO_DATE('13/12/2020', 'DD/MM/YYYY'), NULL, '8.2', 10);
    
INSERT INTO reservations VALUES
    (10, 'approved', 199.52, TO_DATE('16/12/2020', 'DD/MM/YYYY'), NULL, '2.7', 9);
    
INSERT INTO reservations VALUES
    (11, 'cancelled', 127.5, TO_DATE('05/12/2020', 'DD/MM/YYYY'), NULL, '7.1', 8);
    
INSERT INTO reservations VALUES
    (12, 'cancelled', 300.0, TO_DATE('09/12/2020', 'DD/MM/YYYY'), NULL, '14.2', 5);
	
--new ones
	
INSERT INTO reservations VALUES
    (13, 'cancelled', 122.0, TO_DATE('06/11/2020', 'DD/MM/YYYY'), TO_DATE('09/12/2020', 'DD/MM/YYYY'), '5.2', 9);
	
INSERT INTO reservations VALUES
    (14, 'approved', 78.20, TO_DATE('30/12/2020', 'DD/MM/YYYY'), TO_DATE('09/01/2021', 'DD/MM/YYYY'), '21.3', 5);

-- discounts


SELECT * FROM discounts;

INSERT INTO discounts VALUES
    (1, 10.0, 'gold client', 5);
    
INSERT INTO discounts VALUES
    (2, 10.0, 'gold client', 6);
    
INSERT INTO discounts VALUES
    (3, 5.0, 'silver discount', 3);
    
INSERT INTO discounts VALUES
    (4, 5.0, 'silver discount', 2); 
     
INSERT INTO discounts VALUES
    (5, 1.0, 'happy hours', 3);
    
INSERT INTO discounts VALUES
    (6, 1.0, 'happy hours', 4);
    
INSERT INTO discounts VALUES
    (7, 10.0, 'gold client', 8);
    
INSERT INTO discounts VALUES
    (8, 5.0, 'silver client', 7);
    
INSERT INTO discounts VALUES
    (9, 5.0, 'silver client', 11);

INSERT INTO discounts VALUES
    (10, 1.0, 'happy hours', 1);
	
--new 
INSERT INTO discounts VALUES
    (11, 10.0, 'happy hours', 5);