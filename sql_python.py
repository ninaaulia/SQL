pip install mysql-connector-python  #install mysql connector

import mysql.connector   #import library
import pandas as pd


mydb = mysql.connector.connect(
        host = 'localhost',
        user = '....',   #masukan user
        passwd = '....', #masuka password
        database = '....')  #databas sql yang akan digunakan



#crete access to database
mycursor = mydb.cursor()

#write query
query = "select * from orders"

#execute query
mycursor.execute(query)

#save result in result variable
result = mycursor.fetchall()

#convert to dataframe and open it
df = pd.DataFrame(result, columns = mycursor.column_names)
print(df.head(5))





# another example
mycursor = mydb.cursor()

#create function
def sql_df(yourQuery):
    mycursor.execute(yourQuery)
    myresult = mycursor.fetchall()
    df = pd.DataFrame(myresult, columns = mycursor.column_names)
    return df.head()

#masukan perintah yang diinginkan sesuai keinginan
sql_df(
    '''
select concat_ws(' ', contactFirstName, contactLastName) as fullname, 
    phone, addressLine1 as address, country, creditLimit
from customers
where country = 'USA' And creditLimit != 0.00
order by fullname;
    
    '''

)



# sql_df(
#     '''
#     with nama_customer as (select concat_ws(' ', contactFirstName, contactLastName) as fullname, country, creditLimit
#                             from customers)
                            
#     select fullname, sum(creditLimit) over() creditLimits
#     from nama_customer
#     where country = 'USA'
#     order by country;
#     ''')