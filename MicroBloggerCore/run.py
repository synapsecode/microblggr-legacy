from MicroBloggerCore import create_app
from MicroBloggerCore.config import Config

app = create_app()

config = Config()
if __name__ == '__main__':
	#Runs on localhost:8080
	app.run(debug=not config.PRODUCTION_MODE, host=config.HOST_NAME, port=config.PORT_NUMBER)
