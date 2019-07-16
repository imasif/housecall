var server = require('./server');
var ds = server.datasources.mysqlID;
// console.log(ds.adapter.name);
// return;
// var lbTables = ['Address','Customer','Job','Phone','Users','AccessToken', 'ACL', 'RoleMapping', 'Role'];
var lbTables = ['user', 'Customer', 'Grouping', 'Estimate',  'Job',  'Invoice', 'AccessToken', 'ACL', 'RoleMapping', 'Role','Schedule'];
ds.automigrate(lbTables, function (er) {
  if (er) throw er;
  console.log('Loopback tables [' - lbTables - '] created in ', ds.adapter.name);
  ds.disconnect();
});