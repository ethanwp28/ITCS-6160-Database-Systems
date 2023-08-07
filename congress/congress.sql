DROP DATABASE IF EXISTS congress;
CREATE DATABASE congress;
USE congress;

DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS senator;
DROP TABLE IF EXISTS bill;
DROP TABLE IF EXISTS vote;
DROP TABLE IF EXISTS sponsor;

CREATE TABLE state (
    id CHAR(2),
    name VARCHAR(20),
    region VARCHAR(20),
    PRIMARY KEY(id)
);

CREATE TABLE senator (
    id  INT(8),
    name VARCHAR(50),
    party VARCHAR(20),
    startDate DATE,
    endDate DATE,
    state_id CHAR(2),
    PRIMARY KEY(id)
);

CREATE TABLE bill (
    id CHAR(15),
    name VARCHAR(100),
    status VARCHAR(30),
    status_date DATE,
    PRIMARY KEY(id)
);

CREATE TABLE vote (
    senator_id INT(8),
    bill_id CHAR(15),
    position CHAR(3),
    PRIMARY KEY(senator_id, bill_id)
);

CREATE TABLE sponsor (
    senator_id INT(8),
    bill_id CHAR(15),
    introduce_date DATE,
    PRIMARY KEY(senator_id, bill_id)
);
INSERT INTO state VALUE ("AL", "Alabama","South");
INSERT INTO state VALUE ("AK", "Alaska","West");
INSERT INTO state VALUE ("AZ", "Arizona","West");
INSERT INTO state VALUE ("AR", "Arkansas","Midwest");
INSERT INTO state VALUE ("CA", "California","West");
INSERT INTO state VALUE ("CO", "Colorado","West");
INSERT INTO state VALUE ("CT", "Connecticut","NorthEast");
INSERT INTO state VALUE ("DE", "Delaware","South");
INSERT INTO state VALUE ("FL", "Florida","South");
INSERT INTO state VALUE ("GA", "Georgia","South");
INSERT INTO state VALUE ("HI", "Hawaii","West");
INSERT INTO state VALUE ("ID", "Idaho","West");
INSERT INTO state VALUE ("IL", "Illinois","Midwest");
INSERT INTO state VALUE ("IN", "Indiana","Midwest");
INSERT INTO state VALUE ("IA", "Iowa","Midwest");
INSERT INTO state VALUE ("KS", "Kansas","Midwest");
INSERT INTO state VALUE ("KY", "Kentucky","South");
INSERT INTO state VALUE ("LA", "Louisiana","South");
INSERT INTO state VALUE ("ME", "Maine","NorthEast");
INSERT INTO state VALUE ("MD", "Maryland","South");
INSERT INTO state VALUE ("MA", "Massachusetts","NorthEast");
INSERT INTO state VALUE ("MI", "Michigan","Midwest");
INSERT INTO state VALUE ("MN", "Minnesota","Midwest");
INSERT INTO state VALUE ("MS", "Mississippi","South");
INSERT INTO state VALUE ("MO", "Missouri","Midwest");
INSERT INTO state VALUE ("MT", "Montana","West");
INSERT INTO state VALUE ("NE", "Nebraska","Midwest");
INSERT INTO state VALUE ("NV", "Nevada","West");
INSERT INTO state VALUE ("NH", "New Hampshire","NorthEast");
INSERT INTO state VALUE ("NJ", "New Jersey","NorthEast");
INSERT INTO state VALUE ("NM", "New Mexico","West");
INSERT INTO state VALUE ("NY", "New York","NorthEast");
INSERT INTO state VALUE ("NC", "North Carolina","South");
INSERT INTO state VALUE ("ND", "North Dakota","Midwest");
INSERT INTO state VALUE ("OH", "Ohio","Midwest");
INSERT INTO state VALUE ("OK", "Oklahoma","South");
INSERT INTO state VALUE ("OR", "Oregon","West");
INSERT INTO state VALUE ("PA", "Pennsylvania","NorthEast");
INSERT INTO state VALUE ("RI", "Rhode Island","NorthEast");
INSERT INTO state VALUE ("SC", "South Carolina","South");
INSERT INTO state VALUE ("SD", "South Dakota","Midwest");
INSERT INTO state VALUE ("TN", "Tennessee","South");
INSERT INTO state VALUE ("TX", "Texas","South");
INSERT INTO state VALUE ("UT", "Utah","West");
INSERT INTO state VALUE ("VT", "Vermont","NorthEast");
INSERT INTO state VALUE ("VA", "Virginia","South");
INSERT INTO state VALUE ("WA", "Washington","West");
INSERT INTO state VALUE ("WV", "West Virginia","South");
INSERT INTO state VALUE ("WI", "Wisconsin","Midwest");
INSERT INTO state VALUE ("WY", "Wyoming","West");

INSERT INTO senator VALUE (1001, 'Baldwin, Tammy', 'Democratic', NULL, NULL, 'WI');
INSERT INTO senator VALUE (1002, 'Barrasso, John ', 'Republican', NULL, NULL, 'WY');
INSERT INTO senator VALUE (1003, 'Blackburn, Marsha', 'Republican', NULL, NULL, 'TN');
INSERT INTO senator VALUE (1004, 'Braun, Mike', 'Republican', NULL, NULL, 'IN');
INSERT INTO senator VALUE (1005, 'Brown, Sherrod', 'Democratic', NULL, NULL, 'OH');
INSERT INTO senator VALUE (1006, 'Cardin, Benjamin L.', 'Democratic', NULL, NULL, 'MD');
INSERT INTO senator VALUE (1007, 'Cantwell, Maria', 'Democratic', NULL, NULL, 'WA');
INSERT INTO senator VALUE (1008, 'Cramer, Kevin', 'Republican', NULL, NULL, 'ND');
INSERT INTO senator VALUE (1009, 'Cruz, Ted', 'Republican', NULL, NULL, 'TX');
INSERT INTO senator VALUE (1010, 'Feinstein, Dianne', 'Democratic', NULL, NULL, 'CA');
INSERT INTO senator VALUE (1011, 'Fischer, Deb', 'Republican', NULL, NULL, 'NE');
INSERT INTO senator VALUE (1012, 'Sanders, Bernard', 'Independent', NULL, NULL, 'VT');
INSERT INTO senator VALUE (1013, 'Scott, Rick', 'Republican', NULL, NULL, 'FL');
INSERT INTO senator VALUE (1014, 'Sinema, Kyrsten', 'Democratic', NULL, NULL, 'AZ');
INSERT INTO senator VALUE (1015, 'Stabenow, Debbie', 'Democratic', NULL, NULL, 'MI');
INSERT INTO senator VALUE (1016, 'Tester, Jon', 'Democratic', NULL, NULL, 'MT');
INSERT INTO senator VALUE (1017, 'Hoeven, John', 'Republican', NULL, NULL, 'ND');
INSERT INTO senator VALUE (1018, 'Inhofe, James M.', 'Republican', NULL, NULL, 'OK');
INSERT INTO senator VALUE (1019, 'McConnell, Mitch', 'Republican', NULL, NULL, 'KY');
INSERT INTO senator VALUE (1020, 'Murkowski, Lisa', 'Republican', NULL, NULL, 'AK');
INSERT INTO senator VALUE (1021, 'Enzi, Michael B.', 'Republican', NULL, NULL, 'WY');

INSERT INTO bill VALUE ("S.2522", "Agriculture, FY 2020 (Appropriations)", "Rejected", "2020-09-19");
INSERT INTO sponsor VALUE (1017, "S.2522", "2019-09-19");
INSERT INTO bill VALUE ("S.1790", "Defense, FY 2020 (Agency Authorizations)", "Resolving Differences", "2019-09-19");
INSERT INTO sponsor VALUE (1018, "S.1790", "2019-06-11");
INSERT INTO bill VALUE ("S.J.Res.8", "Green New Deal Resolution, recognition", "Introduced", "2019-02-13");
INSERT INTO sponsor VALUE (1019, "S.J.Res.8", "2019-02-13");
 
INSERT bill VALUE  ("S.47", "Public Lands (Contains reauthorization of the Land and Water Conservation Fund)", "Became Law", "2019-03-12");
INSERT INTO sponsor VALUE (1020, "S.47", "2019-01-08");

INSERT INTO vote VALUE (1001, "S.2522", "Nay");
INSERT INTO vote VALUE (1002, "S.2522", "Nay");
INSERT INTO vote VALUE (1003, "S.2522", "Nay");
INSERT INTO vote VALUE (1004, "S.2522", "Nay");
INSERT INTO vote VALUE (1005, "S.2522", "Nay");
INSERT INTO vote VALUE (1006, "S.2522", "Nay");
INSERT INTO vote VALUE (1007, "S.2522", "Nay");
INSERT INTO vote VALUE (1009, "S.2522", "Nay");
INSERT INTO vote VALUE (1010, "S.2522", "Yea");
INSERT INTO vote VALUE (1011, "S.2522", "Nay");
INSERT INTO vote VALUE (1012, "S.2522", "Nay");
INSERT INTO vote VALUE (1013, "S.2522", "Yea");
INSERT INTO vote VALUE (1014, "S.2522", "Nay");
INSERT INTO vote VALUE (1015, "S.2522", "Nay");
INSERT INTO vote VALUE (1016, "S.2522", "Yea");
INSERT INTO vote VALUE (1017, "S.2522", "Nay");
INSERT INTO vote VALUE (1018, "S.2522", "Yea");
INSERT INTO vote VALUE (1019, "S.2522", "Yea");
INSERT INTO vote VALUE (1020, "S.2522", "Yea");



INSERT INTO vote VALUE (1001, "S.47", "Yea");
INSERT INTO vote VALUE (1002, "S.47", "Nay");
INSERT INTO vote VALUE (1003, "S.47", "Nay");
INSERT INTO vote VALUE (1004, "S.47", "Yea");
INSERT INTO vote VALUE (1005, "S.47", "Nay");
INSERT INTO vote VALUE (1006, "S.47", "Yea");
INSERT INTO vote VALUE (1007, "S.47", "Yea");
INSERT INTO vote VALUE (1008, "S.47", "Yea");
INSERT INTO vote VALUE (1009, "S.47", "Nay");
INSERT INTO vote VALUE (1010, "S.47", "Yea");
INSERT INTO vote VALUE (1011, "S.47", "Nay");
INSERT INTO vote VALUE (1012, "S.47", "Yea");
INSERT INTO vote VALUE (1013, "S.47", "Yea");
INSERT INTO vote VALUE (1014, "S.47", "Yea");
INSERT INTO vote VALUE (1015, "S.47", "Nay");
INSERT INTO vote VALUE (1016, "S.47", "Yea");
INSERT INTO vote VALUE (1017, "S.47", "Nay");
INSERT INTO vote VALUE (1018, "S.47", "Yea");
INSERT INTO vote VALUE (1019, "S.47", "Yea");
INSERT INTO vote VALUE (1020, "S.47", "Yea");
INSERT INTO vote VALUE (1021, "S.47", "Nay");

INSERT INTO vote VALUE (1001, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1002, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1003, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1004, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1005, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1006, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1007, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1008, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1009, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1010, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1011, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1012, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1013, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1014, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1015, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1016, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1017, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1018, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1019, "S.J.Res.8", "Nay");
INSERT INTO vote VALUE (1020, "S.J.Res.8", "Yea");
INSERT INTO vote VALUE (1021, "S.J.Res.8", "Yea");







