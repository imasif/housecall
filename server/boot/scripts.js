
    // console.log(app.models.user);
    module.exports = function(server) {
        console.log(server.models.Users)
        let model = server.models;
        let Users = model.Users;
        let Role = model.Role;
        let RoleMapping = model.RoleMapping;

        //create the admin role
        Role.create([
            {
                name: 'admin'
            },
            {
                name: 'employee'
            }], function(err, role) {
            if (err) {
                return console.log(JSON.stringify(err));
            };
    
            console.log('Created role:', role);


            Users.create(
                {
                    role_id: role[0].id,
                    username: "imasifkhan1010@gmail.com",
                    email: 'imasifkhan1010@gmail.com',
                    password: '1q2w3e',
                    first_name:'Asif',
                    last_name: 'Khan',
                    emailVerified: true,
                    realm: "admin",
                    verificationToken: ""
                }, function(err, user) {
                if (err) {
                    if (err.details) {
                        return console.log("unknownServerError details: " + JSON.stringify(err.details.codes));
                    }
                    // return console.log(err)
                };

                console.log('Created user:', user);

                //make asif an admin
                role[0].principals.create({
                    principalType: RoleMapping.USER,
                    principalId: user.id
                }, function(err, principal) {
                    if (err) throw err;
            
                    console.log('Created principal:', principal);
                });


            });
    
        });
    }
