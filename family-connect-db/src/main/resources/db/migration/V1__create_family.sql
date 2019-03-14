DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS relation;
DROP TABLE IF EXISTS relation_line;

CREATE TABLE member
(
  id             BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name           VARCHAR(50) NOT NULL,
  age            SMALLINT
    CONSTRAINT positive_age CHECK (age > 0),
  is_gender_male BOOLEAN
);
CREATE TABLE relation
(
  id                     SMALLINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  relation               VARCHAR(20) NOT NULL,
  is_generic_relation    BOOLEAN,
  default_relation_level SMALLINT,
  reverse_relation_id    SMALLINT REFERENCES relation,
  alternate_relation_id  SMALLINT REFERENCES relation
);

CREATE TABLE relation_line
(
  to_member_id   bigint REFERENCES member,
  from_member_id bigint REFERENCES member,
  relation       SMALLINT REFERENCES relation,
  relation_level SMALLINT
);
