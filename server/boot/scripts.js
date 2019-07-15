
    // console.log(app.models.user);
module.exports = function(server) {
    let util = require('util');
    let models = server.models;
    let User = models['user'];
    let Role = models['Role'];
    let RoleMapping = models['RoleMapping'];
    // var ds = server.datasources.mysqlID;
    


    function isEmpty(obj) {
        for(var prop in obj) {
          if(obj.hasOwnProperty(prop)) {
            return false;
          }
        }
      
        return JSON.stringify(obj) === JSON.stringify({});
    }

    // let options = { "mysql": { "table": "Role" }};
    // server.dataSources.mysqlID.connector._models['Role'].model.definition.
    // options[options];
    // console.log('Role.defin=>',server.dataSources.mysqlID.connector._models['Role'].model.config)
    // return;

    // if(ds){
    //     var lbTable = ['user'];
    //     ds.automigrate(lbTable, function (er) {
    //         if (er) throw new Error('cannot create User table'+er);
    //         console.log(`Loopback tables [ - ${lbTable} - ] created in `, ds.adapter.name);
    //         // ds.disconnect();
    //     });
        
    //     ds.discoverSchema('user', {schema: ds.database}, function(err,schema){
    //         // console.log(schema);
    //         // return;
    //         if(err) {
    //             console.log('Error not found User table',err);
                
    //             // throw new Error('User schema discovery error:',err)
    //         }
    //         console.log('UserSchema',schema);
            
            // if(!isEmpty(schema)){
                User.create(
                    {   
                        id: '1',
                        username: "",
                        role: "admin",
                        email: 'imasifkhan1010@gmail.com',
                        password: '1q2w3e',
                        first_name:'Asif',
                        last_name: 'Khan',
                        emailVerified: true,
                        realm: "admin",
                        verificationToken: ""
                    }, function(err, user) {
                    if (err) {
                        
                        return console.log("unknownServerError details: " +JSON.stringify(err))
                    };
        
                    console.log('Created user:', user);
        
                    Role.create([
                        {
                            name: 'admin'
                        },
                        {
                            name: 'employee'
                        }], function(err, roles) {
                        if (err) {
                            return console.log('role error',JSON.stringify(err));
                        };
                    
                        console.log('Created role:', roles);
                        //make asif an admin
                        roles[0].principals.create({
                            principalType: RoleMapping.USER,
                            principalId: user.id
                        }, function(err, principal) {
                            if (err) throw new Error('çannoot create rolemapping'+err);
    
                            // console.log('user.update',user.update({
                            //     role: roles[0].name
                            // }))
        
                            console.log('Created principal:', principal);
                        });
                        
                    });
        
                });
        //     // }
        // })
        // ds.disconnect();
    // }

    
    


        
   
}
    
