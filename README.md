# calculator-java
A simple Java CLI calculator with JUnit tests, Makefile automation, Docker support, and GitHub Actions CI/CD pipeline.

## Features
- Basic arithmetic operations: `add`, `sub`, `mul`, `div`
- JUnit 4-based unit testing
- Build automation using `Makefile`
- Dockerized CLI app
- GitHub Actions CI/CD workflow for:
  - Automated builds and test runs
  - Docker image builds
  - Release tagging and artifacts

## Makefile Targets
- `make build` — Compile all sources
- `make test` — Run unit tests
- `make run` — Run the calculator CLI
- `make clean` — Clean build and release folders
- `make release` — Create release artifact and tag
- `make all` — Build and test

## Dependencies
- Put JUnit JARs in a `lib/` folder (download from [JUnit site](https://junit.org/junit4/)):
```markdown
calculator-java/
└── lib/
    ├── junit-4.13.2.jar
    └── hamcrest-core-1.3.jar
```
## Project Structure
```markdown
calculator-java/
├── src/
│   ├── Calculator.java        # Core calculator logic
│   └── Main.java              # CLI entry point
│
├── test/
│   └── CalculatorTest.java    # JUnit test cases
│
├── lib/
│   ├── junit-4.13.2.jar       # (Downloaded by CI or added manually)
│   └── hamcrest-core-1.3.jar
│
├── build/                     # Compiled .class files (generated)
│
├── release/                   # Tagged releases (generated)
│
├── .github/
│   └── workflows/
│       └── ci.yml             # GitHub Actions workflow for CI/CD
│
├── Dockerfile                 # Docker image definition
├── .dockerignore             # Ignore build/release dirs in Docker context
├── Makefile                   # Commands: build, test, run, clean, release
├── .release-tag               # Simple version tracking file
├── README.md                  # Project description, usage, and instructions
```
## Docker
To run manually:
```bash
docker build -t java-calculator .
docker run -it java-calculator
```
