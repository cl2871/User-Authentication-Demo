PREPARE adduserplan (text, text, bool) AS
    INSERT INTO users (username, password, enabled) VALUES ($1, $2, $3);

PREPARE addauthorityplan(text, text) AS
    INSERT INTO authorities (username, authority) VALUES ($1, $2);

EXECUTE adduserplan('${adminUsername}', '${adminEncodedPassword}', true);
EXECUTE addauthorityplan('${adminUsername}', '${adminRole}');
EXECUTE addauthorityplan('${adminUsername}', '${userRole}');

EXECUTE adduserplan('${userUsername}', '${userEncodedPassword}', true);
EXECUTE addauthorityplan('${userUsername}', '${userRole}');
