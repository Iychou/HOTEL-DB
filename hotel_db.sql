--tables of users
--alter to hotel_db
ALTER SESSION SET CONTAINER=hotel_db;
-------------------------------------
-------------------------------------
--connecter à l'utilisateur
------------------------------------
-------------------------------------
--table de personne
CREATE TABLE personne (
    person_id NUMBER PRIMARY KEY,
    nom_complet VARCHAR2(100),
    cin VARCHARé(10)
    mail VARCHAR2(100),
    tel VARCHAR2(20) 
) TABLESPACE personne;
CREATE INDEX idx_person_cin ON person(cin); 
CREATE INDEX idx_person_nom_complet ON person(nom_complet);
--table de client
CREATE TABLE client (
    client_id NUMBER PRIMARY KEY,
    point_fidelite NUMBER,
    FOREIGN KEY (client_id) REFERENCES person(person_id)
) TABLESPACE personne;
--table d'employee
CREATE TABLE Employee (
    employee_id     NUMBER PRIMARY KEY,
    salaire       NUMBER(10,2) NOT NULL,
    poste         VARCHAR2(50) NOT NULL,
    departement   VARCHAR2(50)
    FOREIGN KEY (employee_id) REFERENCES person(person_id)
)TABLESPACE personne;

--table de chambre
CREATE TABLE chambre (
    chambre_id NUMBER PRIMARY KEY,
    num_chambre VARCHAR2(10),
    type VARCHAR2(20),
    prix NUMBER,
    status VARCHAR2(30)
) TABLESPACE reservation;
CREATE INDEX idx_chambre_num ON chambre(num_chambre);
CREATE INDEX idx_chambre_type ON chambre(type);

--table de reservation
CREATE TABLE reservation (
    reservation_id NUMBER PRIMARY KEY,
    client_id NUMBER,
    chambre_id NUMBER,
    status VARCHAR2(30),
    date_debut DATE,
    date_fin DATE,
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT fk_chambre FOREIGN KEY (chambre_id) REFERENCES chambre(chambre_id)
) TABLESPACE reservation;
CREATE INDEX idx_reservation_client ON Reservation(client_id);   
CREATE INDEX idx_reservation_chambre ON Reservation(chambre_id);

--table de facturation
CREATE TABLE facturation (
    facture_id NUMBER PRIMARY KEY,
    reservation_id NUMBER,
    somme NUMBER,
    date DATE
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
) TABLESPACE facturation;
CREATE INDEX idx_facturation_reservation ON Facturation(reservation_id);












  
