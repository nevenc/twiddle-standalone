# Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but powerful command-line based JMX client often used by system administrators to retrieve various JMX data for use in shell scripting. Twiddle has traditionally been packaged with JBoss application server up to version JBoss AS 6.x. No Twiddle script has been created for JBoss AS 7.x (JBoss EAP 6.x) and beyond (no plans to make it available, use jboss-cli.sh interface instead).

twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 7.1.1.Final:

	JBOSS_HOME/bin/client/jboss-client.jar
	JBOSS_HOME/modules/gnu/getopt/main//getopt-1.0.13.jar
	JBOSS_HOME/modules/org/jboss/common-core//main/jboss-common-core-2.2.17.GA.jar
	JBOSS_HOME/modules/org/jboss/logging//main/jboss-logging-3.1.0.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)
	JBOSS_HOME/modules/org/jboss/logmanager//main/jboss-logmanager-1.2.2.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)

This version has been tested with JBoss AS 7.1.1 and JBoss EAP 6.1.0.

For additional help on JMX Remote API, see [JSR-160 Java Management Extensions (JMX) Remote API](http://jcp.org/en/jsr/detail?id=160).  

## Installation

1. Download the twiddle-standalone.zip from github.

2. Unzip twiddle-standalone.zip to your preferred directory, e.g.

	/opt/twiddle-standalone

3. Optionally, you can set `TWIDDLE_HOME` environment variable, e.g. 

	export TWIDDLE_HOME=/opt/twiddle-standalone

4. Optionally, you can add `TWIDDLE_HOME/bin` to your path, e.g.

	export PATH=$PATH:$TWIDDLE_HOME/bin


## Usage

* You can run twiddle as usual, e.g. 

	/opt/twiddle-standalone/bin/twiddle.sh -h
    /opt/twiddle-standalone/bin/twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l


* Optionally, if you added `TWIDDLE_HOME` to your environment variables, you could run twiddle as:

	$TWIDDLE_HOME/bin/twiddle.sh -h
    $TWIDDLE_HOME/bin/twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l

* Also, if you added `TWIDDLE_HOME/bin` to your path, you could run twiddle directly, e.g.

	twiddle.sh -h
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l

## Useful Commands


