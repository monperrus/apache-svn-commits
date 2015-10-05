#!/bin/sh
# example script for https://github.com/monperrus/apache-commits/
# computes the number of modified files per commits
# uses Xpath with xmlstarlet

xmlstarlet sel -t -m '//logentry' -v 'count(./paths/path[@action="M"])' -n apache-1-1000-svn-log.xml | awk '{freq[$0]++ } END{max=0;for(word in freq) {if (freq[word]>max) max=freq[word];}for(word in freq) { printf word" "; for (i=0;i<int(freq[word]*40/max);i++) printf "#";print " "freq[word]}}' - | sort -g -k1  | head
