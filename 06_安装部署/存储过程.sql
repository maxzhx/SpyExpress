
  CREATE OR REPLACE PROCEDURE "SPY"."PROC_HEAD" (my_year VARCHAR2,my_month VARCHAR2,res out NUMBER) AS
  --������ͼ
 my_sql VARCHAR2(600);
 my_view_name VARCHAR2(20);
 my_date VARCHAR2(20);
 my_sql_temp VARCHAR2(200);
 --�򱨱������µ�һ��
 insert_name VARCHAR2(50);  
 insert_date VARCHAR2(50);  
 insert_weight NUMBER(8,2);
 insert_volume NUMBER(8,2);
 insert_income NUMBER(8,2);
 insert_type NUMBER(8);
 --�쳣����
 unique_constraint EXCEPTION;
 wrong_format EXCEPTION;
 PRAGMA EXCEPTION_INIT(unique_constraint , -1);
BEGIN
  --���
  IF NOT(REGEXP_LIKE(my_year, '^[0-9]{2}$'))
  THEN
    RAISE  wrong_format;
  END IF;
  --�·�
  CASE my_month
    WHEN '00' THEN --�걨
      my_view_name:=my_year;
      my_date:='%-'|| my_year;
      my_sql_temp:=' and r.send_time like ''' || my_date|| '''';
      insert_date:=my_year||'�� ȫ��';
      insert_type:=1;
    WHEN '010203' THEN--��һ�����±�
      my_view_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and( r.send_time like ''%-1��'|| my_date||'''
      or r.send_time like ''%-2��'|| my_date||'''
      or r.send_time like ''%-3��'|| my_date||''' )';
      insert_date:=my_year||'�� ��һ����';
      insert_type:=2;            
    WHEN '040506' THEN --�ڶ������±�
      my_view_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like''%-4��'|| my_date||'''
      or r.send_time like ''%-5��'|| my_date||'''
      or r.send_time like ''%-6��'|| my_date||''')';
      insert_date:=my_year||'�� �ڶ�����';
      insert_type:=2;   
    WHEN '070809' THEN--���������±�
      my_view_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like''%-7��'|| my_date||'''
      or r.send_time like ''%-8��'|| my_date||'''
      or r.send_time like ''%-9��'|| my_date||''')';
      insert_date:=my_year||'�� ��������';
      insert_type:=2;   
    WHEN '101112' THEN--���ļ����±�
      my_view_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like ''%-10��'|| my_date||'''
      or r.send_time like ''%-11��'|| my_date||'''
      or r.send_time like ''%-12��'|| my_date||''')';
      insert_date:=my_year||'�� ���ļ���';
      insert_type:=2; 
    ELSE --�±�
      my_view_name:=my_year||'_'||my_month;
      IF(INSTR(my_month,'0',1,1)=1) THEN
         my_date:='%-'||SUBSTR(my_month,2,1)||'��%-'|| my_year;
      ELSE 
        my_date:='%-'||my_month||'��%-'|| my_year;
      END IF;
      my_sql_temp:=' and r.send_time like '''|| my_date||'''';
      insert_date:=my_year||'�� '|| my_month||'��';
      insert_type:=3; 
  END CASE;
  
   insert_name:='V_HEAD_' || my_view_name;
   
   my_sql:='
   CREATE OR REPLACE VIEW 
   ' || insert_name ||
   '(station_id,station_name,total_weight,total_volume,total_income)
    AS
    select 
    d.id ,
    d.name ,  
    sum(r.weight)  ,
    sum(r.volume) ,
    sum(r.income) 
    from tab_station d , tab_receipt r
    where  r.source_sta_id = d.id '
    || my_sql_temp||
   ' group by d.id,d.name';
   --dbms_output.put_line(my_sql);
   execute immediate my_sql;
   
  -- dbms_output.put_line(TO_CHAR (SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));

   my_sql:='select nvl(sum(total_weight),0) from '||insert_name;
   execute immediate my_sql into insert_weight;
   
   my_sql:='select nvl(sum(total_volume),0) from '||insert_name;
   execute immediate my_sql into insert_volume;
   
   my_sql:='select nvl(sum(total_income),0) from '||insert_name;
   execute immediate my_sql into insert_income;
   
   insert into TAB_REPORT
   values(insert_name,
   insert_date,
   SYSDATE,
   insert_weight,
   insert_volume,
   insert_income,
   null,
   insert_type);
   res:=1;
  EXCEPTION 
  WHEN  unique_constraint THEN
      --dbms_output.put_line('ɾ���ɵ�row�������µ�row');
      delete from TAB_REPORT where view_name=insert_name;
      insert into TAB_REPORT
      values(insert_name,
      insert_date,
      SYSDATE,
      insert_weight,
      insert_volume,
      insert_income,
      null,
      insert_type);
      res:=1;
  WHEN   wrong_format THEN
      dbms_output.put_line('��ʽ����');
      res:=0;
END PROC_HEAD;
/
 
  CREATE OR REPLACE PROCEDURE "SPY"."PROC_SUB_RECV" (dist_id NUMBER, my_year VARCHAR2,my_month VARCHAR2,res out NUMBER)AS
 --������ͼ
 my_sql VARCHAR2(600);
 my_table_name VARCHAR2(20);
 my_date VARCHAR2(20);
 my_sql_temp VARCHAR2(200);
 --�򱨱������µ�һ��
 insert_name VARCHAR2(50);  
 insert_date VARCHAR2(50);  
 insert_weight NUMBER(8,2);
 insert_volume NUMBER(8,2);
 insert_income NUMBER(8,2);
 insert_type NUMBER(8);
 --�쳣����
 unique_constraint EXCEPTION;
 wrong_format EXCEPTION;
 PRAGMA EXCEPTION_INIT(unique_constraint , -1);
BEGIN
  --���
  IF NOT(REGEXP_LIKE(my_year, '^[0-9]{2}$'))
  THEN
    RAISE  wrong_format;
  END IF;
  --�·�
  CASE my_month
    WHEN '00' THEN --�걨
      my_table_name:=my_year;
      my_date:='%-'|| my_year;
      my_sql_temp:=' and r.recv_time like ''' || my_date|| '''';
      insert_date:=my_year||'�� ȫ��';
      insert_type:=7; 
    WHEN '010203' THEN--��һ�����±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and( r.recv_time like ''%-1��'|| my_date||'''
      or r.recv_time like ''%-2��'|| my_date||'''
      or r.recv_time like ''%-3��'|| my_date||''' )';
      insert_date:=my_year||'�� ��һ����';    
      insert_type:=8;  
    WHEN '040506' THEN --�ڶ������±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.recv_time like''%-4��'|| my_date||'''
      or r.recv_time like ''%-5��'|| my_date||'''
      or r.recv_time like ''%-6��'|| my_date||''')';
      insert_date:=my_year||'�� �ڶ�����';
      insert_type:=8; 
    WHEN '070809' THEN--���������±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.recv_time like''%-7��'|| my_date||'''
      or r.recv_time like ''%-8��'|| my_date||'''
      or r.recv_time like ''%-9��'|| my_date||''')';
      insert_date:=my_year||'�� ��������';
      insert_type:=8; 
    WHEN '101112' THEN--���ļ����±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.recv_time like ''%-10��'|| my_date||'''
      or r.recv_time like ''%-11��'|| my_date||'''
      or r.recv_time like ''%-12��'|| my_date||''')';
      insert_date:=my_year||'�� ���ļ���';
      insert_type:=8; 
    ELSE 
      IF(my_month='01'or my_month='02' or my_month='03' or my_month='04' or my_month='05' or my_month='06' or my_month='07' 
      or my_month='08' or my_month='09' or my_month='10' or my_month='11'or my_month='12'  ) THEN
      --�±�
          my_table_name:=my_year||'_'||my_month;
          IF(INSTR(my_month,'0',1,1)=1) THEN
             my_date:='%-'||SUBSTR(my_month,2,1)||'��%-'|| my_year;
          ELSE 
            my_date:='%-'||my_month||'��%-'|| my_year;
          END IF;
          my_sql_temp:=' and r.recv_time like '''|| my_date||'''';
          insert_date:=my_year||'�� '|| my_month||'��';
          insert_type:=9; 
      ELSE
      --�����ʽ
        raise  wrong_format;
      END IF;
  END CASE;
  
 insert_name:='V_STA' ||dist_id|| '_RECV_'||my_table_name;
 my_sql:= '
  CREATE OR REPLACE VIEW 
  ' ||insert_name ||
  '(order_id, weight,volume,price,sender,receiver,recv_time) AS
  SELECT
  o.id, 
  o.weight,
  o.volume,
  o.price,
  customer.real_name,
  o.recv_name,
  r.recv_time
  FROM tab_order_receipt o_r, tab_station s, tab_receipt r, tab_order o, tab_customer customer
  WHERE  r.dest_sta_id= s.id
  and o_r.receipt_id=r.id
  and o_r.order_id=o.id
  and customer.id= o.send_customer_id
  and s.id='
  ||dist_id
  ||my_sql_temp;
 -- dbms_output.put_line(my_sql);
  execute immediate my_sql;

   my_sql:='select nvl(sum(weight),0) from '||insert_name;
   execute immediate my_sql into insert_weight;

   my_sql:='select nvl(sum(volume),0) from '||insert_name;
   execute immediate my_sql into insert_volume;
   
   my_sql:='select nvl(sum(price),0) from '||insert_name;
   execute immediate my_sql into insert_income;

   insert into TAB_REPORT
   values(insert_name,
   insert_date,
   SYSDATE,
   insert_weight,
   insert_volume,
   insert_income,
   dist_id,
   insert_type);
   res:=1;
   
EXCEPTION 
  WHEN  unique_constraint THEN
      --dbms_output.put_line('ɾ���ɵ�row�������µ�row');
      delete from TAB_REPORT where view_name=insert_name;
      insert into TAB_REPORT
      values(insert_name,
      insert_date,
      SYSDATE,
      insert_weight,
      insert_volume,
      insert_income,
      dist_id,
      insert_type);
      res:=1;
  WHEN   wrong_format THEN
      dbms_output.put_line('��ʽ����');
      res:=0;

END PROC_SUB_RECV;
/
 
  CREATE OR REPLACE PROCEDURE "SPY"."PROC_SUB_SEND" (dist_id NUMBER, my_year VARCHAR2,my_month VARCHAR2,res out NUMBER)AS
 --������ͼ
 my_sql VARCHAR2(600);
 my_table_name VARCHAR2(20);
 my_date VARCHAR2(20);
 my_sql_temp VARCHAR2(200);
 --�򱨱������µ�һ��
 insert_name VARCHAR2(50);  
 insert_date VARCHAR2(50);  
 insert_weight NUMBER(8,2);
 insert_volume NUMBER(8,2);
 insert_income NUMBER(8,2);
 insert_type NUMBER(8);
 --�쳣����
 unique_constraint EXCEPTION;
 wrong_format EXCEPTION;
 PRAGMA EXCEPTION_INIT(unique_constraint , -1);
BEGIN
  --���
  IF NOT(REGEXP_LIKE(my_year, '^[0-9]{2}$'))
  THEN
    RAISE  wrong_format;
  END IF;
  --�·�
  CASE my_month
    WHEN '00' THEN --�걨
      my_table_name:=my_year;
      my_date:='%-'|| my_year;
      my_sql_temp:=' and r.send_time like ''' || my_date|| '''';
      insert_date:=my_year||'�� ȫ��';
      insert_type:=4; 
    WHEN '010203' THEN--��һ�����±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and( r.send_time like ''%-1��'|| my_date||'''
      or r.send_time like ''%-2��'|| my_date||'''
      or r.send_time like ''%-3��'|| my_date||''' )';
      insert_date:=my_year||'�� ��һ����';    
      insert_type:=5;         
    WHEN '040506' THEN --�ڶ������±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like''%-4��'|| my_date||'''
      or r.send_time like ''%-5��'|| my_date||'''
      or r.send_time like ''%-6��'|| my_date||''')';
      insert_date:=my_year||'�� �ڶ�����';
      insert_type:=5; 
    WHEN '070809' THEN--���������±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like''%-7��'|| my_date||'''
      or r.send_time like ''%-8��'|| my_date||'''
      or r.send_time like ''%-9��'|| my_date||''')';
      insert_date:=my_year||'�� ��������';
      insert_type:=5; 
    WHEN '101112' THEN--���ļ����±�
      my_table_name:=my_year||'_'||my_month;
      my_date:= '%-'|| my_year;
      my_sql_temp:=' and (r.send_time like ''%-10��'|| my_date||'''
      or r.send_time like ''%-11��'|| my_date||'''
      or r.send_time like ''%-12��'|| my_date||''')';
      insert_date:=my_year||'�� ���ļ���';
      insert_type:=5; 
    ELSE
      IF(my_month='01'or my_month='02' or my_month='03' or my_month='04' or my_month='05' or my_month='06' or my_month='07' 
      or my_month='08' or my_month='09' or my_month='10' or my_month='11'or my_month='12'  ) THEN
      --�±�
          my_table_name:=my_year||'_'||my_month;
          IF(INSTR(my_month,'0',1,1)=1) THEN
             my_date:='%-'||SUBSTR(my_month,2,1)||'��%-'|| my_year;
          ELSE 
            my_date:='%-'||my_month||'��%-'|| my_year;
          END IF;
           my_sql_temp:=' and r.send_time like '''|| my_date||'''';
          insert_date:=my_year||'�� '|| my_month||'��';
          insert_type:=6; 
      ELSE
      --�����ʽ
        RAISE  wrong_format;
      END IF;
  END CASE;
  
  insert_name:='V_STA' ||dist_id|| '_SEND_'||my_table_name;
  my_sql:= '
  create or REPLACE VIEW 
  ' ||insert_name ||
  '(order_id, weight,volume,price,sender,receiver,send_time) AS
  SELECT 
  o.id, 
  o.weight,
  o.volume,
  o.price,
  customer.real_name,
  o.recv_name,
  r.send_time
  FROM tab_order_receipt o_r, tab_station s, tab_receipt r, tab_order o, tab_customer customer
  WHERE  r.source_sta_id= s.id
  and o_r.receipt_id=r.id
  and o_r.order_id=o.id
  and customer.id= o.send_customer_id
  and s.id='
  ||dist_id
  ||my_sql_temp;
  dbms_output.put_line(my_sql);
  execute immediate my_sql;
  
  my_sql:='select nvl(sum(weight),0) from '||insert_name;
   execute immediate my_sql into insert_weight;

   my_sql:='select nvl(sum(volume),0) from '||insert_name;
   execute immediate my_sql into insert_volume;
   
   my_sql:='select nvl(sum(price),0) from '||insert_name;
   execute immediate my_sql into insert_income;

   insert into TAB_REPORT
   values(insert_name,
   insert_date,
   SYSDATE,
   insert_weight,
   insert_volume,
   insert_income,
   dist_id,
   insert_type);
   res:=1;
   
  EXCEPTION 
  WHEN  unique_constraint THEN
      --dbms_output.put_line('ɾ���ɵ�row�������µ�row');
      delete from TAB_REPORT where view_name=insert_name;
      insert into TAB_REPORT
      values(insert_name,
      insert_date,
      SYSDATE,
      insert_weight,
      insert_volume,
      insert_income,
      dist_id,
      insert_type);
      res:=1;
  WHEN   wrong_format THEN
      dbms_output.put_line('��ʽ����');
      res:=0;
END PROC_SUB_SEND;
/
 