
    // console.log(app.models.user);
    // return;
    require('loopback').getModel('Users').create([
        {
            role_id: 1,
            username: "imasifkhan1010@gmail.com",
            email: 'imasifkhan1010@gmail.com',
            password: '1q2w3e',
            first_name:'John',
            last_name: 'Doe',
            emailVerified: true,
            realm: "admin",
            verificationToken: ""
        },
     ], function(err, users) {
        if (err) {
            if (err.details) {
                return console.log("unknownServerError details: " + util.inspect(err.details.codes));
            }
            // return console.log(err)
        };

        // //create the admin role
        // require('loopback').getModel('Role').create({
        // name: 'admin'
        // }, function(err, role) {
        // if (err) console.log(err);

        // //make bob an admin
        //     require('loopback').getModel('Role').principals.create({
        //         principalType: require('loopback').getModel('RoleMapping').USER,
        //         principalId: users[0].id
        //     }, function(err, principal) {
        //         console.log(err);
        //     });
        // });
    });
