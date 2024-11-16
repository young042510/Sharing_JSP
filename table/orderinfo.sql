create table orderInfo (
	ordNo		char(10) 		primary key,
	memid		char(15),
	ordDate		char(30),
	ordReceiver	char(20),
	ordRcvAddress	varchar(50),
	ordRcvPhone	     char(20),
	ordPay		char(20),
	ordBank		char(10),
	ordCardNo	char(20),
	ordCardPass	char(15)
);