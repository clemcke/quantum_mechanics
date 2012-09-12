# Load the rails application
require File.expand_path('../application', __FILE__)

# uncomment to load credentials for initial song loading
# require File.expand_path('../credentials',__FILE__)

# Initialize the rails application
QuantumMechanics::Application.initialize!

# Set s3 variables - stored as heroku config variables
# To run locally set variables in a .env file and start using foreman (installed w/heroku gem)

