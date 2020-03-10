#! /usr/bin/env bats
################################################################################
# 01-compile_RR-slides.bats
# Time-stamp: <Sat 2016-12-10 02:01 svarrette>
#
# Bats: Bash Automated Testing System -- https://github.com/sstephenson/bats
# Installation: see README.md and setup_bats.sh
#
# Resources:
# - How to use Bats to test your command line tools:
#            https://blog.engineyard.com/2014/bats-test-command-line-tools
# - Ex of travis-CI integration:
#            https://github.com/duggan/pontoon/blob/master/.travis.yml
# - Another project using bats:
#            https://github.com/ekalinin/envirius/tree/master/tests
################################################################################

load helpers/bats-support/load
load helpers/assertions/load

# Directory holding all slides sources examples
SLIDES_ROOTDIR="$BATS_TEST_DIRNAME/../slides"
YEAR=2016

setup() {
    [ -z "`which pdflatex`" ] && skip || true
    # The below one is a dirty way to detect crappy travis ubuntu/precise
    # environment where the simplest way to install tcolorbox is through
    # tlmgr... unfortunately not present on precise (but in 'texlive-base'
    # starting trusty)
    #[ -z "`which tlmgr`"]     && skip || true
}

assert_slides_compile() {
    local name=$1
    local src=$2
    local pdf="`basename $src .tex`.pdf"
    local srcdir="${SLIDES_ROOTDIR}/${YEAR}/${name}/src"
    assert [ -d "${srcdir}" ]
    assert [ -f "${srcdir}/Makefile" ]
    assert [ -f "${srcdir}/${src}" ]
    run make -C "${srcdir}"
    #assert [ -f "${srcdir}/${pdf}" ]
    assert_success
}

@test "preliminary or preventive clean" {
    run make -C ${SLIDES_ROOTDIR}/${YEAR} clean
    assert_success
}

# cannot loop on `ls -d ${SLIDES_ROOTDIR}/${YEAR}/*` or ${EVENTS[*]} as expected :(
@test "compile Reproducible Research tutorial slides for CloudCom 2016" {
    assert_slides_compile 'cloudcom2016' 'tutorial-RR.tex';
}
