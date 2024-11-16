create table member(
memid char(15) not null primary key,
mempasswd char(15) not null,
memname char(20) not null,
membirth datetime not null,
memsolar char(10) not null,
memphone char(40) not null,
mememail char(40) not null
);