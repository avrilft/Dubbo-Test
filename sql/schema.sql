# this is sql file, create for 2021/9/19
drop database dubboTest;
create database dubboTest default charset utf8mb4;
use dubboTest;

create table permission
(
    id          bigint primary key comment 'id',
    name        varchar(100) not null unique key comment '权限名称',
    display     varchar(100) not null comment '权限显示名称',
    create_time timestamp    not null default now() comment '创建时间',
    modify_time timestamp    not null default now() comment '修改时间'
) comment '权限表';
create table role
(
    id          bigint primary key comment '角色ID',
    name        varchar(100) unique key comment '角色名称',
    display     varchar(100) not null comment '角色显示名称',
    create_time timestamp    not null default now() comment '创建时间',
    modify_time timestamp    not null default now() comment '修改时间'
) comment '角色表';
create table rule_and_permission
(
    id            bigint comment 'id',
    role_id       bigint    not null comment '角色ID',
    permission_id bigint    not null comment '权限ID',
    create_time   timestamp not null default now() comment '创建时间',
    modify_time   timestamp not null default now() comment '修改时间',
    primary key (id, role_id, permission_id)
) comment '权限角色映射表';
create table user
(
    id          bigint primary key comment '用户ID',
    phone       char(11) unique key comment '手机号',
    nick_name   varchar(50) not null comment '昵称',
    passowrd    char(225)   not null comment '密码',
    create_time timestamp   not null default now() comment '创建时间',
    modify_time timestamp   not null default now() comment '修改时间'
) comment '用户表';
create table user_and_role
(
    id          bigint comment 'ID',
    user_id     bigint comment '用户ID',
    role_id     bigint comment '角色ID',
    create_time timestamp not null default now() comment '创建时间',
    modify_time timestamp not null default now() comment '修改时间',
    primary key (id, user_id, role_id)
);