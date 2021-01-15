create table activity
(
    id              int auto_increment comment '活动id'
        primary key,
    organization_id int                                    null comment '活动所属组织ID',
    activity_type   int          default 0                 null comment '活动类型',
    content         longtext                               null comment '活动描述',
    images          varchar(255) default ''                null comment '封面图片',
    create_date     timestamp    default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time     timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间',
    start_date      date                                   null comment '活动开始时间',
    end_date        date                                   null comment '活动结束时间',
    address         varchar(255) default ''                null comment '活动地址',
    video           varchar(255) default ''                null comment '活动宣传视频',
    enabled         tinyint(1)   default 1                 null comment '活动状态',
    activity_star   int          default 0                 null comment '活动收藏数',
    activity_like   int          default 0                 null comment '活动点赞数'
)
    comment '活动表';

create table activity_collection
(
    id          int auto_increment comment '活动收藏ID'
        primary key,
    create_time timestamp  default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间',
    activity_id int                                  null comment '活动id',
    open_id     varchar(100)                         null comment '用户openid',
    status      tinyint(1) default 1                 null comment '收藏状态，0取消，1收藏'
)
    comment '活动收藏表';

create table activity_comment
(
    id          int auto_increment comment '评论ID'
        primary key,
    content     longtext                            null comment '评论内容',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    activity_id int                                 null comment '活动id',
    open_id     varchar(100)                        null comment '评论用户openid'
)
    comment '活动评论表';

create table activity_type
(
    id       int auto_increment comment '活动类型id'
        primary key,
    name     varchar(20)  default '' null comment '活动分类名称',
    about_us varchar(255) default '' null comment '描述'
)
    comment '活动类型表';

create table admin_menu
(
    id        int auto_increment
        primary key,
    path      varchar(64) null,
    name      varchar(64) null,
    name_zh   varchar(64) null,
    icon_cls  varchar(64) null,
    component varchar(64) null,
    parent_id int         null
)
    charset = utf8mb4;

create table admin_permission
(
    id    int auto_increment
        primary key,
    name  varchar(100) null,
    desc_ varchar(100) null,
    url   varchar(100) null
)
    charset = utf8;

create table admin_role
(
    id      int auto_increment
        primary key,
    name    varchar(100) null,
    name_zh varchar(100) null,
    enabled tinyint(1)   null
)
    charset = utf8;

create table admin_role_menu
(
    id  int auto_increment
        primary key,
    rid int null,
    mid int null
)
    charset = utf8mb4;

create table admin_role_permission
(
    id  int(20) auto_increment
        primary key,
    rid int(20) null,
    pid int(20) null
)
    charset = utf8;

create index fk_role_permission_permission_1
    on admin_role_permission (pid);

create index fk_role_permission_role_1
    on admin_role_permission (rid);

create table admin_user_role
(
    id  int auto_increment
        primary key,
    uid int null,
    rid int null
)
    charset = utf8;

create index fk_operator_role_operator_1
    on admin_user_role (uid);

create index fk_operator_role_role_1
    on admin_user_role (rid);

create table blog
(
    id          int auto_increment comment '博客ID'
        primary key,
    open_id     varchar(100) default ''                null comment '用户openid',
    content     longtext                               null comment '内容',
    create_date timestamp    default CURRENT_TIMESTAMP not null comment '创建时间',
    blog_image  int                                    null comment '图片ID'
)
    comment '博客表';

create table blog_comment
(
    id          int auto_increment comment '评论ID'
        primary key,
    content     longtext                            null comment '评论内容',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    blog_id     int                                 null comment '博客id',
    open_id     varchar(100)                        null comment '评论用户openid'
)
    comment '博客评论表';

create table images
(
    id      int auto_increment comment '图片ID'
        primary key,
    address varchar(255) default '' null comment '图片地址'
)
    comment '图片表';

create table `join`
(
    id             int auto_increment comment '活动参与ID'
        primary key,
    create_date    date         null comment '报名时间',
    activity_id    int          null comment '活动id',
    open_id        varchar(100) null comment '参加用户openid',
    name           varchar(100) null comment '学生姓名',
    student_number varchar(100) null comment '学生学号',
    phone          varchar(255) null comment '联系方式'
)
    comment '活动报名表';

create index activity_id
    on `join` (activity_id);

create index open_id
    on `join` (open_id);

create table jotter_article
(
    id                   int auto_increment
        primary key,
    article_title        varchar(255) null,
    article_content_html longtext     null,
    article_content_md   longtext     null,
    article_abstract     varchar(255) null,
    article_cover        varchar(255) null,
    article_date         datetime     null on update CURRENT_TIMESTAMP
)
    charset = utf8mb4;

create table organization
(
    id                int auto_increment
        primary key,
    name              varchar(255) default '' null comment '学生组织名称',
    phone             varchar(30)  default '' null comment '手机',
    wechat            varchar(30)  default '' null comment '微信',
    email             varchar(50)  default '' null comment '邮箱',
    about_us          varchar(255) default '' null comment '描述',
    image             varchar(255) default '' null comment '组织头像',
    star              int          default 0  null comment '收藏数',
    organization_type int                     null comment '组织分类'
)
    comment '学生组织表';

create table organization_collection
(
    id              int auto_increment comment '组织收藏ID'
        primary key,
    create_time     timestamp  default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time     timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间',
    organization_id int                                  null comment '组织id',
    open_id         varchar(100)                         null comment '参加用户openid',
    status          tinyint(1) default 1                 null comment '收藏状态，0取消，1收藏'
)
    comment '组织收藏表';

create table organization_type
(
    id       int auto_increment comment '学生组织分类ID'
        primary key,
    name     varchar(20)  default '' null comment '学生组织分类名称',
    about_us varchar(255) default '' null comment '描述'
)
    comment '学生组织类型表';

create table user
(
    id       int auto_increment
        primary key,
    username char(255)    not null,
    password varchar(255) null,
    salt     varchar(255) null,
    name     varchar(255) null,
    phone    varchar(255) null,
    email    varchar(255) null,
    enabled  tinyint(1)   null
)
    charset = utf8;

create table user_like
(
    id          int auto_increment comment '活动参与ID'
        primary key,
    create_time timestamp  default CURRENT_TIMESTAMP not null comment '创建时间',
    update_time timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '修改时间',
    activity_id int                                  null comment '活动id',
    open_id     varchar(100)                         null comment '参加用户openid',
    status      tinyint(1) default 1                 null comment '点赞状态，0取消，1点赞'
)
    comment '用户点赞表';

create table wx_user
(
    id          int auto_increment
        primary key,
    openid      varchar(28)  default ''                null comment '小程序用户的openid',
    nickname    varchar(100) default ''                null comment '用户昵称',
    avatarurl   varchar(100) default ''                null comment '用户头像',
    gender      tinyint(1)                             null comment '性别  0-男、1-女',
    country     varchar(100) default ''                null comment '所在国家',
    province    varchar(100) default ''                null comment '省份',
    city        varchar(100) default ''                null comment '城市',
    language    varchar(100) default ''                null comment '语种',
    create_date timestamp    default CURRENT_TIMESTAMP not null comment '创建时间'
)
    comment '小程序用户表';

