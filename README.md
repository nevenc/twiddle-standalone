# Twiddle Standalone

This is a standalone version of the CLI based JMX tool Twiddle by JBoss.

The original Twiddle is a simple but powerful CLI based JMX client often used by e g system administrators to retrieve various JMX data for use in shell scripting. It is normally bundled with JBoss AS up to community version 6.  

twiddle-standalone has initially been created by re-packaging the twiddle script (twiddle.sh with some modifications) and required JARs from JBoss AS 7.1.1.Final.

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

