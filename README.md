:blue_book:

# Big Data Playground
> Prepared Course Material for Survey of Database Systems, on a quick runthrough of Big Data concepts using MongoDB (a NoSQL database) and Hive (an OLAP SQL access tool)

<div style="text-align:center">
  <img src="http://hortonworks.com/wp-content/uploads/2016/03/hive_logo.png" 
  width="150px;" align="center"/>
  <img src="https://www.servernoobs.com/wp-content/uploads/2016/01/mongodb-logo-1.png" width="150px;" align="center"/>
</div>

## Instructions
To run MongoDB and Apache Hive, simply run `docker-compose up` and it will spin up the containers for you automagically!

You can graphically access the contents of the MongoDB database on `<localhost|dockerport>:8081`

To access Hive and execute SQL commands, run: 
  1.) `docker exec -i -t hive bash`, which allows us to access the Docker Hive container
  2.) `hive -f /hive_init/hive_init.sql`, which runs the initialization SQL script (which creates the databases, tables and loads the CSV data of our databases). For fun, check out the `hive/hive_init.sql` in this repository for more information
  2.) `hive`, which then opens up the Hive CLI from within the Hive Docker container
  4.) Run whatever SQL you want to execute and see the outputs!
