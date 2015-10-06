The Apache SVN commits on Github
=====================


This repository contains the commits (aka 'revisions') extracted from the Apache SVN repository. It is meant to be used as scientific reference dataset for research and education in mining software repositories and empirical software engineering.

The goal of the repository is:

1. to provide a stable dataset with a long-lived URL and  SHA1-checksummed files
1. to be able to search in commit messages thanks to Github search infrastructure (e.g. for [npe](https://github.com/monperrus/apache-commits/search?q=npe&type=Code))
1. to save bandwidth of the Apache foundation

Each commit comes with the author name, the commit message, the date, and the list of changed files (added, modified, deleted).

Methodology
-------

On Oct 5 2015, the commits were extracted using `svn log -v `. This has resulted in 1,706,767 commits. They were then transformed into JSON files for Github to index them. Since Github has a limit of 500,000 files per repository for indexing, the JSON files are grouped by five. 

Dataset
-----

The dataset is composed of two files:

* `apache-1-1000000-svn-log.xml.bz2` contains the first million of commits (SHA1: d156619cf2176cdea91eba8a20192cb6565f93ce)
* `apache-1000001-1706767-svn-log.xml.bz2` contains the rest up to revision r1706767 (SHA1: 8a83bbd4c112b60cea37961323cef16e11d002d0)


Data format
----------

The `apache-*-svn-log.xml` are XML files containing self-explanatory  `<logentry>`. In folder `examples`, there is a test file `apache-1-1000-svn-log.xml` containing the first 1000 commits.

```
<logentry
   revision="1000001">
<author>senaka</author>
<date>2010-09-22T14:48:18.695729Z</date>
<paths>
<path
   kind="file"
   action="M">/webservices/commons/trunk/modules/axiom/pom.xml</path>
</paths>
<msg>added my details.</msg>
</logentry>

```

The JSON files contains the same info as JSON:

```
{
  "author": "senaka", 
  "date": "2010-09-22T14:48:18.695729Z", 
  "msg": [
   "added my details."
  ], 
  "revision_id": "1000001"
}

```

To checkout a particular revision, say 1000001, first idenfify the related project through the project name

```
$ svn diff --summarize -r <commit_id - 1>:<commit_id> http://svn.apache.org/repos/asf/
# example
$ svn diff --summarize -r 100000:100001 http://svn.apache.org/repos/asf/
M      http://svn.apache.org/repos/asf/httpd/httpd/trunk/build/NWGNUtail.inc
```

This shows that this comes from project `httpd`. Then checkout the revision:
```
$ svn checkout -r <commit_id>  http://svn.apache.org/repos/asf/<project-name>/trunk/
#example 
$ svn checkout -r 100001  http://svn.apache.org/repos/asf/httpd/httpd/trunk/
```

Contributions
------------

Pull requests are welcome, in particular scripts that compute interesting things in folder `scripts`.


