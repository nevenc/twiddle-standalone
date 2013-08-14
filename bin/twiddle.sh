#!/bin/sh
### ====================================================================== ###
##  Twiddle Standalone Script                                               ##
### ====================================================================== ###
# $Id: twiddle.sh 2012-04-14 Arnold Johansson #
#
# Worklog:
#
# 2012-02-14 Arnold Johansson
# Using components (JARs, scripts, etc) from JBoss AS 6.1.0.Final 
# Creating a base directory as TWIDDLER_HOME - twiddler-standalone.
# All dependent JARs put in a common lib directory.
# Script (this) is modified and put in bin directory
# Tested on OSX 10.7.3 with JavaSE 1.6.0_31 against JBoss AS 7.1.1.Final (localhost:1090)


# Extract the directory and the program name
# takes care of symlinks
PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG="`dirname "$PRG"`/$link"
  fi
done
DIRNAME=`dirname "$PRG"`
PROGNAME=`basename "$PRG"`

GREP="grep"

#
# Helper to complain.
#
die() {
    echo "${PROGNAME}: $*"
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false;
case "`uname`" in
    CYGWIN*)
        cygwin=true
        ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
    [ -n "$TWIDDLE_HOME" ] &&
        TWIDDLE_HOME=`cygpath --unix "$TWIDDLE_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
fi

# Setup TWIDDLE_HOME
if [ "x$TWIDDLE_HOME" = "x" ]; then
    TWIDDLE_HOME=`cd $DIRNAME/..; pwd`
fi
export TWIDDLE_HOME

# Setup the JVM
if [ "x$JAVA_HOME" != "x" ]; then
    JAVA=$JAVA_HOME/bin/java
else
    JAVA="java"
fi

# Setup the classpath
TWIDDLE_BOOT_CLASSPATH="$TWIDDLE_HOME/bin/twiddle.jar"

if [ "x$TWIDDLE_CLASSPATH" = "x" ]; then
    TWIDDLE_CLASSPATH="$TWIDDLE_BOOT_CLASSPATH"
    TWIDDLE_CLASSPATH="$TWIDDLE_CLASSPATH:$TWIDDLE_HOME/lib/jboss-client.jar"
    TWIDDLE_CLASSPATH="$TWIDDLE_CLASSPATH:$TWIDDLE_HOME/lib/jboss-common-core.jar"
    TWIDDLE_CLASSPATH="$TWIDDLE_CLASSPATH:$TWIDDLE_HOME/lib/getopt.jar"
else
    TWIDDLE_CLASSPATH="$TWIDDLE_CLASSPATH:$TWIDDLE_BOOT_CLASSPATH"
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
    TWIDDLE_HOME=`cygpath --path --windows "$TWIDDLE_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    TWIDDLE_CLASSPATH=`cygpath --path --windows "$TWIDDLE_CLASSPATH"`
fi

# Execute the JVM
exec "$JAVA" \
    $JAVA_OPTS \
    -Dprogram.name="$PROGNAME" \
    -classpath $TWIDDLE_CLASSPATH \
    org.jboss.console.twiddle.Twiddle "$@"
