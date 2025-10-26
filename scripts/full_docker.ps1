Split-Path -Leaf (Get-Location)

.\mvnw clean package
wsl bash ./scripts/run_docker.sh $ProjectName
