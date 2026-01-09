# HOTEL-DB
Vérifier s’il existe déjà un wallet (normalement NON)
	>> SELECT * FROM v$encryption_wallet;
	STATUS = NOT_AVAILABLE
	
Créer le dossier du wallet (OS)
	>>mkdir -p '/opt/app/oracle/admin/ORCL/wallet'
	
Déclarer l’emplacement du wallet; 

	>>$ORACLE_HOME/network/admin/sqlnet.ora
	ENCRYPTION_WALLET_LOCATION =
	 (SOURCE =
	   (METHOD = FILE)
	   (METHOD_DATA =
	     (DIRECTORY = /u01/app/oracle/admin/ORCL/wallet)
	   )
	 )
	
Redémarrer la base 

Créer le Wallet (Keystore)
	>>ADMINISTER KEY MANAGEMENT CREATE KEYSTORE
		'/u01/app/oracle/admin/ORCL/wallet'
		IDENTIFIED BY TDEpwd123;
		
Ouvrir le Wallet
	>> 
	ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN
	IDENTIFIED BY TDEpwd123;

Créer la clé maître (OBLIGATOIRE)
	>>
	ADMINISTER KEY MANAGEMENT SET KEY
	IDENTIFIED BY TDEpwd123
	WITH BACKUP;
	
Créer un tablespace chiffré dans la pdb
	>>
	CREATE TABLESPACE secure_ts
	DATAFILE 'secure_ts01.dbf'
	SIZE 50M
	ENCRYPTION USING 'AES256'
	DEFAULT STORAGE (ENCRYPT);
	
Verification DBA 
	>>
	SELECT tablespace_name, encrypted
	FROM dba_tablespaces
WHERE tablespace_name = 'SECURE_TS';<img width="533" height="1098" alt="image" src="https://github.com/user-attachments/assets/8fdbc62e-c933-45cf-a1b8-dba0e2e25999" />
