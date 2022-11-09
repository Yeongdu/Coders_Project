-- ���� ���̺�
    create table user_member(
        user_id varchar2(30) primary key,           -- ���� ���̵�
        user_name varchar2(30),                     -- ���� �г���
        user_date date,                             -- ���� ��������
        user_profile varchar2(1000),                -- ���� �ڱ�Ұ�
        user_homepage varchar2(200),                 -- ���� Ȩ������ url
        user_pwd varchar2(1000),
        user_file varchar2(300)
    );

-- Q&A �Խ��� ���̺�  
    create table qna (
        qna_num number(5) primary key,      -- qna �Խ��� ��ȣ
        qna_writer references user_member(user_id) on delete cascade,   -- qna �Խ��� �ۼ���
        qna_title varchar2(200) not null,   -- qna �Խ��� ����
        qna_cont varchar2(1000) not null,   -- qna �Խ��� ����
        qna_date date,                      -- qna �Խ��� �ۼ�����
        qna_update date,                    -- qna �Խ��� ��������
        qna_file varchar2(300),             -- qna �Խ��� ÷������
        qna_hit number(5),                  -- qna �Խ��� ��ȸ��
        qna_tag varchar2(20)                -- qna �Խ��� �±�(���Ӹ�)
    );

-- ���͵� ���� �Խ��� ���̺�
    create table study_group(
        study_num number(5) primary key,        -- ���͵� �Խñ� ��ȣ  
        study_writer references user_member(user_id) on delete cascade,   -- ���͵� �Խñ� �ۼ���
        study_title varchar2(200) not null,     -- ���͵� �Խñ� ����
        study_cont varchar2(1000) not null,     -- ���͵� �Խñ� ����
        study_date date,                        -- ���͵� �Խñ� �ۼ�����
        study_update date,                      -- ���͵� �Խñ� ��������
        study_people number(2),                 -- ���͵� �Խñ� �����ο�
        study_status varchar2(20),              -- ���͵� �Խñ� ������Ȳ
        study_start date,                       -- ���͵� ���� ���� ����
        study_end date,                         -- ���͵� ���� ���� ����
        study_file varchar2(300),               -- ���͵� �Խñ� ÷������
        study_hit number(5)                     -- ���͵� �Խñ� ��ȸ��
    );

-- Q&A �亯 ���̺� (
    create table qna_comment(
        qcomment_num number(5) primary key,      -- qna ��� ��ȣ
        qna_num references qna(qna_num) on delete cascade,  -- qna �Խñ� ��ȣ
        qcomment_writer references user_member(user_id) on delete cascade,    -- qna ��� �ۼ���
        qcomment_cont varchar2(1000) not null,   -- qna ��� ����
        qcomment_date date,                      -- qna ��� �ۼ�����
        qcomment_update date,                    -- qna ��� ��������
        qcomment_good number(5),                 -- qna ��� ���ƿ� ����
        qcommnet_file varchar2(300)              -- qna ��� ÷������
);



-- ���͵� ���� �亯 ���̺�
    create table study_comment(
        scomment_num number(5) primary key,     -- ���͵� ��� ��ȣ
        study_num references study_group(study_num) on delete cascade,    -- ���͵� �Խñ� ��ȣ
        scomment_writer references user_member(user_id) on delete cascade, -- ���͵� ��� �ۼ���
        scomment_cont varchar2(1000) not null,      -- ���͵� �Խñ� ����
        scomment_date date,                         -- ���͵� �Խñ� �ۼ�����
        scomment_update date                        -- ���͵� �Խñ� ��������
    );
    
-- ���ƿ� ���̺�
   create table good(
        good_num number(5) primary key,             -- ���ƿ� ��ȣ
        qna_num references qna(qna_num) on delete cascade,   -- qna �亯 ��ȣ
        user_id references user_member(user_id) on delete cascade	-- ���� ���̵�
    );
    
      create table bad(
        bad_num number(5) primary key,             -- ���ƿ� ��ȣ
        qna_num references qna(qna_num) on delete cascade,   -- qna �亯 ��ȣ
        user_id references user_member(user_id) on delete cascade	-- ���� ���̵�
    );