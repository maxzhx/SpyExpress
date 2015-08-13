
  CREATE TABLE "SPY"."TAB_ADMIN" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"PASS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"REAL_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"SEX" CHAR(2 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"OCCUPATION" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"ROLE_ID" NUMBER(8,0), 
	"STATION_ID" NUMBER(8,0), 
	 CONSTRAINT "PK_USER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "TAB_ADMIN_NAME" UNIQUE ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_TAB_ADMIN_TAB_DISTRIBUTION" FOREIGN KEY ("STATION_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_USER_ROLE" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "SPY"."TAB_ROLE" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE UNIQUE INDEX "SPY"."PK_USER" ON "SPY"."TAB_ADMIN" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 
  CREATE UNIQUE INDEX "SPY"."TAB_ADMIN_UK1" ON "SPY"."TAB_ADMIN" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_CUSTOMER" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"PASS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"REAL_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"MOBILEPHONE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"UNITPHONE" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"SEX" CHAR(2 BYTE), 
	 CONSTRAINT "PK_PERSON" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_ORDER" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"SEND_TIME" DATE, 
	"RECV_TIME" DATE, 
	"STATUS" NUMBER(8,0) NOT NULL ENABLE, 
	"NOTE" VARCHAR2(50 BYTE), 
	"PATH" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"WEIGHT" NUMBER(8,2), 
	"VOLUME" NUMBER(8,2), 
	"PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"RECV_NAME" NVARCHAR2(50) NOT NULL ENABLE, 
	"RECV_PHONE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"RECV_ADDRESS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"SEND_CUSTOMER_ID" NUMBER(8,0), 
	"STA_ID" NUMBER(8,0), 
	 CONSTRAINT "PK_ORDER" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_TAB_ORDER_TAB_CUSTOMER" FOREIGN KEY ("SEND_CUSTOMER_ID")
	  REFERENCES "SPY"."TAB_CUSTOMER" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_TAB_ORDER_TAB_STATION" FOREIGN KEY ("STA_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_ORDER_RECEIPT" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"STATUS" NUMBER(8,0), 
	"ORDER_ID" NUMBER(8,0), 
	"RECEIPT_ID" NUMBER(8,0), 
	 CONSTRAINT "PK_TAB_ORDER_RECEIPT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_TAB_ORDER_RECEIPT_TAB_ORDER" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "SPY"."TAB_ORDER" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_TAB_ORDER_RECEI_TAB_RECEIPT" FOREIGN KEY ("RECEIPT_ID")
	  REFERENCES "SPY"."TAB_RECEIPT" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_RECEIPT" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"SEND_TIME" DATE, 
	"RECV_TIME" DATE, 
	"WEIGHT" NUMBER(8,2) NOT NULL ENABLE, 
	"VOLUME" NUMBER(8,2) NOT NULL ENABLE, 
	"INCOME" NUMBER(8,2) NOT NULL ENABLE, 
	"STATUS" NUMBER(8,0) NOT NULL ENABLE, 
	"SOURCE_STA_ID" NUMBER(8,0), 
	"DEST_STA_ID" NUMBER(8,0), 
	"CARRIER_ID" NUMBER(8,0), 
	"RECIPIENT_ID" NUMBER(8,0), 
	 CONSTRAINT "PK_RECEIPT" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_RECEIPT_ADMIN_1" FOREIGN KEY ("RECIPIENT_ID")
	  REFERENCES "SPY"."TAB_ADMIN" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_RECEIPT_ADMIN_2" FOREIGN KEY ("CARRIER_ID")
	  REFERENCES "SPY"."TAB_ADMIN" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_RECEIPT_DISTRIBUTION" FOREIGN KEY ("SOURCE_STA_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_RECEIPT_TAB_DISTRIBUTI" FOREIGN KEY ("DEST_STA_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_REPORT" 
   (	"VIEW_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"RP_DATE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"GN_DATE" DATE NOT NULL ENABLE, 
	"TOTAL_WEIGHT" NUMBER(8,2), 
	"TOTAL_VOLUME" NUMBER(8,2), 
	"TOTAL_INCOME" NUMBER(8,2), 
	"STATION_ID" NUMBER(8,0), 
	"RP_TYPE" NUMBER(8,0) NOT NULL ENABLE, 
	 CONSTRAINT "PK_REPORT" PRIMARY KEY ("VIEW_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_REPORT_TAB_STATION" FOREIGN KEY ("STATION_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_ROLE" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"VEHICLE" NUMBER, 
	"STATION" NUMBER, 
	"SCOPE" NUMBER, 
	"RECEIPT" NUMBER, 
	"ORDERS" NUMBER, 
	"REPORT" NUMBER, 
	"USERS" NUMBER, 
	 CONSTRAINT "PK_ROLE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_SCOPE" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"FIRST_KG_PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"KG_PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"FIRST_CUBIC_PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"CUBIC_PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"DURATION" NUMBER(8,0) NOT NULL ENABLE, 
	"NOTE" VARCHAR2(50 BYTE), 
	"SOURCE_STA_ID" NUMBER(8,0), 
	"DEST_STA_ID" NUMBER(8,0), 
	 CONSTRAINT "PK_DISTRIBUTIONSCOPE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_DS_D_1" FOREIGN KEY ("SOURCE_STA_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "FK_DS_D_2" FOREIGN KEY ("DEST_STA_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_STATION" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"NOTE" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	 CONSTRAINT "PK_DISTRIBUTION" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "SPY"."TAB_VEHICLE" 
   (	"ID" NUMBER(8,0) NOT NULL ENABLE, 
	"TIME_BUYING" DATE, 
	"MANUFACTURER" VARCHAR2(50 BYTE), 
	"MODEL" VARCHAR2(50 BYTE), 
	"CAPACITY" NUMBER(8,2) NOT NULL ENABLE, 
	"VOLUME" NUMBER(8,2) NOT NULL ENABLE, 
	"STATUS" NUMBER(8,0) NOT NULL ENABLE, 
	"SOURCE_ID" NUMBER(8,0), 
	"DEST_ID" NUMBER(8,0), 
	"RECEIPT_ID" NUMBER(8,0), 
	"LICENSE" VARCHAR2(50 BYTE), 
	 CONSTRAINT "PK_VEHICLE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_TAB_VEHICLE_TAB_STATION" FOREIGN KEY ("DEST_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_VEHICLE_DISTRIBUTION" FOREIGN KEY ("SOURCE_ID")
	  REFERENCES "SPY"."TAB_STATION" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_VEHICLE_RECEIPT" FOREIGN KEY ("RECEIPT_ID")
	  REFERENCES "SPY"."TAB_RECEIPT" ("ID") ON DELETE SET NULL ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
 
