from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from MicroBloggerCore.config import Config
from flask_cors import CORS
from flask_script import Manager
from flask_migrate import Migrate
from flask_caching import Cache

db = SQLAlchemy()
cache = Cache()
migrate = None
manager = None

config = {
    "DEBUG": False,          # some Flask specific configs
    "CACHE_TYPE": "simple", # Flask-Caching related configs
    "CACHE_DEFAULT_TIMEOUT": 300
}

def create_app(config_class=Config):
	app = Flask(__name__)
	app.config.from_object(Config)
	db.init_app(app)
	CORS(app)
	cache.init_app(app, config=config)
	migrate = Migrate(app, db, render_as_batch=True)
	manager = Manager(app)

	#Import all your blueprints
	from MicroBloggerCore.main.routes import main
	
	#use the url_prefix arguement if you need prefixes for the routes in the blueprint
	app.register_blueprint(main)

	return app

#Helper function to create database file directly from terminal
def create_database():
	import MicroBloggerCore.models
	print("Creating App & Database")
	app = create_app()
	with app.app_context():
		db.create_all()
		db.session.commit()
	print("Successfully Created Database")