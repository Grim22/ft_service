CREATE DATABASE wordpress;
/* 
*  'user'@'%': to create a user that can connect from any host
*/ 
GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%' identified by 'password';
FLUSH PRIVILEGES; 