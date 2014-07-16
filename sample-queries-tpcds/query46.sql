
select  c_last_name
       ,c_first_name
       ,ca_city
       ,bought_city
       ,ss_ticket_number
       ,amt,profit 
 from
   (select ss_ticket_number
          ,ss_customer_sk
          ,ca_city as bought_city
          ,sum(ss_coupon_amt) as amt
          ,sum(ss_net_profit) as profit
    from store_sales
         JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
         JOIN store ON store_sales.ss_store_sk = store.s_store_sk  
         JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
         JOIN customer_address ON store_sales.ss_addr_sk = customer_address.ca_address_sk
    where
        (household_demographics.hd_dep_count = 5 or
         household_demographics.hd_vehicle_count= 3)
    and date_dim.d_dow in (6,0)
    and date_dim.d_year in (1999,1999+1,1999+2) 
    and ss_sold_date in (
        '1998-01-04', '1998-01-05', '1998-01-11', '1998-01-12', '1998-01-18', '1998-01-19', 
        '1998-01-25', '1998-01-26', '1998-02-01', '1998-02-02', '1998-02-08', '1998-02-09', 
        '1998-02-15', '1998-02-16', '1998-02-22', '1998-02-23', '1998-03-01', '1998-03-02', 
        '1998-03-08', '1998-03-09', '1998-03-15', '1998-03-16', '1998-03-22', '1998-03-23', 
        '1998-03-29', '1998-03-30', '1998-04-05', '1998-04-06', '1998-04-12', '1998-04-13', 
        '1998-04-19', '1998-04-20', '1998-04-26', '1998-04-27', '1998-05-03', '1998-05-04', 
        '1998-05-10', '1998-05-11', '1998-05-17', '1998-05-18', '1998-05-24', '1998-05-25', 
        '1998-05-31', '1998-06-01', '1998-06-07', '1998-06-08', '1998-06-14', '1998-06-15', 
        '1998-06-21', '1998-06-22', '1998-06-28', '1998-06-29', '1998-07-05', '1998-07-06', 
        '1998-07-12', '1998-07-13', '1998-07-19', '1998-07-20', '1998-07-26', '1998-07-27', 
        '1998-08-02', '1998-08-03', '1998-08-09', '1998-08-10', '1998-08-16', '1998-08-17', 
        '1998-08-23', '1998-08-24', '1998-08-30', '1998-08-31', '1998-09-06', '1998-09-07', 
        '1998-09-13', '1998-09-14', '1998-09-20', '1998-09-21', '1998-09-27', '1998-09-28', 
        '1998-10-04', '1998-10-05', '1998-10-11', '1998-10-12', '1998-10-18', '1998-10-19', 
        '1998-10-25', '1998-10-26', '1998-11-01', '1998-11-02', '1998-11-08', '1998-11-09',
        '1998-11-15', '1998-11-16', '1998-11-22', '1998-11-23', '1998-11-29', '1998-11-30',
        '1998-12-06', '1998-12-07', '1998-12-13', '1998-12-14', '1998-12-20', '1998-12-21',
        '1998-12-27', '1998-12-28', '1999-01-03', '1999-01-04', '1999-01-10', '1999-01-11',
        '1999-01-17', '1999-01-18', '1999-01-24', '1999-01-25', '1999-01-31', '1999-02-01',
        '1999-02-07', '1999-02-08', '1999-02-14', '1999-02-15', '1999-02-21', '1999-02-22',
        '1999-02-28', '1999-03-01', '1999-03-07', '1999-03-08', '1999-03-14', '1999-03-15',
        '1999-03-21', '1999-03-22', '1999-03-28', '1999-03-29', '1999-04-04', '1999-04-05',
        '1999-04-11', '1999-04-12', '1999-04-18', '1999-04-19', '1999-04-25', '1999-04-26',
        '1999-05-02', '1999-05-03', '1999-05-09', '1999-05-10', '1999-05-16', '1999-05-17',
        '1999-05-23', '1999-05-24', '1999-05-30', '1999-05-31', '1999-06-06', '1999-06-07',
        '1999-06-13', '1999-06-14', '1999-06-20', '1999-06-21', '1999-06-27', '1999-06-28',
        '1999-07-04', '1999-07-05', '1999-07-11', '1999-07-12', '1999-07-18', '1999-07-19',
        '1999-07-25', '1999-07-26', '1999-08-01', '1999-08-02', '1999-08-08', '1999-08-09',
        '1999-08-15', '1999-08-16', '1999-08-22', '1999-08-23', '1999-08-29', '1999-08-30',
        '1999-09-05', '1999-09-06', '1999-09-12', '1999-09-13', '1999-09-19', '1999-09-20',
        '1999-09-26', '1999-09-27', '1999-10-03', '1999-10-04', '1999-10-10', '1999-10-11',
        '1999-10-17', '1999-10-18', '1999-10-24', '1999-10-25', '1999-10-31', '1999-11-01',
        '1999-11-07', '1999-11-08', '1999-11-14', '1999-11-15', '1999-11-21', '1999-11-22',
        '1999-11-28', '1999-11-29', '1999-12-05', '1999-12-06', '1999-12-12', '1999-12-13',
        '1999-12-19', '1999-12-20', '1999-12-26', '1999-12-27', '2000-01-02', '2000-01-03',
        '2000-01-09', '2000-01-10', '2000-01-16', '2000-01-17', '2000-01-23', '2000-01-24',
        '2000-01-30', '2000-01-31', '2000-02-06', '2000-02-07', '2000-02-13', '2000-02-14',
        '2000-02-20', '2000-02-21', '2000-02-27', '2000-02-28', '2000-03-05', '2000-03-06',
        '2000-03-12', '2000-03-13', '2000-03-19', '2000-03-20', '2000-03-26', '2000-03-27',
        '2000-04-02', '2000-04-03', '2000-04-09', '2000-04-10', '2000-04-16', '2000-04-17',
        '2000-04-23', '2000-04-24', '2000-04-30', '2000-05-01', '2000-05-07', '2000-05-08',
        '2000-05-14', '2000-05-15', '2000-05-21', '2000-05-22', '2000-05-28', '2000-05-29',
        '2000-06-04', '2000-06-05', '2000-06-11', '2000-06-12', '2000-06-18', '2000-06-19',
        '2000-06-25', '2000-06-26', '2000-07-02', '2000-07-03', '2000-07-09', '2000-07-10',
        '2000-07-16', '2000-07-17', '2000-07-23', '2000-07-24', '2000-07-30', '2000-07-31',
        '2000-08-06', '2000-08-07', '2000-08-13', '2000-08-14', '2000-08-20', '2000-08-21',
        '2000-08-27', '2000-08-28', '2000-09-03', '2000-09-04', '2000-09-10', '2000-09-11',
        '2000-09-17', '2000-09-18', '2000-09-24', '2000-09-25', '2000-10-01', '2000-10-02',
        '2000-10-08', '2000-10-09', '2000-10-15', '2000-10-16', '2000-10-22', '2000-10-23',
        '2000-10-29', '2000-10-30', '2000-11-05', '2000-11-06', '2000-11-12', '2000-11-13',
        '2000-11-19', '2000-11-20', '2000-11-26', '2000-11-27', '2000-12-03', '2000-12-04',
        '2000-12-10', '2000-12-11', '2000-12-17', '2000-12-18', '2000-12-24', '2000-12-25',
        '2000-12-31', '2001-01-01'
    )
    and store.s_city in ('Midway','Fairview','Fairview','Fairview','Fairview') 
    group by ss_ticket_number,ss_customer_sk,ss_addr_sk,ca_city) dn
  JOIN customer ON dn.ss_customer_sk = customer.c_customer_sk
  JOIN customer_address ON customer.c_current_addr_sk = customer_address.ca_address_sk
    where
      customer_address.ca_city <> dn.bought_city
  order by c_last_name
          ,c_first_name
          ,ca_city
          ,bought_city
          ,ss_ticket_number
  limit 100;
