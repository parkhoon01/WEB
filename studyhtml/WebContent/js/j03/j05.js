'use strict';

const browser ='Firefox';

switch(browser){
    
    case 'IE': 
        console.log('go away!');
    break;
    
    case 'Chrome':
    case 'Firefox':
        console.log('love you');
    break;
    
    default:
        console.log('same all');
    break;
}