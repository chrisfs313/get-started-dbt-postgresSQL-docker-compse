docker-compose -f .\dbt\docker-compose-postgres-dbt.yml up -d --build --force-recreate

function WaitForContainer($p_timesToTest = 20) {
  $sleepForSeconds = 15
  $currentTest = 1
  
  while ($currentTest -le $p_timesToTest) {
      Write-Host "Checking Status for Container Attempt #: $currentTest"
      $dockerResult = (docker ps -a) | Select-String "dbt-postgres" 
      
      if ($null -ne $dockerResult) {
        $containerOkResult = (docker container logs dbt-postgres) | Select-String "All checks passed!"
        $containerFailedResult = (docker container logs dbt-postgres) | Select-String "check failed:"
        $getLogsAndClose = $null -ne $containerOkResult -OR $null -ne $containerFailedResult

        if ($getLogsAndClose -eq $True) {
          Write-Host "Showing full logs..."
          docker container logs dbt-postgres
          return
        }
      }
      $currentTest++;
      Start-Sleep -Seconds $sleepForSeconds
  }

  throw "Max attempts exceeded."
}

function EnterToDBTContainer() {
  docker run -it --network dbt-demo_dbt-network dbt-demo-dbt-postgres
}

WaitForContainer
EnterToDBTContainer