# before_install.sh
#!/bin/bash
# Create application directory in user's home directory instead
APP_DIR=$HOME/spring-app

if [ -d $APP_DIR ]; then
  rm -f $APP_DIR/app.jar
else
  mkdir -p $APP_DIR
fi