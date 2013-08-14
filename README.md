# Twiddle Standalone

If you are looking for a JMX CLI tool for JBoss AS 7.x (JBoss EAP 6.x), you should really look at new JBoss CLI tool, `jboss-cli.sh` first.

If you really really need twiddle utility, that you are used to in previous versions of JBoss AS, you can use this twiddle standalone script.

The original Twiddle is a simple but powerful command-line based JMX client often used by system administrators to retrieve various JMX data for use in shell scripting. Twiddle has traditionally been packaged with JBoss application server up to version JBoss AS 6.x. No Twiddle script has been created for JBoss AS 7.x (JBoss EAP 6.x) and beyond (no plans to make it available, use jboss-cli.sh interface instead).

twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 7.1.1.Final:

    JBOSS_HOME/bin/client/jboss-client.jar
    JBOSS_HOME/modules/gnu/getopt/main/getopt-1.0.13.jar
    JBOSS_HOME/modules/org/jboss/common-core/main/jboss-common-core-2.2.17.GA.jar
    JBOSS_HOME/modules/org/jboss/logging/main/jboss-logging-3.1.0.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)
    JBOSS_HOME/modules/org/jboss/logmanager/main/jboss-logmanager-1.2.2.GA.jar (NOT REQUIRED, already packaged in jboss-client.jar)

This version has been tested with JBoss AS 7.1.1 and JBoss EAP 6.1.0.

For additional help on JMX Remote API, see [JSR-160 Java Management Extensions (JMX) Remote API](http://jcp.org/en/jsr/detail?id=160).  

## Installation

Download the twiddle-standalone.zip from github.

Unzip twiddle-standalone.zip to your preferred directory, e.g.

    /opt/twiddle-standalone

Optionally, you can set `TWIDDLE_HOME` environment variable, e.g. 

    export TWIDDLE_HOME=/opt/twiddle-standalone

Also, you can add `TWIDDLE_HOME/bin` to your path, e.g.

    export PATH=$PATH:$TWIDDLE_HOME/bin


## Usage

You can run twiddle as usual, e.g. 

    /opt/twiddle-standalone/bin/twiddle.sh -h
    /opt/twiddle-standalone/bin/twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l


Optionally, if you added `TWIDDLE_HOME` to your environment variables, you could run twiddle as:

    $TWIDDLE_HOME/bin/twiddle.sh -h
    $TWIDDLE_HOME/bin/twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l

Also, if you added `TWIDDLE_HOME/bin` to your path, you could run twiddle directly, e.g.

    twiddle.sh -h
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 serverinfo -l

## Useful Commands

Here is a list of some useful commands that you could use in newest JBoss AS 7.x and JBoss EAP 6.x:

To shutdown server instance, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:management-root=server shutdown false

To restart server instance, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:management-root=server shutdown true

To read configuration as XML, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:management-root=server readConfigAsXml

To generate JBoss Diagnostic Reporter (JDR) report, e.g. 
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:subsystem=jdr genrateJdrReport

To get a list of all services in JBoss MSC, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.msc:type=container,name=jboss-as dumpServicesToString

To list everything in JNDI, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:subsystem=naming jndiView

To list all datasource drivers, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 invoke jboss.as:subsystem=datasources installedDriverList

To get various statistics on ExampleDS datasource, e.g. 
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool ActiveCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool AvailableCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool AverageBlockingTime
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool AverageCreationTime
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool CreatedCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool DestroyedCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool InUseCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool MaxCreationTime
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool MaxUsedCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool MaxWaitCount
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool TimedOut
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool TotalBlockingTime
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 get jboss.as:subsystem=datasources,data-source=ExampleDS,statistics=pool TotalCreationTime

To set various options on deployment scanner, e.g.
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default scanEnabled true
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default scanEnabled false
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default scanInterval 60000
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default autoDeployZipped false
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default autoDeployExploded false
    twiddle.sh --server service:jmx:remoting-jmx://localhost:9999 set jboss.as:subsystem=deployment-scanner,scanner=default autoDeployXml false

Feel free to add to the list.

