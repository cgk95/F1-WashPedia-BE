-- Autogenerated: do not edit this file

CREATE TABLE if not exists BATCH_JOB_INSTANCE
(
    JOB_INSTANCE_ID BIGINT       NOT NULL PRIMARY KEY,
    VERSION         BIGINT,
    JOB_NAME        VARCHAR(100) NOT NULL,
    JOB_KEY         VARCHAR(32)  NOT NULL,
    constraint JOB_INST_UN unique (JOB_NAME, JOB_KEY)
);


CREATE TABLE if not exists BATCH_JOB_EXECUTION
(
    JOB_EXECUTION_ID BIGINT    NOT NULL PRIMARY KEY,
    VERSION          BIGINT,
    JOB_INSTANCE_ID  BIGINT    NOT NULL,
    CREATE_TIME      TIMESTAMP NOT NULL,
    START_TIME       TIMESTAMP DEFAULT NULL,
    END_TIME         TIMESTAMP DEFAULT NULL,
    STATUS           VARCHAR(10),
    EXIT_CODE        VARCHAR(2500),
    EXIT_MESSAGE     VARCHAR(2500),
    LAST_UPDATED     TIMESTAMP,
    constraint JOB_INST_EXEC_FK foreign key (JOB_INSTANCE_ID)
        references BATCH_JOB_INSTANCE (JOB_INSTANCE_ID)
);


CREATE TABLE if not exists BATCH_JOB_EXECUTION_PARAMS
(
    JOB_EXECUTION_ID BIGINT       NOT NULL,
    PARAMETER_NAME   VARCHAR(100) NOT NULL,
    PARAMETER_TYPE   VARCHAR(100) NOT NULL,
    PARAMETER_VALUE  VARCHAR(2500),
    IDENTIFYING      CHAR(1)      NOT NULL,
    constraint JOB_EXEC_PARAMS_FK foreign key (JOB_EXECUTION_ID)
        references BATCH_JOB_EXECUTION (JOB_EXECUTION_ID)
);


CREATE TABLE if not exists BATCH_STEP_EXECUTION
(
    STEP_EXECUTION_ID  BIGINT       NOT NULL PRIMARY KEY,
    VERSION            BIGINT       NOT NULL,
    STEP_NAME          VARCHAR(100) NOT NULL,
    JOB_EXECUTION_ID   BIGINT       NOT NULL,
    CREATE_TIME        TIMESTAMP    NOT NULL,
    START_TIME         TIMESTAMP DEFAULT NULL,
    END_TIME           TIMESTAMP DEFAULT NULL,
    STATUS             VARCHAR(10),
    COMMIT_COUNT       BIGINT,
    READ_COUNT         BIGINT,
    FILTER_COUNT       BIGINT,
    WRITE_COUNT        BIGINT,
    READ_SKIP_COUNT    BIGINT,
    WRITE_SKIP_COUNT   BIGINT,
    PROCESS_SKIP_COUNT BIGINT,
    ROLLBACK_COUNT     BIGINT,
    EXIT_CODE          VARCHAR(2500),
    EXIT_MESSAGE       VARCHAR(2500),
    LAST_UPDATED       TIMESTAMP,
    constraint JOB_EXEC_STEP_FK foreign key (JOB_EXECUTION_ID)
        references BATCH_JOB_EXECUTION (JOB_EXECUTION_ID)
);


CREATE TABLE if not exists BATCH_STEP_EXECUTION_CONTEXT
(
    STEP_EXECUTION_ID  BIGINT        NOT NULL PRIMARY KEY,
    SHORT_CONTEXT      VARCHAR(2500) NOT NULL,
    SERIALIZED_CONTEXT TEXT,
    constraint STEP_EXEC_CTX_FK foreign key (STEP_EXECUTION_ID)
        references BATCH_STEP_EXECUTION (STEP_EXECUTION_ID)
);


CREATE TABLE if not exists BATCH_JOB_EXECUTION_CONTEXT
(
    JOB_EXECUTION_ID   BIGINT        NOT NULL PRIMARY KEY,
    SHORT_CONTEXT      VARCHAR(2500) NOT NULL,
    SERIALIZED_CONTEXT TEXT,
    constraint JOB_EXEC_CTX_FK foreign key (JOB_EXECUTION_ID)
        references BATCH_JOB_EXECUTION (JOB_EXECUTION_ID)
);


CREATE SEQUENCE if not exists BATCH_STEP_EXECUTION_SEQ MAXVALUE 9223372036854775807 NO CYCLE;
CREATE SEQUENCE if not exists BATCH_JOB_EXECUTION_SEQ MAXVALUE 9223372036854775807 NO CYCLE;
CREATE SEQUENCE if not exists BATCH_JOB_SEQ MAXVALUE 9223372036854775807 NO CYCLE;


CREATE TABLE if not exists reported_product
(
    mst_id        VARCHAR(255) NOT NULL,
    inspct_org    VARCHAR(255),
    prdt_type     VARCHAR(255),
    issu_date     TIMESTAMP WITHOUT TIME ZONE,
    renew_yn      VARCHAR(255),
    safe_sd       TEXT,
    expr_date     TIMESTAMP WITHOUT TIME ZONE,
    upper_item    VARCHAR(255),
    kid_prt_pkg   VARCHAR(255),
    df            VARCHAR(255),
    propos        TEXT,
    dtrb_lmt      VARCHAR(255),
    wt_bulk       VARCHAR(255),
    icepnt        VARCHAR(255),
    stddusqy      TEXT,
    usmtd         TEXT,
    us_atnrpt     TEXT,
    frsaid        TEXT,
    sum1          TEXT,
    sum2          TEXT,
    sum3          TEXT,
    sum4          TEXT,
    sum5          TEXT,
    sum6          TEXT,
    mf_icm        VARCHAR(255),
    mf_mthd       TEXT,
    mf_nation     VARCHAR(255),
    comp_addr     VARCHAR(255),
    comp_tel      VARCHAR(255),
    in_comp_nm    VARCHAR(255),
    in_comp_addr  VARCHAR(255),
    in_comp_tel   VARCHAR(255),
    odm_comp_nm   VARCHAR(255),
    odm_comp_addr VARCHAR(255),
    odm_comp_tel  VARCHAR(255),
    created_at    date,
    created_by    VARCHAR(255) NOT NULL,
    modified_at   date,
    modified_by   VARCHAR(255),
    prdt_nm       VARCHAR(255),
    slfsfcfst_no  VARCHAR(255),
    item          VARCHAR(255),
    est_no        INTEGER,
    reg_date      TIMESTAMP WITHOUT TIME ZONE,
    comp_nm       VARCHAR(255),
    CONSTRAINT pk_reportedproduct PRIMARY KEY (mst_id, est_no)
);


CREATE TABLE if not exists concerned_product
(
    prdt_no                    VARCHAR(255) PRIMARY KEY,
    prdt_name                  VARCHAR(255) NOT NULL,
    slfsfcfst_no               VARCHAR(255) NOT NULL,
    item                       VARCHAR(255) NOT NULL,
    comp_nm                    VARCHAR(255) NOT NULL,
    inspected_organization     VARCHAR(255),
    issued_date                DATE,
    upper_item                 VARCHAR(255),
    product_type               VARCHAR(255),
    renewed_type               VARCHAR(255),
    safety_inspection_standard TEXT,
    kid_protect_package        VARCHAR(255),
    manufacture_nation         VARCHAR(255),
    product_definition         VARCHAR(255),
    manufacture                TEXT,
    created_at                 DATE         NOT NULL DEFAULT CURRENT_DATE,
    created_by                 VARCHAR(255) NOT NULL DEFAULT 'admin',
    modified_at                DATE,
    modified_by                VARCHAR(255)
);