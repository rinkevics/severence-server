$ProjectName = Split-Path -Leaf (Get-Location)

.\mvnw package
wsl bash ./scripts/run_docker.sh $ProjectName
