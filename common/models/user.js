'use strict';

module.exports = function (user) {
  // let models = server.models;
  // let Role = models['Role'];
  // let RoleMapping = models['RoleMapping'];

  // Role.findOne({where: {name: 'employee'}, limit: 1}, function(err, role) {
  //     if(err){
  //         throw new Error('problem getting employee role');
  //     }
  //     console.log(role);
  // });

  // console.log(server.);

  user.observe('before save', function updateTimestamp(ctx, next) {
    let postData, userModel = ctx.Model;
    if (ctx.instance) {
      postData = ctx.instance;
      // console.log('Accessing app %s instance %s', ctx.Model.getApp, ctx.instance);
      console.log(' instance %s', postData);

    } else {
      postData = ctx.data;
      // console.log('Accessing app %s data %s', ctx.Model.getApp, ctx.data);
      console.log(' data %s', postData);
    }

    if (postData.realm != 'admin') {

      userModel.getApp((err, app) => {
        // console.log('app.models.Role', app.models.Role);

        let Role = app.models.Role;
        let RoleMapping = app.models.RoleMapping;

        Role.findOne({
          where: {
            name: 'employee'
          }
        }, function (err, role) {
          if (err) {
            throw new Error('problem getting employee role'+ err);
          }

          // postData
          // postData.role_id = role.id;

          role.principals.create({
            principalType: RoleMapping.USER,
            principalId: postData.id
          }, function (err, principal) {
            if (err) throw err;

            // console.log("role=>",role);
            
            postData.role = role.name;
            // postData.role
            next();
          });

        });
      });
    } else {
      next();
    }




  });
};
