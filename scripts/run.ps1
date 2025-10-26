$env:MY_PORT = "8001"

java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5001 -jar .\target\severence-server-1-SNAPSHOT.jar
