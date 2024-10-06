import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config:
	SECRET_KEY = "2F5F6CE5AE30B54AA5D7CED1BA566982BAB34BA2814A51CE1865D2C2D8815CD4"
	SQLALCHEMY_DATABASE_URI = "postgresql://microblogger_owner:ti3Qc4oZjyLp@ep-round-firefly-a7wqlwt3.ap-southeast-2.aws.neon.tech/microblogger?sslmode=require"
	SQLALCHEMY_TRACK_MODIFICATIONS = False
	PRODUCTION_MODE = False #This states whether the app runs in DEBUG MODE or not
	PORT_NUMBER = 8080
	HOST_NAME = 'localhost'