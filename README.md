# SonarScanner Docker image

This is the repository of a SonarScanner Docker image.

## What is the SonarScanner?

The [SonarScanner][1] is being developed by [SonarSource][2] and is used to run
code analysis. Check the [official Docs][3] for further information.

## How to use this Image?

Create a sonar-project.properties configuration file as described [here][4]. And
run the SonarScanner:

```
docker run --rm \
  --volume "${PWD}":"${PWD}" \
  --workdir "${PWD}" \
  maxjuergens/sonar-scanner:latest -Dsonar.host.url=http://localhost:9000
```

## How to build this image?

You can build this image like you'd build any other Docker image:

```
docker build --pull --tag maxjuergens/sonar-scanner:latest sonar-scanner/
```

[1]: https://github.com/SonarSource/sonar-scanner-cli
[2]: https://www.sonarsource.com/
[3]: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/
[4]: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/#header-2
