PGDMP                         z            blogs    13.6    13.6 �    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    27471    blogs    DATABASE     g   CREATE DATABASE blogs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_El Salvador.1252';
    DROP DATABASE blogs;
                postgres    false            �            1259    27512    blog    TABLE     :  CREATE TABLE public.blog (
    id_blog integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying NOT NULL,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    icon_blog character varying(255) NOT NULL,
    cover_blog character varying(255) NOT NULL
);
    DROP TABLE public.blog;
       public         heap    postgres    false            �            1259    27510    blog_id_blog_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_id_blog_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.blog_id_blog_seq;
       public          postgres    false    207            �           0    0    blog_id_blog_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.blog_id_blog_seq OWNED BY public.blog.id_blog;
          public          postgres    false    206            �            1259    27568    category    TABLE     p   CREATE TABLE public.category (
    id_category integer NOT NULL,
    category character varying(50) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    27566    category_id_category_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_id_category_seq;
       public          postgres    false    215            �           0    0    category_id_category_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;
          public          postgres    false    214            �            1259    27547    donation    TABLE     !  CREATE TABLE public.donation (
    id_donation integer NOT NULL,
    id_user integer NOT NULL,
    id_blog integer NOT NULL,
    amount double precision NOT NULL,
    date_donation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    payment_method character varying(25) NOT NULL
);
    DROP TABLE public.donation;
       public         heap    postgres    false            �            1259    27545    donation_id_blog_seq    SEQUENCE     �   CREATE SEQUENCE public.donation_id_blog_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.donation_id_blog_seq;
       public          postgres    false    213            �           0    0    donation_id_blog_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.donation_id_blog_seq OWNED BY public.donation.id_blog;
          public          postgres    false    212            �            1259    27541    donation_id_donation_seq    SEQUENCE     �   CREATE SEQUENCE public.donation_id_donation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.donation_id_donation_seq;
       public          postgres    false    213            �           0    0    donation_id_donation_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.donation_id_donation_seq OWNED BY public.donation.id_donation;
          public          postgres    false    210            �            1259    27543    donation_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.donation_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.donation_id_user_seq;
       public          postgres    false    213            �           0    0    donation_id_user_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.donation_id_user_seq OWNED BY public.donation.id_user;
          public          postgres    false    211            �            1259    27484    logup    TABLE     �   CREATE TABLE public.logup (
    id_logup integer NOT NULL,
    id_user integer NOT NULL,
    date_logup timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.logup;
       public         heap    postgres    false            �            1259    27482    logup_id_logup_seq    SEQUENCE     �   CREATE SEQUENCE public.logup_id_logup_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.logup_id_logup_seq;
       public          postgres    false    203            �           0    0    logup_id_logup_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.logup_id_logup_seq OWNED BY public.logup.id_logup;
          public          postgres    false    202            �            1259    27582    post    TABLE     j  CREATE TABLE public.post (
    id_post integer NOT NULL,
    id_blog integer NOT NULL,
    id_user integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying NOT NULL,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    content_url character varying(255) NOT NULL,
    id_category integer NOT NULL
);
    DROP TABLE public.post;
       public         heap    postgres    false            �            1259    27672    post_comment    TABLE     �   CREATE TABLE public.post_comment (
    id_comment integer NOT NULL,
    id_post integer NOT NULL,
    id_user integer NOT NULL,
    comment character varying NOT NULL,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.post_comment;
       public         heap    postgres    false            �            1259    27666    post_comment_id_comment_seq    SEQUENCE     �   CREATE SEQUENCE public.post_comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.post_comment_id_comment_seq;
       public          postgres    false    234            �           0    0    post_comment_id_comment_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.post_comment_id_comment_seq OWNED BY public.post_comment.id_comment;
          public          postgres    false    231            �            1259    27668    post_comment_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.post_comment_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.post_comment_id_post_seq;
       public          postgres    false    234            �           0    0    post_comment_id_post_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.post_comment_id_post_seq OWNED BY public.post_comment.id_post;
          public          postgres    false    232            �            1259    27670    post_comment_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.post_comment_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.post_comment_id_user_seq;
       public          postgres    false    234            �           0    0    post_comment_id_user_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.post_comment_id_user_seq OWNED BY public.post_comment.id_user;
          public          postgres    false    233            �            1259    27576    post_id_blog_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_blog_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.post_id_blog_seq;
       public          postgres    false    220            �           0    0    post_id_blog_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.post_id_blog_seq OWNED BY public.post.id_blog;
          public          postgres    false    217            �            1259    27580    post_id_category_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.post_id_category_seq;
       public          postgres    false    220            �           0    0    post_id_category_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.post_id_category_seq OWNED BY public.post.id_category;
          public          postgres    false    219            �            1259    27574    post_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.post_id_post_seq;
       public          postgres    false    220            �           0    0    post_id_post_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.post_id_post_seq OWNED BY public.post.id_post;
          public          postgres    false    216            �            1259    27578    post_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.post_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.post_id_user_seq;
       public          postgres    false    220            �           0    0    post_id_user_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.post_id_user_seq OWNED BY public.post.id_user;
          public          postgres    false    218            �            1259    27632    post_subcategory    TABLE     �   CREATE TABLE public.post_subcategory (
    id_post_subcategory integer NOT NULL,
    id_post integer NOT NULL,
    id_subcategory integer NOT NULL
);
 $   DROP TABLE public.post_subcategory;
       public         heap    postgres    false            �            1259    27628    post_subcategory_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.post_subcategory_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.post_subcategory_id_post_seq;
       public          postgres    false    227            �           0    0    post_subcategory_id_post_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.post_subcategory_id_post_seq OWNED BY public.post_subcategory.id_post;
          public          postgres    false    225            �            1259    27626 (   post_subcategory_id_post_subcategory_seq    SEQUENCE     �   CREATE SEQUENCE public.post_subcategory_id_post_subcategory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.post_subcategory_id_post_subcategory_seq;
       public          postgres    false    227            �           0    0 (   post_subcategory_id_post_subcategory_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.post_subcategory_id_post_subcategory_seq OWNED BY public.post_subcategory.id_post_subcategory;
          public          postgres    false    224            �            1259    27630 #   post_subcategory_id_subcategory_seq    SEQUENCE     �   CREATE SEQUENCE public.post_subcategory_id_subcategory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.post_subcategory_id_subcategory_seq;
       public          postgres    false    227            �           0    0 #   post_subcategory_id_subcategory_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.post_subcategory_id_subcategory_seq OWNED BY public.post_subcategory.id_subcategory;
          public          postgres    false    226            �            1259    27654    post_tag    TABLE     �   CREATE TABLE public.post_tag (
    id_post_tag integer NOT NULL,
    id_post integer NOT NULL,
    tag character varying(50) NOT NULL
);
    DROP TABLE public.post_tag;
       public         heap    postgres    false            �            1259    27652    post_tag_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.post_tag_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.post_tag_id_post_seq;
       public          postgres    false    230            �           0    0    post_tag_id_post_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.post_tag_id_post_seq OWNED BY public.post_tag.id_post;
          public          postgres    false    229            �            1259    27650    post_tag_id_post_tag_seq    SEQUENCE     �   CREATE SEQUENCE public.post_tag_id_post_tag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.post_tag_id_post_tag_seq;
       public          postgres    false    230            �           0    0    post_tag_id_post_tag_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.post_tag_id_post_tag_seq OWNED BY public.post_tag.id_post_tag;
          public          postgres    false    228            �            1259    27614    subcategory    TABLE     �   CREATE TABLE public.subcategory (
    id_subcategory integer NOT NULL,
    id_category integer NOT NULL,
    subcategory character varying(50) NOT NULL
);
    DROP TABLE public.subcategory;
       public         heap    postgres    false            �            1259    27612    subcategory_id_category_seq    SEQUENCE     �   CREATE SEQUENCE public.subcategory_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.subcategory_id_category_seq;
       public          postgres    false    223            �           0    0    subcategory_id_category_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.subcategory_id_category_seq OWNED BY public.subcategory.id_category;
          public          postgres    false    222            �            1259    27610    subcategory_id_subcategory_seq    SEQUENCE     �   CREATE SEQUENCE public.subcategory_id_subcategory_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.subcategory_id_subcategory_seq;
       public          postgres    false    223            �           0    0    subcategory_id_subcategory_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.subcategory_id_subcategory_seq OWNED BY public.subcategory.id_subcategory;
          public          postgres    false    221            �            1259    27524    subscription_blog    TABLE     0  CREATE TABLE public.subscription_blog (
    id_subscription_blog integer NOT NULL,
    id_user integer NOT NULL,
    id_blog integer NOT NULL,
    user_level character varying(10) NOT NULL,
    account_status character varying(10) NOT NULL,
    date_creation timestamp without time zone DEFAULT now()
);
 %   DROP TABLE public.subscription_blog;
       public         heap    postgres    false            �            1259    27522 *   subscription_blog_id_subscription_blog_seq    SEQUENCE     �   CREATE SEQUENCE public.subscription_blog_id_subscription_blog_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.subscription_blog_id_subscription_blog_seq;
       public          postgres    false    209            �           0    0 *   subscription_blog_id_subscription_blog_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.subscription_blog_id_subscription_blog_seq OWNED BY public.subscription_blog.id_subscription_blog;
          public          postgres    false    208            �            1259    27498    user_action    TABLE     �   CREATE TABLE public.user_action (
    id_user_action integer NOT NULL,
    id_user integer NOT NULL,
    user_action character varying(50) NOT NULL,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.user_action;
       public         heap    postgres    false            �            1259    27496    user_action_id_user_action_seq    SEQUENCE     �   CREATE SEQUENCE public.user_action_id_user_action_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.user_action_id_user_action_seq;
       public          postgres    false    205            �           0    0    user_action_id_user_action_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.user_action_id_user_action_seq OWNED BY public.user_action.id_user_action;
          public          postgres    false    204            �            1259    27474    users    TABLE     H  CREATE TABLE public.users (
    id_user integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    nickname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(25) NOT NULL,
    gender character varying(10) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    27472    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    201            �           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    200            �            1259    27698 	   view_post    TABLE     x   CREATE TABLE public.view_post (
    id_view_post integer NOT NULL,
    id_post integer NOT NULL,
    id_user integer
);
    DROP TABLE public.view_post;
       public         heap    postgres    false            �            1259    27696    view_post_id_post_seq    SEQUENCE     �   CREATE SEQUENCE public.view_post_id_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.view_post_id_post_seq;
       public          postgres    false    237            �           0    0    view_post_id_post_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.view_post_id_post_seq OWNED BY public.view_post.id_post;
          public          postgres    false    236            �            1259    27694    view_post_id_view_post_seq    SEQUENCE     �   CREATE SEQUENCE public.view_post_id_view_post_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.view_post_id_view_post_seq;
       public          postgres    false    237            �           0    0    view_post_id_view_post_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.view_post_id_view_post_seq OWNED BY public.view_post.id_view_post;
          public          postgres    false    235            �           2604    27515    blog id_blog    DEFAULT     l   ALTER TABLE ONLY public.blog ALTER COLUMN id_blog SET DEFAULT nextval('public.blog_id_blog_seq'::regclass);
 ;   ALTER TABLE public.blog ALTER COLUMN id_blog DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    27571    category id_category    DEFAULT     |   ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN id_category DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    27550    donation id_donation    DEFAULT     |   ALTER TABLE ONLY public.donation ALTER COLUMN id_donation SET DEFAULT nextval('public.donation_id_donation_seq'::regclass);
 C   ALTER TABLE public.donation ALTER COLUMN id_donation DROP DEFAULT;
       public          postgres    false    210    213    213            �           2604    27551    donation id_user    DEFAULT     t   ALTER TABLE ONLY public.donation ALTER COLUMN id_user SET DEFAULT nextval('public.donation_id_user_seq'::regclass);
 ?   ALTER TABLE public.donation ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    213    211    213            �           2604    27552    donation id_blog    DEFAULT     t   ALTER TABLE ONLY public.donation ALTER COLUMN id_blog SET DEFAULT nextval('public.donation_id_blog_seq'::regclass);
 ?   ALTER TABLE public.donation ALTER COLUMN id_blog DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    27487    logup id_logup    DEFAULT     p   ALTER TABLE ONLY public.logup ALTER COLUMN id_logup SET DEFAULT nextval('public.logup_id_logup_seq'::regclass);
 =   ALTER TABLE public.logup ALTER COLUMN id_logup DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    27585    post id_post    DEFAULT     l   ALTER TABLE ONLY public.post ALTER COLUMN id_post SET DEFAULT nextval('public.post_id_post_seq'::regclass);
 ;   ALTER TABLE public.post ALTER COLUMN id_post DROP DEFAULT;
       public          postgres    false    216    220    220            �           2604    27586    post id_blog    DEFAULT     l   ALTER TABLE ONLY public.post ALTER COLUMN id_blog SET DEFAULT nextval('public.post_id_blog_seq'::regclass);
 ;   ALTER TABLE public.post ALTER COLUMN id_blog DROP DEFAULT;
       public          postgres    false    220    217    220            �           2604    27587    post id_user    DEFAULT     l   ALTER TABLE ONLY public.post ALTER COLUMN id_user SET DEFAULT nextval('public.post_id_user_seq'::regclass);
 ;   ALTER TABLE public.post ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    220    218    220            �           2604    27589    post id_category    DEFAULT     t   ALTER TABLE ONLY public.post ALTER COLUMN id_category SET DEFAULT nextval('public.post_id_category_seq'::regclass);
 ?   ALTER TABLE public.post ALTER COLUMN id_category DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    27675    post_comment id_comment    DEFAULT     �   ALTER TABLE ONLY public.post_comment ALTER COLUMN id_comment SET DEFAULT nextval('public.post_comment_id_comment_seq'::regclass);
 F   ALTER TABLE public.post_comment ALTER COLUMN id_comment DROP DEFAULT;
       public          postgres    false    231    234    234            �           2604    27676    post_comment id_post    DEFAULT     |   ALTER TABLE ONLY public.post_comment ALTER COLUMN id_post SET DEFAULT nextval('public.post_comment_id_post_seq'::regclass);
 C   ALTER TABLE public.post_comment ALTER COLUMN id_post DROP DEFAULT;
       public          postgres    false    234    232    234            �           2604    27677    post_comment id_user    DEFAULT     |   ALTER TABLE ONLY public.post_comment ALTER COLUMN id_user SET DEFAULT nextval('public.post_comment_id_user_seq'::regclass);
 C   ALTER TABLE public.post_comment ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    27635 $   post_subcategory id_post_subcategory    DEFAULT     �   ALTER TABLE ONLY public.post_subcategory ALTER COLUMN id_post_subcategory SET DEFAULT nextval('public.post_subcategory_id_post_subcategory_seq'::regclass);
 S   ALTER TABLE public.post_subcategory ALTER COLUMN id_post_subcategory DROP DEFAULT;
       public          postgres    false    227    224    227            �           2604    27636    post_subcategory id_post    DEFAULT     �   ALTER TABLE ONLY public.post_subcategory ALTER COLUMN id_post SET DEFAULT nextval('public.post_subcategory_id_post_seq'::regclass);
 G   ALTER TABLE public.post_subcategory ALTER COLUMN id_post DROP DEFAULT;
       public          postgres    false    227    225    227            �           2604    27637    post_subcategory id_subcategory    DEFAULT     �   ALTER TABLE ONLY public.post_subcategory ALTER COLUMN id_subcategory SET DEFAULT nextval('public.post_subcategory_id_subcategory_seq'::regclass);
 N   ALTER TABLE public.post_subcategory ALTER COLUMN id_subcategory DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    27657    post_tag id_post_tag    DEFAULT     |   ALTER TABLE ONLY public.post_tag ALTER COLUMN id_post_tag SET DEFAULT nextval('public.post_tag_id_post_tag_seq'::regclass);
 C   ALTER TABLE public.post_tag ALTER COLUMN id_post_tag DROP DEFAULT;
       public          postgres    false    228    230    230            �           2604    27658    post_tag id_post    DEFAULT     t   ALTER TABLE ONLY public.post_tag ALTER COLUMN id_post SET DEFAULT nextval('public.post_tag_id_post_seq'::regclass);
 ?   ALTER TABLE public.post_tag ALTER COLUMN id_post DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    27617    subcategory id_subcategory    DEFAULT     �   ALTER TABLE ONLY public.subcategory ALTER COLUMN id_subcategory SET DEFAULT nextval('public.subcategory_id_subcategory_seq'::regclass);
 I   ALTER TABLE public.subcategory ALTER COLUMN id_subcategory DROP DEFAULT;
       public          postgres    false    223    221    223            �           2604    27618    subcategory id_category    DEFAULT     �   ALTER TABLE ONLY public.subcategory ALTER COLUMN id_category SET DEFAULT nextval('public.subcategory_id_category_seq'::regclass);
 F   ALTER TABLE public.subcategory ALTER COLUMN id_category DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    27527 &   subscription_blog id_subscription_blog    DEFAULT     �   ALTER TABLE ONLY public.subscription_blog ALTER COLUMN id_subscription_blog SET DEFAULT nextval('public.subscription_blog_id_subscription_blog_seq'::regclass);
 U   ALTER TABLE public.subscription_blog ALTER COLUMN id_subscription_blog DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    27501    user_action id_user_action    DEFAULT     �   ALTER TABLE ONLY public.user_action ALTER COLUMN id_user_action SET DEFAULT nextval('public.user_action_id_user_action_seq'::regclass);
 I   ALTER TABLE public.user_action ALTER COLUMN id_user_action DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    27477    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    201    200    201            �           2604    27701    view_post id_view_post    DEFAULT     �   ALTER TABLE ONLY public.view_post ALTER COLUMN id_view_post SET DEFAULT nextval('public.view_post_id_view_post_seq'::regclass);
 E   ALTER TABLE public.view_post ALTER COLUMN id_view_post DROP DEFAULT;
       public          postgres    false    235    237    237            �           2604    27702    view_post id_post    DEFAULT     v   ALTER TABLE ONLY public.view_post ALTER COLUMN id_post SET DEFAULT nextval('public.view_post_id_post_seq'::regclass);
 @   ALTER TABLE public.view_post ALTER COLUMN id_post DROP DEFAULT;
       public          postgres    false    236    237    237            [          0    27512    blog 
   TABLE DATA           a   COPY public.blog (id_blog, title, description, date_creation, icon_blog, cover_blog) FROM stdin;
    public          postgres    false    207   �       c          0    27568    category 
   TABLE DATA           9   COPY public.category (id_category, category) FROM stdin;
    public          postgres    false    215   �       a          0    27547    donation 
   TABLE DATA           h   COPY public.donation (id_donation, id_user, id_blog, amount, date_donation, payment_method) FROM stdin;
    public          postgres    false    213   {�       W          0    27484    logup 
   TABLE DATA           >   COPY public.logup (id_logup, id_user, date_logup) FROM stdin;
    public          postgres    false    203   &�       h          0    27582    post 
   TABLE DATA           v   COPY public.post (id_post, id_blog, id_user, title, description, date_creation, content_url, id_category) FROM stdin;
    public          postgres    false    220   ��       v          0    27672    post_comment 
   TABLE DATA           \   COPY public.post_comment (id_comment, id_post, id_user, comment, date_creation) FROM stdin;
    public          postgres    false    234   ��       o          0    27632    post_subcategory 
   TABLE DATA           X   COPY public.post_subcategory (id_post_subcategory, id_post, id_subcategory) FROM stdin;
    public          postgres    false    227   F�       r          0    27654    post_tag 
   TABLE DATA           =   COPY public.post_tag (id_post_tag, id_post, tag) FROM stdin;
    public          postgres    false    230   n�       k          0    27614    subcategory 
   TABLE DATA           O   COPY public.subcategory (id_subcategory, id_category, subcategory) FROM stdin;
    public          postgres    false    223   ��       ]          0    27524    subscription_blog 
   TABLE DATA           ~   COPY public.subscription_blog (id_subscription_blog, id_user, id_blog, user_level, account_status, date_creation) FROM stdin;
    public          postgres    false    209   ��       Y          0    27498    user_action 
   TABLE DATA           Z   COPY public.user_action (id_user_action, id_user, user_action, date_creation) FROM stdin;
    public          postgres    false    205   ��       U          0    27474    users 
   TABLE DATA           b   COPY public.users (id_user, first_name, last_name, nickname, email, password, gender) FROM stdin;
    public          postgres    false    201   ��       y          0    27698 	   view_post 
   TABLE DATA           C   COPY public.view_post (id_view_post, id_post, id_user) FROM stdin;
    public          postgres    false    237   ��       �           0    0    blog_id_blog_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.blog_id_blog_seq', 5, true);
          public          postgres    false    206            �           0    0    category_id_category_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.category_id_category_seq', 8, true);
          public          postgres    false    214            �           0    0    donation_id_blog_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.donation_id_blog_seq', 1, false);
          public          postgres    false    212            �           0    0    donation_id_donation_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.donation_id_donation_seq', 7, true);
          public          postgres    false    210            �           0    0    donation_id_user_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.donation_id_user_seq', 1, false);
          public          postgres    false    211            �           0    0    logup_id_logup_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.logup_id_logup_seq', 14, true);
          public          postgres    false    202            �           0    0    post_comment_id_comment_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.post_comment_id_comment_seq', 7, true);
          public          postgres    false    231            �           0    0    post_comment_id_post_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.post_comment_id_post_seq', 1, false);
          public          postgres    false    232            �           0    0    post_comment_id_user_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.post_comment_id_user_seq', 1, false);
          public          postgres    false    233            �           0    0    post_id_blog_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.post_id_blog_seq', 1, false);
          public          postgres    false    217            �           0    0    post_id_category_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.post_id_category_seq', 1, false);
          public          postgres    false    219            �           0    0    post_id_post_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.post_id_post_seq', 6, true);
          public          postgres    false    216            �           0    0    post_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.post_id_user_seq', 1, false);
          public          postgres    false    218            �           0    0    post_subcategory_id_post_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.post_subcategory_id_post_seq', 1, false);
          public          postgres    false    225            �           0    0 (   post_subcategory_id_post_subcategory_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.post_subcategory_id_post_subcategory_seq', 3, true);
          public          postgres    false    224            �           0    0 #   post_subcategory_id_subcategory_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.post_subcategory_id_subcategory_seq', 1, false);
          public          postgres    false    226            �           0    0    post_tag_id_post_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.post_tag_id_post_seq', 1, false);
          public          postgres    false    229            �           0    0    post_tag_id_post_tag_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.post_tag_id_post_tag_seq', 7, true);
          public          postgres    false    228            �           0    0    subcategory_id_category_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.subcategory_id_category_seq', 1, false);
          public          postgres    false    222            �           0    0    subcategory_id_subcategory_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.subcategory_id_subcategory_seq', 30, true);
          public          postgres    false    221            �           0    0 *   subscription_blog_id_subscription_blog_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.subscription_blog_id_subscription_blog_seq', 23, true);
          public          postgres    false    208            �           0    0    user_action_id_user_action_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.user_action_id_user_action_seq', 22, true);
          public          postgres    false    204            �           0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 15, true);
          public          postgres    false    200            �           0    0    view_post_id_post_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.view_post_id_post_seq', 1, false);
          public          postgres    false    236            �           0    0    view_post_id_view_post_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.view_post_id_view_post_seq', 40, true);
          public          postgres    false    235            �           2606    27521    blog blog_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (id_blog);
 8   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_pkey;
       public            postgres    false    207            �           2606    27573    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    27555    donation donation_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_pkey PRIMARY KEY (id_donation);
 @   ALTER TABLE ONLY public.donation DROP CONSTRAINT donation_pkey;
       public            postgres    false    213            �           2606    27490    logup logup_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.logup
    ADD CONSTRAINT logup_pkey PRIMARY KEY (id_logup);
 :   ALTER TABLE ONLY public.logup DROP CONSTRAINT logup_pkey;
       public            postgres    false    203            �           2606    27683    post_comment post_comment_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.post_comment
    ADD CONSTRAINT post_comment_pkey PRIMARY KEY (id_comment);
 H   ALTER TABLE ONLY public.post_comment DROP CONSTRAINT post_comment_pkey;
       public            postgres    false    234            �           2606    27594    post post_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id_post);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public            postgres    false    220            �           2606    27639 &   post_subcategory post_subcategory_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.post_subcategory
    ADD CONSTRAINT post_subcategory_pkey PRIMARY KEY (id_post_subcategory);
 P   ALTER TABLE ONLY public.post_subcategory DROP CONSTRAINT post_subcategory_pkey;
       public            postgres    false    227            �           2606    27660    post_tag post_tag_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.post_tag
    ADD CONSTRAINT post_tag_pkey PRIMARY KEY (id_post_tag);
 @   ALTER TABLE ONLY public.post_tag DROP CONSTRAINT post_tag_pkey;
       public            postgres    false    230            �           2606    27620    subcategory subcategory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (id_subcategory);
 F   ALTER TABLE ONLY public.subcategory DROP CONSTRAINT subcategory_pkey;
       public            postgres    false    223            �           2606    27530 (   subscription_blog subscription_blog_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.subscription_blog
    ADD CONSTRAINT subscription_blog_pkey PRIMARY KEY (id_subscription_blog);
 R   ALTER TABLE ONLY public.subscription_blog DROP CONSTRAINT subscription_blog_pkey;
       public            postgres    false    209            �           2606    27504    user_action user_action_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_action
    ADD CONSTRAINT user_action_pkey PRIMARY KEY (id_user_action);
 F   ALTER TABLE ONLY public.user_action DROP CONSTRAINT user_action_pkey;
       public            postgres    false    205            �           2606    27481    users users_nickname_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nickname_key UNIQUE (nickname);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_nickname_key;
       public            postgres    false    201            �           2606    27479    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            �           2606    27704    view_post view_post_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.view_post
    ADD CONSTRAINT view_post_pkey PRIMARY KEY (id_view_post);
 B   ALTER TABLE ONLY public.view_post DROP CONSTRAINT view_post_pkey;
       public            postgres    false    237            �           2606    27561    donation donation_id_blog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_id_blog_fkey FOREIGN KEY (id_blog) REFERENCES public.blog(id_blog) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.donation DROP CONSTRAINT donation_id_blog_fkey;
       public          postgres    false    2990    213    207            �           2606    27556    donation donation_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.donation
    ADD CONSTRAINT donation_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.donation DROP CONSTRAINT donation_id_user_fkey;
       public          postgres    false    201    213    2984            �           2606    27491    logup logup_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logup
    ADD CONSTRAINT logup_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.logup DROP CONSTRAINT logup_id_user_fkey;
       public          postgres    false    203    201    2984            �           2606    27684 &   post_comment post_comment_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comment
    ADD CONSTRAINT post_comment_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post(id_post) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.post_comment DROP CONSTRAINT post_comment_id_post_fkey;
       public          postgres    false    234    220    2998            �           2606    27689 &   post_comment post_comment_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_comment
    ADD CONSTRAINT post_comment_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.post_comment DROP CONSTRAINT post_comment_id_user_fkey;
       public          postgres    false    234    2984    201            �           2606    27595    post post_id_blog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_id_blog_fkey FOREIGN KEY (id_blog) REFERENCES public.blog(id_blog) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.post DROP CONSTRAINT post_id_blog_fkey;
       public          postgres    false    207    220    2990            �           2606    27600    post post_id_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id_category) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.post DROP CONSTRAINT post_id_category_fkey;
       public          postgres    false    2996    215    220            �           2606    27605    post post_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.post DROP CONSTRAINT post_id_user_fkey;
       public          postgres    false    2984    201    220            �           2606    27640 .   post_subcategory post_subcategory_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_subcategory
    ADD CONSTRAINT post_subcategory_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post(id_post) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.post_subcategory DROP CONSTRAINT post_subcategory_id_post_fkey;
       public          postgres    false    220    227    2998            �           2606    27645 5   post_subcategory post_subcategory_id_subcategory_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_subcategory
    ADD CONSTRAINT post_subcategory_id_subcategory_fkey FOREIGN KEY (id_subcategory) REFERENCES public.subcategory(id_subcategory) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.post_subcategory DROP CONSTRAINT post_subcategory_id_subcategory_fkey;
       public          postgres    false    227    223    3000            �           2606    27661    post_tag post_tag_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_tag
    ADD CONSTRAINT post_tag_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post(id_post) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.post_tag DROP CONSTRAINT post_tag_id_post_fkey;
       public          postgres    false    230    220    2998            �           2606    27621 (   subcategory subcategory_id_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.category(id_category) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.subcategory DROP CONSTRAINT subcategory_id_category_fkey;
       public          postgres    false    223    215    2996            �           2606    27531 0   subscription_blog subscription_blog_id_blog_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subscription_blog
    ADD CONSTRAINT subscription_blog_id_blog_fkey FOREIGN KEY (id_blog) REFERENCES public.blog(id_blog) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.subscription_blog DROP CONSTRAINT subscription_blog_id_blog_fkey;
       public          postgres    false    209    207    2990            �           2606    27536 0   subscription_blog subscription_blog_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subscription_blog
    ADD CONSTRAINT subscription_blog_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.subscription_blog DROP CONSTRAINT subscription_blog_id_user_fkey;
       public          postgres    false    2984    209    201            �           2606    27505 $   user_action user_action_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_action
    ADD CONSTRAINT user_action_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.user_action DROP CONSTRAINT user_action_id_user_fkey;
       public          postgres    false    2984    205    201            �           2606    27705     view_post view_post_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.view_post
    ADD CONSTRAINT view_post_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post(id_post) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.view_post DROP CONSTRAINT view_post_id_post_fkey;
       public          postgres    false    220    2998    237            �           2606    27710     view_post view_post_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.view_post
    ADD CONSTRAINT view_post_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.view_post DROP CONSTRAINT view_post_id_user_fkey;
       public          postgres    false    201    2984    237            [   �  x��S˒�0<��%� �@�������T��b���Hb��_��c�l�v�*���h�{��f�q����`�3F�4v��1`�ф�6�i7�o�֣&@[FC"��)�R)��m�ZYf�b]��1�)�y�u6�=�}�ݐӫ�ǐ7�:WB,�T[C�b
�&1�=�ƔLsD���З�����niķ��MՈ��4�+�<���CL�f}�@�݃�{d��'�^T�[!2Y	�G�����!#�ij���{e����v�s��&�gP$�=��m`ֺ�(T-/2!T���8���p�2�]g�{�ﱜt馮�á�D�;�u��P{�k���Q�Xq��ݵ�y�-���ϓuЅ��|������|�A���J�'Y��d�va�|q�x6��y�,~� �|�q�rL�,���̃h�[^e�䕪�{�*�8��Ȟ]t��Ž7{�y��{6�@T4N�P�c�@�R�	ժ��H�R�d��n�s0�v���5��Ɩ�_��j�
�p      c   _   x�˻
�0F�9���]���%� �j!��o��qJZ,\�;/*ZīK�#jZ�T"����Ҝ�:FG���$W�}�O��d���W��� ?��l      a   �   x�}�I
�@@�u�)r�5�Pgq�ED4H6�ވ�"���A���	�DFʣ� �!��X�ez.�5�������ja�͵5�uz\��t_KhwlՊ���h�hn]���p2��V:ΐ�`K��Kx&�����z�ϷT>z���6���Rz�CY      W      x�m��� E���Y ��mH�Y����*�u�l�PQݥ��M$�K
����`�u����eva��J*8��?~�nuU��í��@YB�*�K)�[!8}Χm.�+�2����`���~���8=      h   �   x���Mj�0�|��@dY��]�d�
e���R[2c��G��*7t�B�eÃ7�gD���#�t���B�qa#z���[b��`@8�9v�Ƶ��Zi�S�N�M����dS+�kq�q��<�Y��W7�u(��������S�P���-Yώ�?e�ׯ��B�9;��y�_"<"G����]Hj�6��\#]S�k}¤�o~���5Z�J�l#UYu��ɴ���/\YJ���vܓ̲��Q�r      v   |   x�uλ�0 ��n�,��}��%K��)FQ�c)J��g`�py�ϩ������:s�U&�*\�P��V�v����$^�*+���I&a�qf�){x$��Q۷vo���CiYRD�!�Q�*N      o      x�3�4�4��2�4Q1z\\\ '�      r   =   x�3�4�L���/�O�L�2�4A�r�r�f�&%��p�yY�����\�@M 	�=... ���      k   )  x�U��n�0D�ޯ�T�	!9�Ҩ�*���K/X!W�+c*��;&!UO��0ʨ{�D��+�~"��<4��>'c�5���S�)�3�b:�czrO[�*�8��^�˙���ʯ�5�I�h��*�.*0>�AZǴ�\�:`:2�0A6�D��7P{�9n���?����&(d�*SO����}�%�R{Y"wi��C�t+�'�u�Ck�� �:k �:kU�EO6�P~����-hM�y�5��@���z]�������8J�,{��/U���e8����c�6�,�*�t?��;"�9��      ]   �   x��R�n�@�u_��A���?�u����WF�> 'WR<�'�4_�wzy�\�.�\ΐ0ԘP+� R��Al���d8 g�be-��Db8bcH�@�UC�l���?l���!)�j��}]��6�����]����G3E�j��>nӶ�O���Y3�֏�d6�g�d>�$6�Q2I�e�A�7K��P��O�-uE��Ď��F���(�WA�Q�ソ`�B����S�C�h�      Y   �   x���M
�0����@Kf�۞E��EiD���E75���}������yY��ƞ��4Y��P���S�7��z����^�˼-�+�D�]3�o�L�K43�=���ۣ�"@�
T��A[qB���F�R�
�T��A%�t��=	�ۮ�U3����.O�ȸ����`��e���      U   �  x�uR�r�0}^�B_��$��iH�2�	O��,�j��B�6)|}W6&x&~Ѯt�g�)�5�Li��I�~K��[:��w�2��M��'Sx�FZe�(�������I)W����9�{e	�Y�}��5Z�IsI�r����豷�ΐH���p�Z�+�	�td�H�C�K���m-�B��l}�Cu�A8����-�S��AtD���]�|j�W��VʠX�,%Y?�I��R%O��1�n�ݶ�u����T�b+�r�r{�I�*e�'���.~��l�tr5����gO��)�GY6��y-�D� QE-��l�O�׷�[(Z�i�C,�7xF���<��3�Q��"�>���p���G&A� b~�̝��8Hr�
���$_�{���3vϳ4I>D㵱�t���X|����`<���g��d�J���;�8�)EZ�S�$�|���(���)��r.k���Ū�؝oV���ļތF��O�U�      y   Y   x�-̹�  �X�}@�����]�٪���Y�EY�b���bt�h��8�n�)��J\'.ܥu��@EC��ĉw�|�i�}��4�     