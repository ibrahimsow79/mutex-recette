// dependencies
var AWS = require('aws-sdk');
var util = require('util');
var SSH = require('simple-ssh');

var ssh = new SSH({
  host: '10.0.1.154',
  user: 'deploiement',
  key: `-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,35C001483DBDD461

ouHtwB7rO7p0Xjf0afGR3jsl1unNInREUogDJZ+9Q6nbxA6mSe7HMgHKo9wu1wM1
5rZ1CSE0Gzh6GtQsuCl3ft3ibwM/dYnfSPSLtQDd/PonuRNMQYB42kZH3U+ZFK+y
Omck08kE8m5HsMoakFM3chjNQ/cMo5ssqDUxH5/9ukxlNaniBs8CvQewozLzhBwb
mHTtCr46/y17ELZ8Vb6MJsVRZPQCKSsq88fT5ZCvrl6028YxoDNTu5SDDDNEaqi8
+UcOen6GeWWC9jbUzORriKe/U/cxpCbVHoA+odc5M5FKOpSGMWdNEi+CNXkYO7KL
FBY1bjCBPOsxR+53DauaIKTcKciF25XTTn8qJSBXA+IwAgAEE+wFSiWcOfadX4Xg
pXtermV42TdyNs6P8oHJ8ZwUjFheo0GlP2fmXbTJxDpalFeH+r8Iu6+4JfAKmoMw
PRKeU8V0Mw7GvTWaDYuuMNzQcb4Z0A0GxDUktodOmXSq2EPgXh3QFVOHPKwDjTMR
yErEY1pRU7fc8WCPfUYmXbx31b59vMVs+Ztnh+lbvbsAbqXOux01yZC7FgRN+2OU
ZaQUfc6FtSlHN52UaiBZr+tOnIkzadvZ8N4ve/3sF+g1Ay7Hjfx4s1Jbnjc7PO8X
blJmSDjqbRrSN5J3NSMJ5Hnd5pT+HziWUcTum10QXDKNoZHOKwkaC1xyDwwRPgof
4/ipQCRQ2qMIsqeUYz+2/9LDvG35/GkMIZiZB3QFxYjcWxaP9GfAQ+EYXCNHZGO1
xxlZfLJRQ6+iHm8SXMd1DdmbAkgM1iVhcxJsUpztpumeYZpQclzs2d3ZQuD7hf7C
s6Vl6MDsn60ojohNFZu+PcQfUHc80RJovs+G7ObkhHpiaM+wPwKAmrLudjjufYpw
DcQdoO8Lcian+SlA7wzoWHxYf4yD7EqqO3XABtLwXjZD+wsaqoYcMNUkhl/TVx8j
WN6sRpk2l7e1cwPk/ZoX6uX+r90PbPvZbcHEUvGLYs+I6Aoo08mBxLJJrtcyMvEd
Zi9pL4tkvF1Kpjk0Z5909HVcQ2ok+oGs68OxZ6bKqxv1Mh/9+ZUJV4RuMapsEahn
wjGobjRHShnc8AJ1WD4D3zLFnSMIzw2RobRtuJKSbzUZlvspVW0KRc1zvxPtSiOV
72qSNE3icVBxhV9Pe0GU/0otGOYND4TbLhTf8uGVFnrg/3YinB8PMIw3lkS5n1As
z111Q7aTIYuxr8F7kV+KFYownNrMXEunxW7aKjhqs61IhOdbW71MT/jq5Wh+mPJr
3HjCCUNQMql/QxJ8OB2jwTm8g/z7TpiWfVGXUEj8e3KVrHdYy87T7vua8KMNkxuP
2ebfeBduCaAhkHTPL8jNA0UjOz0l9whxnKJjZPXxhIZNY0itpRouqmvdoTXPYW2T
roi5aaPMiZDKQDh7EF0y4mYqI2nOJ7IBEM2FupnDEk0vR8tERKRxwKv5ioMV4Olo
CYOODAtB+PVesQccCJpE2h6y11EYZ1XnwJH5+tXF48EUrhWU0oWcskvw7lm9plMt
6eZRscC8RFloqaQk2GuexTXTay1cLiUus67djy7W7z5BJQ/QhoqEqg==
-----END RSA PRIVATE KEY-----
`,
  passphrase: 'fg?AtiP&@_lm!!!'
});


// get reference to S3 client 
var s3 = new AWS.S3();

exports.handler = (event) => {
  // Read options from the event.
  console.log("Reading options from event:\n", util.inspect(event, { depth: 5 }));
  var srcBucket = event.Records[0].s3.bucket.name;

  // Object key may have spaces or unicode non-ASCII characters.
  var srcKey = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, " "));

  ssh.exec("aws s3 cp s3://" + srcBucket + "/" + srcKey + " " + srcKey)
    .exec("tar -xf " + srcKey + " -C www", {
      err: function (stderr) {
        console.log(stderr);
      }
    }).start();

};