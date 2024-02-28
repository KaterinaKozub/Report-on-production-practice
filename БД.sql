PGDMP  #    *    	            |         
   flowershop    16.2    16.0     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399 
   flowershop    DATABASE     ~   CREATE DATABASE flowershop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE flowershop;
                postgres    false            �            1259    16407 	   customers    TABLE     �   CREATE TABLE public.customers (
    customerid integer NOT NULL,
    lastname character varying(100),
    firstname character varying(100),
    address character varying(255),
    phonenumber character varying(20),
    email character varying(100)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16400    flowers    TABLE     �   CREATE TABLE public.flowers (
    productid integer NOT NULL,
    name character varying(255),
    description text,
    price numeric(10,2),
    quantityinstock integer,
    category character varying(100),
    discount double precision
);
    DROP TABLE public.flowers;
       public         heap    postgres    false                       0    0    TABLE flowers    ACL     /   GRANT SELECT ON TABLE public.flowers TO user1;
          public          postgres    false    215            �            1259    16414    orders    TABLE     �   CREATE TABLE public.orders (
    orderid integer NOT NULL,
    customerid integer,
    orderdate date,
    totalprice numeric(10,2),
    status character varying(50)
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16431    payments    TABLE     �   CREATE TABLE public.payments (
    paymentid integer NOT NULL,
    orderid integer,
    amount numeric(10,2),
    paymentdate date,
    paymentmethod character varying(50)
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    16446 	   shipments    TABLE     �   CREATE TABLE public.shipments (
    shipmentid integer NOT NULL,
    productid integer,
    shipmentdate date,
    quantityshipped integer,
    priceperunit numeric(10,2)
);
    DROP TABLE public.shipments;
       public         heap    postgres    false            �            1259    16424 	   suppliers    TABLE       CREATE TABLE public.suppliers (
    supplierid integer NOT NULL,
    companyname character varying(100),
    contactperson character varying(100),
    address character varying(255),
    phonenumber character varying(20),
    email character varying(100)
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false                      0    16407 	   customers 
   TABLE DATA           a   COPY public.customers (customerid, lastname, firstname, address, phonenumber, email) FROM stdin;
    public          postgres    false    216                     0    16400    flowers 
   TABLE DATA           k   COPY public.flowers (productid, name, description, price, quantityinstock, category, discount) FROM stdin;
    public          postgres    false    215   ~                  0    16414    orders 
   TABLE DATA           T   COPY public.orders (orderid, customerid, orderdate, totalprice, status) FROM stdin;
    public          postgres    false    217   �!                 0    16431    payments 
   TABLE DATA           Z   COPY public.payments (paymentid, orderid, amount, paymentdate, paymentmethod) FROM stdin;
    public          postgres    false    219   "                 0    16446 	   shipments 
   TABLE DATA           g   COPY public.shipments (shipmentid, productid, shipmentdate, quantityshipped, priceperunit) FROM stdin;
    public          postgres    false    220   #                 0    16424 	   suppliers 
   TABLE DATA           h   COPY public.suppliers (supplierid, companyname, contactperson, address, phonenumber, email) FROM stdin;
    public          postgres    false    218   �#       g           2606    16413    customers customers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    216            d           2606    16406    flowers flowers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.flowers
    ADD CONSTRAINT flowers_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.flowers DROP CONSTRAINT flowers_pkey;
       public            postgres    false    215            i           2606    16418    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    217            m           2606    16435    payments payments_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    219            o           2606    16450    shipments shipments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (shipmentid);
 B   ALTER TABLE ONLY public.shipments DROP CONSTRAINT shipments_pkey;
       public            postgres    false    220            k           2606    16430    suppliers suppliers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    218            e           1259    16456    idx_name    INDEX     <   CREATE INDEX idx_name ON public.flowers USING btree (name);
    DROP INDEX public.idx_name;
       public            postgres    false    215            p           2606    16419    orders orders_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customerid_fkey;
       public          postgres    false    217    4711    216            q           2606    16436    payments payments_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);
 H   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_orderid_fkey;
       public          postgres    false    219    4713    217            r           2606    16451 "   shipments shipments_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_productid_fkey FOREIGN KEY (productid) REFERENCES public.flowers(productid);
 L   ALTER TABLE ONLY public.shipments DROP CONSTRAINT shipments_productid_fkey;
       public          postgres    false    215    220    4708               N  x�u��N1�ם��	&�o;;��(��@@�q��MLLа0*��p9	8���y:,�noۯ�=u��\�i�L�1�],�B&0eiW��_<7EV�b/R2|�u�Y������O�q-��u�a�%z�k�.f�u��1�o��c�o̓'"\*�� T�ӎۧ�~rכiRн�/=�=$%��٧��_�PF�$���y������<qrJӸ4�D�u��=����գh�\QM�Z)�@���_�~x�Nߐ�-���N ������_D@����8N�I��J��&ّ�$p�lM5�:��93݌c�nh>��R�PtҸZ�ؖe�/{t         `  x���QN�PE�a���h�	W��T�iM��1���PQ�B�pgG���� y�3�sg�;���;��1rH$B�OG�Z.t�ky./x@!+�/d��5;���V6|��9A&l`^��	�Ma�쑘w���5���22|�ÜP�oć&;��d���,��'33��-#s�b��,�ȴE�Xu_B�ۢ���S*����4��_���3l�91RoZ#wt��G�,���9�F�[�u��ky��5gZ注��8����ȡ�\_Xs�jX�p�F}�d�Z��X�6�Z~� kF�4�j�I��mؠ�2���r�<���iG�T�,�$k��m��]3�l���y��         �   x�}ͻ�P���x
Hd�G���0�P�a@�B��7B�	����7��Ti��`YkUp�q�ٻ�|���s
S��#O�p��{N�s��X.�>���k��p[qB*qҍ|F.��f�A��"���kyI�i         �   x�����@Ek{
 ���6���((��%
!��QL��RZz�}+)%�DHEc+�!�6��V��Q�Pl�pO}-�3������˞Z�F��n#G�n���GN��K�(��T�PZG/3ui�         �   x�M��� г٥�(����(�/�'?,B
��A=D�D��,u�3|s�}s%�������%t�/��	�Ӹp%��(���cA\a�}��x~j�M��M
��SP�U!krT���XJ�K��EG,��ϣk˿��r�K>�         �  x�e��n�@�����,�1p����VV����w���\TJ�&���+�(���+̾QϬK�ۋ�vv��ΎG������\qi뉾�5�ğ���>��?���~�#���7��*�3�S���q7���b8�y�dX�^�~���O��7����%���qX�)�o�b�wz���1�c[��@IyQ��(�WY>Jғ�Q:���GA�-�;��z��(����Ҹ(�v+�_af&��dO�R��SX\���K.������ǣtx��lt�ߤl����ec��D&�IZ��JD-��~�+���>����<��,&N�H�O��I�������Z-MpJ�;j�q/���ּ����n�^d��ꆒ}��/�Q^��{+t�3�=t�ƣ��H�'io3s��|f� #��*��#i�X&��AD��StY�˄� 4�}���1��b�[}v�!�{F<v�p�d�6�{��˲~U�ڤ     