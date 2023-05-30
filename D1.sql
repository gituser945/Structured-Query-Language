{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*------------------------ DAY 1 --------------------------*/\
\
/* Query to drop database */\
\
\
DROP DATABASE SlimeStore;\
\
/* Query to select current database */\
\
USE pet_shop;\
\
/* Query to check selected database */\
\
SELECT DATABASE();\
\
/* Query to create database */\
\
CREATE DATABASE tes_shop;\
\
/* Query to select current database */\
\
USE tes_shop;\
\
/* Query to create table */\
\
CREATE TABLE tweet (\
  username VARCHAR(15),\
  tweet_content VARCHAR(140),\
  number_of_favorites INT\
);\
\
/* Query to see all table in selected database */\
\
SHOW TABLES;\
\
USE tes_shop;\
\
/* Show columns name from table */\
\
SHOW COLUMNS FROM tweet;\
\
/* shorter version */\
\
DESC tweet;\
}