# application_start.sh
#!/bin/bash
APP_DIR=$HOME/spring-app

# Make the JAR executable
chmod +x $APP_DIR/app.jar

# Stop any running instance
PID=$(pgrep -f "java -jar $APP_DIR/app.jar" || echo "")
if [ -n "$PID" ]; then
  echo "Stopping existing application (PID: $PID)"
  kill $PID
  sleep 5
fi

# Start the application as a background process
nohup java -jar $APP_DIR/app.jar > $APP_DIR/application.log 2>&1 &
echo $! > $APP_DIR/application.pid
echo "Started application with PID: $(cat $APP_DIR/application.pid)"
