# validate_service.sh
#!/bin/bash
APP_DIR=$HOME/spring-app

# Wait for application to start
sleep 20

# Check if process is running
if [ ! -f $APP_DIR/application.pid ]; then
  echo "PID file not found"
  exit 1
fi

PID=$(cat $APP_DIR/application.pid)
if ! ps -p $PID > /dev/null; then
  echo "Process not running"
  exit 1
fi

# Check if application is healthy
http_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/actuator/health)
if [ "$http_code" != "200" ]; then
  echo "Application health check failed with status $http_code"
  exit 1
else
  echo "Application is healthy"
fi