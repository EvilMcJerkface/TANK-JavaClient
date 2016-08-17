JAVAC= /usr/bin/javac
JAVADOC= /usr/bin/javadoc
CURDIR= $(shell pwd)
SRC= $(CURDIR)/src
DOC= $(CURDIR)/doc
DST= gr/phaistosnetworks/TANK
PACKAGE= gr.phaistosnetworks.TANK
CPATH= $(CURDIR):$(CURDIR)/ext/snappy-java-1.1.2.6.jar
FLAGS= -Xdiags:verbose -Xlint:unchecked -Xlint:deprecation -cp $(CPATH)

all:	TankClient testApp doc

doc: 	
	mkdir -p $(DOC)
	$(JAVADOC) -cp $(CPATH) -d $(DOC) -sourcepath $(SRC) $(PACKAGE)

clean:
	find . -type f -name '*.class' | xargs rm -f

testApp: TestApp.java
	$(JAVAC) $(FLAGS) TestApp.java

Test2: Test2.java
	$(JAVAC) $(FLAGS) Test2.java

TankClient: 
	mkdir -p $(DST)
	$(JAVAC) -d . $(FLAGS) $(SRC)/$(DST)/*.java

#find src/ -type f -name '*.java' | xargs javac -cp .:ext/snappy-java-1.1.2.6.jar -d gr/phaistosnetworks/TANK/

Style:
	java -jar $(CURDIR)/ext/checkstyle-all-4.4.jar com.puppycrawl.tools.checkstyle.Main -c $(CURDIR)/ext/grade_checks.xml $(SRC)/$(DST)/*.java

.PHONY: doc