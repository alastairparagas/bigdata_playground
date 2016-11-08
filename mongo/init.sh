mongo --eval "use company"
mongo --eval "db.createCollection('department')"
mongo --eval "db.createCollection('dependent')"
mongo --eval "db.createCollection('dept_locations')"
mongo --eval "db.createCollection('employee')"
mongo --eval "db.createCollection('project')"
mongo --eval "db.createCollection('works_on')"
mongoimport --db company --collection department --drop --file /data/company/department.json --jsonArray
mongoimport --db company --collection dependent --drop --file /data/company/dependent.json --jsonArray
mongoimport --db company --collection dept_locations --drop --file /data/company/dept_locations.json --jsonArray
mongoimport --db company --collection employee --drop --file /data/company/employee.json --jsonArray
mongoimport --db company --collection project --drop --file /data/company/project.json --jsonArray
mongoimport --db company --collection works_on --drop --file /data/company/works_on.json --jsonArray

mongo --eval "use premiere"
mongo --eval "db.createCollection('customer')"
mongo --eval "db.createCollection('orderline')"
mongo --eval "db.createCollection('orders')"
mongo --eval "db.createCollection('part')"
mongo --eval "db.createCollection('rep')"
mongoimport --db premiere --collection customer --drop --file /data/premiere/Customer.json --jsonArray
mongoimport --db premiere --collection orderline --drop --file /data/premiere/OrderLine.json --jsonArray
mongoimport --db premiere --collection orders --drop --file /data/premiere/Orders.json --jsonArray
mongoimport --db premiere --collection part --drop --file /data/premiere/Part.json --jsonArray
mongoimport --db premiere --collection rep --drop --file /data/premiere/Rep.json --jsonArray
