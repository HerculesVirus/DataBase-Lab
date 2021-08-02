-- QUESTION NO 1

Create table info (
	id varchar(4) PRIMARY KEY,
	name varchar(20) NOT NULL ,
	address varchar(20)
);

INSERT into info (id,name,address) VALUES('1','bashmastr','Lahore');
INSERT into info (id,name,address) VALUES('2','zeeshan','Lahore');
INSERT into info (id,name,address) VALUES('3','ali','shaikhpura');


DELIMITER $$
CREATE PROCEDURE update_address (IN I_D varchar(4), IN updated_address varchar(20) ,out n_name varchar(20))
	BEGIN
	update info 
		set address = updated_address
		where id = I_D;
		
	select name INTO n_name FROM info
		where id = I_D;

	END $$  

-- CALL updated_addres( "1" , "karachi");

<?php
    $id = '1';
    $address = '';
    $name= '';
    $qry = "CALL update_address('".$id."', '".$address."','".$name."')";
    if ($con->query($qry)) 
        echo "address chamged. ".$name;
    else
        echo "Error"
?>


-- QUESTION NO 2

CREATE table users(
	user_id varchar(4) PRIMARY KEY,
	username varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	email varchar(30)
);

INSERT into users (user_id, username, password, email) VALUES("1","abc","def321","abc123@yahoo.com");
INSERT into users (user_id, username, password, email) VALUES("2","xyz","vbn123","xyz789@gmail.com");

DELIMITER &&
CREATE PROCEDURE add_user (IN u_id varchar(4),IN u_name varchar(20), IN pass varchar(20), IN e_mail varchar(30))
	BEGIN
	INSERT into users 
	(user_id, username, password, email)
	 VALUES(u_id,u_name,pass, e_mail);
	 END &&
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE count_down(OUT t_user INT, OUT hotmail_user INT, OUT yahoo_user INT, OUT gmail_user INT)
BEGIN
SELECT COUNT(user_id) INTO t_user FROM users;

SELECT COUNT(user_id) INTO yahoo_user FROM users
WHERE email LIKE "%yahoo.com";

SELECT COUNT(user_id) INTO gmail_user FROM users
WHERE email LIKE "%gmail.com";

SELECT COUNT(user_id) INTO hotmail_user FROM users
WHERE email LIKE "%hotmail.com";
END$$

DELIMITER ;


CREATE TRIGGER update_insertion_summary_
	AFTER UPDATE ON users
	FOR EACH ROW
	BEGIN
	DECLARE t_user integer;
	DECLARE yahoo_user integer;
	DECLARE gmail_user integer;
	DECLARE hotmail_user integer; 
	CALL count_user( t_user, hotmail_user, yahoo_user, gmail_user);
	UPDATE summary
	SET t_users = total_user,
	hotmail = hotmail_user,
	gmail = gmail_user,
	yahoo = yahoo_user
	LIMIT 1;
	END $$
