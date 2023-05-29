# delta-task2

Task 2
To streamline the hostel and mess management setup, you are required to automate it with the help of docker.

Normal Mode
Dockerise Task 1
You need to dockerise the server setup done in task 1.
Using an appropriate base image (eg. Ubuntu), copy all the scripts to the appropriate locations and run them accordingly.
Display the mess file
In Task 1, HAD had mess.txt file containing mess capacity and roll numbers in the order of priority. College admin wants to be able to view that file.

Display the file using Apache from the local directory of the docker container. Proxy the requests to the container.
Make the file accessible locally using gamma-z.hm instead of default localhost. Opening gamma-z.hm should display the text file directly.
Store user details in Database
Create a database to store all the user details instead of the files in the students' directory.
Use only MySQL or PostgreSQL. SQLite is not allowed. You may use any programming language to do the above. Use raw SQL queries to do this, do not use ORMs (eg. SQLAlchemy).
Dockerise the database along with the server. Use docker-compose.
SuperUser Mode
Setup a cronjob to periodically take database backup. The backup should take place at 10:10 every three days of month and on sundays for May, June and August. Do not setup multiple cronjobs.

Modify the docker setup to ensure that restarting docker will not destroy the data from database.

Add PHPMyAdmin docker service for viewing the database. Also create an account in PHPMyAdmin with read-only permissions to read the user details in the DB.

Create a website to display the user details based on their permissions (similar to those in task 1). You can use PHP, Node.JS-Express or Flask to create the backend. You are not allowed to use frameworks like Django or Laravel.

Implement login feature with userid and password. Get the permissions based on the logged in userid.
HAD should be able to see everyone's details.
Wardens should be able to see only their hostel's student's details.
Students should only be able to see their own details.

Note: You need not focus too much on the design of the website. It can be made with simple HTML and CSS. You are allowed to use Bootstrap if you do not wish to write CSS.
