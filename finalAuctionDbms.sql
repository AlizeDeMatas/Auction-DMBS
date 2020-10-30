/* Seller */
CREATE TABLE sellerAccount(
    PhoneNumber NUMBER(12) NOT NULL,
    SUserName VARCHAR2(16) NOT NULL,
    Passwords VARCHAR2(20) DEFAULT '000000',
    SBankInfo VARCHAR2(25) NOT NULL,
    SellerEmail VARCHAR2(25) NOT NULL,
    Rankk NUMBER(2)
);    
insert into sellerAccount values(4163430091,'Steve','1627893','ScotiaBank','ssstevejk@gmail.com',8);
insert into sellerAccount values(4378920934,'Nana','839831','RBC','nanananana@gmail.com',7);
insert into sellerAccount values(9872636480,'Xavier','Xforce99','CIBC','XxxMmmmAaaa@gmail.com',9);
insert into sellerAccount values(4163546435,'Sarah','c3qv3g5','BMO','sarah@gmail.com',8);
insert into sellerAccount values(4253252264,'Anna','f43f3g34','TD','annanna@gmail.com',8);


CREATE TABLE auctionPeriod(
    StartTime VARCHAR2(16) DEFAULT 'YEAR/MM/DD/MN/SS',
    EndTime VARCHAR2(16) DEFAULT 'YEAR/MM/DD/MN/SS',
    HighestBid NUMBER(11) NOT NULL
);
insert into auctionPeriod values ('2018/06/19/12/00','2018/06/20/12/00',87900);
insert into aucitonPeriod values ('2019/03/27/20/00','2019/03/28/00/00',6700);
insert into auctionPeriod values ('2017/02/12/08/00','2017/02/14/08/00',23100);
insert into auctionPeriod values ('2015/09/11/08/00','2015/09/11/20/00',450);
insert into auctionPeriod values ('2015/06/19/08/00','2015/06/19/13/00',50000);


CREATE TABLE origin(
    Owners VARCHAR2(20) NOT NULL,
    Place VARCHAR2(20) NOT NULL
);
insert into origin values('King','Turkey');
insert into origin values('King','China');
insert into origin values('King','Asgard');
insert into origin values('Unknown','Canada');
insert into origin values('Someone','Brazil');


CREATE TABLE descriptions(
    Categories VARCHAR2(15) DEFAULT 'NOT PROVIDED',
    Condition VARCHAR2(100) DEFAULT 'NOT PROVIDED',
    Appraiser VARCHAR2(20) DEFAULT 'NOT PROVIDED',
    Owners VARCHAR2(20)DEFAULT 'NOT PROVIDED',
    Place VARCHAR2(20) DEFAULT 'NOT PROVIDED'
);
insert into descriptions values('Jewelry', 'Real','Tony','King','Turkey');
insert into descriptions values('Grocery', 'Real','Zhong','King','China');
insert into descriptions values('Gem', 'Pure','Tedd','King','Asgard');
insert into descriptions values('E-product', 'Second-hand','Eva','Unknown','Canada');
insert into descriptions values('Vehicle', 'New','Dan','Someone','Brazil');


CREATE TABLE item(
    AuctionId VARCHAR2(25) PRIMARY KEY,
    StartingPrice NUMBER(11) NOT NULL,
    Categories VARCHAR2(15) DEFAULT 'NOT PROVIDED',
    Condition VARCHAR2(100) DEFAULT 'NOT PROVIDED',
    Appraiser VARCHAR2(20) DEFAULT 'NOT PROVIDED',
    Owners VARCHAR2(20) DEFAULT 'NOT PROVIDED',
    Place VARCHAR2(20) DEFAULT 'NOT PROVIDED',
    HighestBid NUMBER(11) NOT NULL
);
insert into item values('xe2f2f43',13200,'Jewelry', 'Real','Tony','King','Turkey',87900);
insert into item values('d2c24f4g',12300,'Grocery', 'Real','Zhong','King','China',67000);
insert into item values('n6nej42',10000,'Gem', 'Pure','Tedd','King','Asgard',23100);
insert into item values('f43vqh1',350,'E-product', 'Second-hand','Eva','Unknown','Canada',450);
insert into item values('f2h21542',50000,'Vehicle', 'New','Dan','Someone','Brazil',50000);


CREATE TABLE seller(
    SellerId VARCHAR2(25) PRIMARY KEY,
    PhoneNumber VARCHAR2(12),
    SUserName VARCHAR2(16), 
    SellerEmail VARCHAR2(25),
    Rankk NUMBER(2)
);
insert into seller values('a123d324d',4163430091,'Steve','ssstevejk@gmail.com',8);
insert into seller values('qe73hf728',4378920934,'Nana','nanananana@gmail.com',7);
insert into seller values('m93jfd32d2',9872636480,'Xavier','XxxMmmmAaaa@gmail.com',9);
insert into seller values('d2e4fr2f4',4163546435,'Sarah','sarah@gmail.com',8);
insert into seller values('2f4f2f2f4',4253252264,'Anna','fannanna@gmail.com',8);


/* Buyer */
CREATE TABLE buyerAccount(
    BuyerId VARCHAR2(25) PRIMARY KEY,
    BUsername VARCHAR2(30) NOT NULL,
    Address VARCHAR2(30) DEFAULT 'NOT PROVIDED',
    BBankInfo VARCHAR2(30),
    BuyerEmail VARCHAR2(30)
);
insert into buyerAccount values (12222788,'HappySchool', 'Toronto', 'CIBC', 'HappySchool@Gmail.com');
insert into buyerAccount values (22222222,'HappyHighSchool', 'Vancouver', 'Bank of Nova Scotia', 'HappyHighSchool@Gmail.com');
insert into buyerAccount values (89183947,'HappyUniversity', 'Montreal', 'RBC', 'HappyUniversity@Gmail.com');


CREATE TABLE endorsement(
    ReviewId VARCHAR2(10),
    BuyerId VARCHAR2(10)
);
insert into endorsement values(7777,73456);
insert into endorsement values(8888,73456);
insert into endorsement values(9999,73456);


CREATE TABLE placeBid(
    BidId VARCHAR2(25),
    BuyerId VARCHAR2(25)
);
insert into placeBid values (222, 73456);
insert into placeBid values (222, 89539095);
insert into placeBid values (43282, 32789498);
insert into placeBid values (21738122, 2898492);


CREATE TABLE submitBid(
    BidId VARCHAR2(25),
    AuctionId VARCHAR2(25)
);

insert into submitBid values (222, 73456);
insert into submitBid values (222, 89539095);
insert into submitBid values (43282, 32789498);
insert into submitBid values (21738122, 2898492);


CREATE TABLE bid(
    BidId VARCHAR2(30) PRIMARY KEY,
    Amount VARCHAR2(30),
    TimeStamp VARCHAR2(10),
    AuctionID VARCHAR2(20)
);
insert into bid values(1,234,1,12);
insert into bid values(3,23,1000200,4);
insert into bid values(2,12,1000500,7);


/* Admin */
CREATE TABLE administrator (
    Admin_ID VARCHAR(25) PRIMARY KEY,
    Admin_username VARCHAR2(25),
    Admin_password VARCHAR2(25),
    Admin_email VARCHAR2(25)
);

INSERT INTO administrator VALUES('r123mx','joeyelliot','CXZ!123@','jelliot@admin.auction.com');
INSERT INTO administrator VALUES('k931lz','tonystokes','9JDx$912','tstokes@admin.auction.com');

CREATE TABLE processes (
    Request_ID VARCHAR2(25) REFERENCES requests(Request_ID),
    Items_ID VARCHAR2 REFERENCES items(AuctionId)
);

CREATE TABLE requests (
    Request_ID VARCHAR2(25) PRIMARY KEY,
    AuctionId VARCHAR2(25) REFERENCES items(AuctionId),
    BuyerId VARCHAR(25) REFERENCES buyer(BuyerId),
    SellerId VARCHAR(25) REFERENCES seller(SellerId)
);

INSERT INTO requests VALUES('arsx130','xe2f2f43',12222788,'a123d324d');
INSERT INTO requests VALUES('saod502','d2c24f4g',22222222,'qe73hf728');
INSERT INTO requests VALUES('kdax922','n6nej42',89183947,'m93jfd32d2');

CREATE TABLE manages (
    FOREIGN KEY (BUserName, Address, BBankInfo, BuyerEmail) REFERENCES buyerAccount(BUserName, Address, BBankInfo, BuyerEmail),
    FOREIGN KEY(PhoneNumber, SUserName,Passwords, SBankInfo, SellerEmail, SellerRank) 
        REFERENCES sellerAccount(PhoneNumber, SUsername, Passwords, SBankInfo, SellerEmail, SellerRank)
);
