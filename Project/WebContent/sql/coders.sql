-- 유저 테이블
    create table user_member(
        user_id varchar2(30) primary key,           -- 유저 아이디
        user_name varchar2(30),                     -- 유저 닉네임
        user_date date,                             -- 유저 가입일자
        user_profile varchar2(1000),                -- 유저 자기소개
        user_homepage varchar2(200)                 -- 유저 홈페이지 url
    );

-- Q&A 게시판 테이블  
    create table qna (
        qna_num number(5) primary key,      -- qna 게시판 번호
        qna_writer references user_member(user_id) on delete cascade,   -- qna 게시판 작성자
        qna_title varchar2(200) not null,   -- qna 게시판 제목
        qna_cont varchar2(1000) not null,   -- qna 게시판 내용
        qna_date date,                      -- qna 게시판 작성일자
        qna_update date,                    -- qna 게시판 수정일자
        qna_file varchar2(300),             -- qna 게시판 첨부파일
        qna_hit number(5),                  -- qna 게시판 조회수
        qna_tag varchar2(20)                -- qna 게시판 태그(말머리)
    );

-- 스터디 모임 게시판 테이블
    create table study_group(
        study_num number(5) primary key,        -- 스터디 게시글 번호  
        study_writer references user_member(user_id) on delete cascade,   -- 스터디 게시글 작성자
        study_title varchar2(200) not null,     -- 스터디 게시글 제목
        study_cont varchar2(1000) not null,     -- 스터디 게시글 내용
        study_date date,                        -- 스터디 게시글 작성일자
        study_update date,                      -- 스터디 게시글 수정일자
        study_people number(2),                 -- 스터디 게시글 모집인원
        study_status varchar2(20),              -- 스터디 게시글 모집현황
        study_start date,                       -- 스터디 모집 시작 일자
        study_end date,                         -- 스터디 모집 종료 일자
        study_file varchar2(300),               -- 스터디 게시글 첨부파일
        study_hit number(5)                     -- 스터디 게시글 조회수
    );

-- Q&A 답변 테이블 (
    create table qna_comment(
        qcomment_num number(5) primary key,      -- qna 댓글 번호
        qna_num references qna(qna_num) on delete cascade,  -- qna 게시글 번호
        qcomment_writer references user_member(user_id) on delete cascade,    -- qna 댓글 작성자
        qcomment_cont varchar2(1000) not null,   -- qna 댓글 내용
        qcomment_date date,                      -- qna 댓글 작성일자
        qcomment_update date,                    -- qna 댓글 수정일자
        qcomment_good number(5),                 -- qna 댓글 좋아요 갯수
        qcommnet_file varchar2(300)              -- qna 댓글 첨부파일
);



-- 스터디 모임 답변 테이블
    create table study_comment(
        scomment_num number(5) primary key,     -- 스터디 댓글 번호
        study_num references study_group(study_num) on delete cascade,    -- 스터디 게시글 번호
        scomment_writer references user_member(user_id) on delete cascade, -- 스터디 댓글 작성자
        scomment_cont varchar2(1000) not null,      -- 스터디 게시글 내용
        scomment_date date,                         -- 스터디 게시글 작성일자
        scomment_update date                        -- 스터디 게시글 수정일자
    );
    
-- 좋아요 테이블
   create table good(
        good_num number(5) primary key,             -- 좋아요 번호
        qna_num references qna(qna_num) on delete cascade,   -- qna 답변 번호
        user_id references user_member(user_id) on delete cascade	-- 유저 아이디
    );
