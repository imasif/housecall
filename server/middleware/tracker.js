// // import app from '../server';
// module.exports = function(options) {
//     // console.log("server.models",models.Role);
//     // console.log("options",options);    
//     return function (req, res, next) {
//         let requestURL = req._parsedUrl.pathname;
//         let requestMethod = req.method;
//         // console.log(requestURL == '/api/users' && requestMethod == 'POST');
//         if(requestURL == '/api/users' && requestMethod == 'POST'){
//         //     // req.read(function(data){
//         //     //     console.log(data);
//         //     // })
//         //     console.log({req});
//             // let read = req.read;
//             // req.read = function(body){
//             //     console.log('Request body before sending: ', body);
//             //     read.call(this, body);
//             // }

//         //     // req.on('finish',function(){
//         //         console.log(req._events)
//         //         let bodyCall = req.body;
//         //         req.body = function(body){
//         //             console.log('Request body before sending: ', body);
//         //             bodyCall.call(this, body);
//         //         };
//         //     // })
//         //     // next();
//         // }
//             if (res.length !== 0) {
//                 // console.log(req);
//                 // console.log();
//                 // console.log('req.send',req.send);

//                 // let read = req.read;
//                 // req.read = function(body){
//                 //     console.log("request",body);
//                 //     read.call(this, req.body);
//                 // }

//                 let send = res.send;
//                 res.send = function(body){
//                     console.log('Response body before sending: ', body);
//                     send.call(this, body);
//                 }
//                 // send(tracker,);
//                 // let red = req.socket.parser['2'];
//                 // // console.log('red.parserOnBody',red());
//                 // red = function (){
                    
//                 //     return req.body;
//                 // }
                
//                 // console.log('parserOnBody',red());
//                 req.on('data', (chunk) => {
//                     req.body = chunk.toString();
//                 });
//                 req.on('end', () => {
//                     console.warn(`request body:`,req.body);
                    
//                 });
//                 next();
//             }
//         };
//     }
//   };