$env:MY_PORT = "8000"
java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5000 -jar .\target\severence-server-1-SNAPSHOT.jar
