#!/bin/sh

#
#  Build the json library and example program on Linux using ifort
#
#  Jacob Williams : 2/8/2014
#

SRCDIR='src/'
BUILDDIR='lib/'
BINDIR='bin/'

FCOMPILER='ifort'
FCOMPILERFLAGS='-O2'
#FCOMPILERFLAGS='-check all -debug full'

ARCHIVER='ar'
ARCHIVERFLAGS='-cq'

FEXT='.f90'
OBJEXT='.o'
LIBEXT='.a'

LIBOUT='libjson'
EXEOUT='json'

MODCODE='json_module'
EXAMPLECODE='json_example'

#output directories:
mkdir -p $BUILDDIR
mkdir -p $BINDIR

#build library:
$FCOMPILER $FCOMPILERFLAGS -c $SRCDIR$MODCODE$FEXT -Fo$BUILDDIR -module $BUILDDIR
$ARCHIVER $ARCHIVERFLAGS $BUILDDIR$LIBOUT$LIBEXT $BUILDDIR$MODCODE$OBJEXT

#build example:
$FCOMPILER $FCOMPILERFLAGS -o $BINDIR$EXEOUT -module $BUILDDIR $SRCDIR$EXAMPLECODE$FEXT $BUILDDIR$LIBOUT$LIBEXT