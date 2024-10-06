This is the way a basic MicroBloggerCore App is Structured
run.py is the runner of your App
Create a Virtual environment called venv using virtualenv

MicroBloggerCore /
	__init__.py handles the creation of the app, blueprint registration and more
	config.py has some variables that can alter the way the app works
	models.py contains your FlaskSQLAlchemy database models
	/static - static assets
	/main - This is your first blueprint module
		__init__.py tells python that this is a python module
		routes.py actually has all the routes served under that blueprint! You write most of your code there.
	
	As you create new blueprint modules, import them and add them to __init__.py in the project root.
	To Create database:
		-> Open Terminal
		-> activate virtual environment
		-> run "from MicroBloggerCore import create_database
				create_database()"
		-> Your database has been created!

To run the app:
	-> activate virtual environment
	-> python run.py

	(or)

	run start.bat
