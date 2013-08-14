# Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but powerful command-line based JMX client often used by system administrators to retrieve various JMX data for use in shell scripting. Twiddle has traditionally been packaged with JBoss application server up to version JBoss AS 6.x. No Twiddle script has been created for JBoss AS 7.x (JBoss EAP 6.x) and beyond (no plans to make it available, use jboss-cli.sh interface instead).

twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 7.1.1.Final:

 * JBOSS_HOME/bin/client/jboss-client.jar
 * JBOSS_HOME/modules/gnu/getopt/main//getopt-1.0.13.jar
 * JBOSS_HOME/modules/org/jboss/common-core//main/jboss-common-core-2.2.17.GA.jar
 * JBOSS_HOME/modules/org/jboss/logging//main/jboss-logging-3.1.0.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)
 * JBOSS_HOME/modules/org/jboss/logmanager//main/jboss-logmanager-1.2.2.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)

See also JSR-160.  

## Usage

Set an environment variable TWIDDLE_HOME to the root of the twiddle-standalone directory. E g

	export TWIDDLE_HOME=/opt/twiddle-standalone

Run twiddle as usual. E g

	$TWIDDLE_HOME/bin/twiddle.sh -h
    $TWIDDLE_HOME/bin/twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l

Optionally, add $TWIDDLE_HOME/bin to your PATH environment variable, e g

	export PATH=$PATH:$TWIDDLE_HOME/bin

...and then you can run twiddle directly, e g

	twiddle.sh -h

