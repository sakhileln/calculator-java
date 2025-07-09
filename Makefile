JAVAC=javac
JAVA=java
SRC_DIR=src
TEST_DIR=test/src
BUILD_DIR=build
RELEASE_DIR=release
CLASSPATH=$(BUILD_DIR):.:"lib/*"

.PHONY: all build test run clean release

all: build test

build:
	mkdir -p $(BUILD_DIR)
	$(JAVAC) -d $(BUILD_DIR) -cp "lib/*:$(BUILD_DIR)" $(SRC_DIR)/*.java $(TEST_DIR)/src/*.java

test:
	$(JAVA) -cp "$(CLASSPATH)" org.junit.runner.JUnitCore src.CalculatorTest src.CalculatorAcceptanceTest

run:
	$(JAVA) -cp $(CLASSPATH) src.Main

clean:
	rm -rf $(BUILD_DIR) $(RELEASE_DIR)

release: build
	mkdir -p $(RELEASE_DIR)
	cp -r $(BUILD_DIR) $(RELEASE_DIR)/calculator-`date +%Y%m%d_%H%M%S`
	echo "v1.0.0-`date +%Y%m%d_%H%M%S`" > .release-tag

checkstyle:
	java -jar lib/checkstyle-10.12.4-all.jar -c checkstyle.xml src/ test/
