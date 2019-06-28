var server = require('./server');
var ds = server.dataSources.mysqlID;
// console.log(server);
// return;
// var lbTables = ['Address','Customer','Job','Phone','Users','AccessToken', 'ACL', 'RoleMapping', 'Role'];
var lbTables = ['Customer', 'Job', 'Users', 'AccessToken', 'ACL', 'RoleMapping', 'Role','Schedule'];
ds.automigrate(lbTables, function (er) {
  if (er) throw er;
  console.log('Loopback tables [' - lbTables - '] created in ', ds.adapter.name);
  ds.disconnect();
});