:blue_book:

# Big Data Playground
> Prepared Course Material for Survey of Database Systems, on a quick runthrough of Big Data concepts using MongoDB (a NoSQL database) and Hive (an OLAP SQL access tool)

<div style="text-align:center">
  <img src="http://hortonworks.com/wp-content/uploads/2016/03/hive_logo.png" width="150px;" align="center"/>
  <img src="https://www.servernoobs.com/wp-content/uploads/2016/01/mongodb-logo-1.png" width="150px;" align="center"/>
</div>

## Instructions
First, make sure to have Docker installed (based on your operating system). [Install is through here!](https://www.docker.com/) After you have Docker installed, make sure it's running fine by issuing the commands `docker -v` and `docker-compose -v`

After, `cd` into the folder where this project is under. Simply run `docker-compose up` and it will spin up the containers for you automagically!

You can graphically access the contents of the MongoDB database on `<localhost|dockerport>:8081`

* To access Hive and execute SQL commands, run: 

  1. `docker exec -i -t hive bash`, which allows us to access the Hive Docker container's shell
  
  2. `hive -f /hive_init/init.sql`, which runs the initialization SQL script (which creates the databases, tables and loads the CSV data of our databases). For fun, check out the `hive/hive_init.sql` file in this repository for more information
  
  3. `hive`, which then opens up the Hive CLI from within the Hive Docker container
  
  4. Run whatever SQL you want to execute and see the outputs!

* To access MongoDB and execute MongoDB queries:
  
  1. `docker exec -i -t mongo bash`, which allows us to access the MongoDB Docker container's shell
  
  2. `chmod +x /mongo_init/init.sh`, which runs the initialization shell script (creates the MongoDB databases, collections and loads the JSON data of our databases). For fun, check out the `mongo/init.sh` file in this repository for more information
  
  3. Go to your browser, navigate to `<localhost|dockerport>:8081`
  
  4. See your data and execute queries as you please
  