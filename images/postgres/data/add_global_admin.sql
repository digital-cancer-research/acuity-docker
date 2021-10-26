INSERT INTO acuity.acl_sid VALUES (3, true, 'user@example.com');

INSERT INTO acuity.users VALUES ('user@example.com', 'user@example.com', 'password', true, NULL);

INSERT INTO acuity.authorities VALUES ('user@example.com', 'DEFAULT_ROLE');

INSERT INTO acuity.group_members VALUES (1, 'user@example.com', 1);
INSERT INTO acuity.group_members VALUES (2, 'user@example.com', 2);
INSERT INTO acuity.group_members VALUES (3, 'user@example.com', 3);

SELECT setval('acl_sid_sequence', (SELECT cast(max(id) as bigint) FROM acuity.acl_sid), true);
SELECT setval('group_members_sequence', (SELECT cast(max(id) as bigint) FROM acuity.group_members), true);
