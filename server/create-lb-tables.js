var server = require('./server');
var ds = server.dataSources.mysqlID;
// console.log(server);
// return;
var lbTables = ['Address','Customer','Job','Phone','Users','AccessToken', 'ACL', 'RoleMapping', 'Role'];
ds.automigrate(lbTables, function(er) {
  if (er) throw er;
  console.log('Loopback tables [' - lbTables - '] created in ', ds.adapter.name);
  ds.disconnect();
});