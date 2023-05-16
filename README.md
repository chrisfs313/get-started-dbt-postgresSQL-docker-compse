# get-started-dbt-postgresSQL-docker-compse
Project with Docker and Docker-Compose: Raise a PostgreSQL and a DBT with a base project and base schema, the commands to execute it, in the project root:

- LocalDevUp.ps1 -> To build the whole project, it will check the consistency of the DBT project and automatically enter the container so that the user can call their own DBT commands.
- LocalDevDown.ps1 -> To clean it up and start over

Technologies involved:
- postgresql
- DBT version: 1.2.3
- Python version: 3.10.7
- shell scripts
- PowerShell scripts
- pgAdmin: To view the database in a web environment

Now enter pgAdmin and connect like this:
- In your web browser: http://localhost:5050/
- Login credentials: admin@admin.com and postgres

Once entered, we click on Add Server and put the following:
- Name : dbt demo
- Host Name : postgres
- User : postgres
- Password : postgres
