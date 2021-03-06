update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'common.schema.version';

alter table ACT_RU_ENTITYLINK add ROOT_SCOPE_ID_ nvarchar(255);
alter table ACT_RU_ENTITYLINK add ROOT_SCOPE_TYPE_ nvarchar(255);
create index ACT_IDX_ENT_LNK_ROOT_SCOPE on ACT_RU_ENTITYLINK(ROOT_SCOPE_ID_, ROOT_SCOPE_TYPE_, LINK_TYPE_);

alter table ACT_HI_ENTITYLINK add ROOT_SCOPE_ID_ nvarchar(255);
alter table ACT_HI_ENTITYLINK add ROOT_SCOPE_TYPE_ nvarchar(255);
create index ACT_IDX_HI_ENT_LNK_ROOT_SCOPE on ACT_HI_ENTITYLINK(ROOT_SCOPE_ID_, ROOT_SCOPE_TYPE_, LINK_TYPE_);

alter table ACT_RU_ENTITYLINK add SUB_SCOPE_ID_ nvarchar(255);
alter table ACT_RU_ENTITYLINK add PARENT_ELEMENT_ID_ nvarchar(255);

alter table ACT_HI_ENTITYLINK add SUB_SCOPE_ID_ nvarchar(255);
alter table ACT_HI_ENTITYLINK add PARENT_ELEMENT_ID_ nvarchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'entitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'identitylink.schema.version';

alter table ACT_RU_JOB add CATEGORY_ nvarchar(255);

alter table ACT_RU_TIMER_JOB add CATEGORY_ nvarchar(255);

alter table ACT_RU_SUSPENDED_JOB add CATEGORY_ nvarchar(255);

alter table ACT_RU_DEADLETTER_JOB add CATEGORY_ nvarchar(255);

create table ACT_RU_EXTERNAL_JOB (
    ID_ nvarchar(64) NOT NULL,
    REV_ int,
    CATEGORY_ varchar(255),
    TYPE_ nvarchar(255) NOT NULL,
    LOCK_EXP_TIME_ datetime,
    LOCK_OWNER_ nvarchar(255),
    EXCLUSIVE_ bit,
    EXECUTION_ID_ nvarchar(64),
    PROCESS_INSTANCE_ID_ nvarchar(64),
    PROC_DEF_ID_ nvarchar(64),
    ELEMENT_ID_ nvarchar(255),
    ELEMENT_NAME_ nvarchar(255),
    SCOPE_ID_ nvarchar(255),
    SUB_SCOPE_ID_ nvarchar(255),
    SCOPE_TYPE_ nvarchar(255),
    SCOPE_DEFINITION_ID_ nvarchar(255),
    RETRIES_ int,
    EXCEPTION_STACK_ID_ nvarchar(64),
    EXCEPTION_MSG_ nvarchar(4000),
    DUEDATE_ datetime NULL,
    REPEAT_ nvarchar(255),
    HANDLER_TYPE_ nvarchar(255),
    HANDLER_CFG_ nvarchar(4000),
    CUSTOM_VALUES_ID_ nvarchar(64),
    CREATE_TIME_ datetime2 NULL,
    TENANT_ID_ nvarchar(255) default '',
    primary key (ID_)
);

create index ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID on ACT_RU_EXTERNAL_JOB(EXCEPTION_STACK_ID_);
create index ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID on ACT_RU_EXTERNAL_JOB(CUSTOM_VALUES_ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EXTERNAL_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_EJOB_SCOPE on ACT_RU_EXTERNAL_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SUB_SCOPE on ACT_RU_EXTERNAL_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SCOPE_DEF on ACT_RU_EXTERNAL_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

alter table ACT_RU_JOB add CORRELATION_ID_ nvarchar(255);
alter table ACT_RU_TIMER_JOB add CORRELATION_ID_ nvarchar(255);
alter table ACT_RU_SUSPENDED_JOB add CORRELATION_ID_ nvarchar(255);
alter table ACT_RU_DEADLETTER_JOB add CORRELATION_ID_ nvarchar(255);
alter table ACT_RU_EXTERNAL_JOB add CORRELATION_ID_ nvarchar(255);

create index ACT_IDX_JOB_CORRELATION_ID on ACT_RU_JOB(CORRELATION_ID_);
create index ACT_IDX_TIMER_JOB_CORRELATION_ID on ACT_RU_TIMER_JOB(CORRELATION_ID_);
create index ACT_IDX_SUSPENDED_JOB_CORRELATION_ID on ACT_RU_SUSPENDED_JOB(CORRELATION_ID_);
create index ACT_IDX_DEADLETTER_JOB_CORRELATION_ID on ACT_RU_DEADLETTER_JOB(CORRELATION_ID_);
create index ACT_IDX_EXTERNAL_JOB_CORRELATION_ID on ACT_RU_EXTERNAL_JOB(CORRELATION_ID_);

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'batch.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'variable.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'eventsubscription.schema.version';

alter table ACT_RU_EXECUTION add LOCK_OWNER_ nvarchar(255);
alter table ACT_RU_EXECUTION add EXTERNAL_WORKER_JOB_COUNT_ int;

alter table ACT_RU_ACTINST add TRANSACTION_ORDER_ int;

alter table ACT_HI_ACTINST add TRANSACTION_ORDER_ int;

update ACT_GE_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'schema.version';
update ACT_ID_PROPERTY set VALUE_ = '6.6.0.0' where NAME_ = 'schema.version';


UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:15:32.112' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_APP_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:15:39.670' WHERE [ID] = 1 AND [LOCKED] = 0

ALTER TABLE [ACT_CMMN_RU_CASE_INST] ADD [LOCK_OWNER_] [varchar](255)

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 11, '7:e77f0eb21b221f823d6a0e198144cefc', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1993740103')

ALTER TABLE [ACT_CMMN_RU_PLAN_ITEM_INST] ADD [LAST_UNAVAILABLE_TIME_] [datetime]

ALTER TABLE [ACT_CMMN_HI_PLAN_ITEM_INST] ADD [LAST_UNAVAILABLE_TIME_] [datetime]

INSERT INTO [ACT_CMMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', GETDATE(), 12, '7:c5ddabeb0c9fb8db6371c249097d78a3', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1993740103')

UPDATE [ACT_CMMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:15:46.854' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [FLW_EV_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:15:53.902' WHERE [ID] = 1 AND [LOCKED] = 0

DROP INDEX ACT_IDX_DEC_TBL_UNIQ ON [ACT_DMN_DECISION_TABLE]

exec sp_rename '[ACT_DMN_DECISION_TABLE]', 'ACT_DMN_DECISION'

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_DMN_DEC_UNIQ ON [ACT_DMN_DECISION]([KEY_], [VERSION_], [TENANT_ID_])

INSERT INTO [ACT_DMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', GETDATE(), 6, '7:4b6469565b1b00b428ffca7eab1ef253', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1993754618')

ALTER TABLE [ACT_DMN_DECISION] ADD [DECISION_TYPE_] [varchar](255)

INSERT INTO [ACT_DMN_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', GETDATE(), 7, '7:f83b7b3228be2c4bbb554d6de45307d7', 'addColumn tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1993754618')

UPDATE [ACT_DMN_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:16:04.430' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1



UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.10.1 (192.168.10.1)', [LOCKGRANTED] = '2020-10-06T16:16:12.482' WHERE [ID] = 1 AND [LOCKED] = 0

UPDATE [ACT_CO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

