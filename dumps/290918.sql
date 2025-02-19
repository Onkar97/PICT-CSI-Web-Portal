-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pictcsi
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT` (
  `event_id` int(5) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `max_seats` int(5) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `image` longblob NOT NULL,
  `end_date` date DEFAULT NULL,
  `event_fee` varchar(10) NOT NULL,
  `attendees` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1020 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT`
--

LOCK TABLES `EVENT` WRITE;
/*!40000 ALTER TABLE `EVENT` DISABLE KEYS */;
INSERT INTO `EVENT` (`event_id`, `event_name`, `start_date`, `max_seats`, `description`, `image`, `end_date`, `event_fee`, `attendees`) VALUES (1001,'Enthusia','2018-08-29',100,'','',NULL,'0',NULL),(1002,'Blockchain Workshop','2018-08-29',200,'','',NULL,'0',NULL),(1003,'C Session','2018-08-29',50,'','',NULL,'0',NULL),(1004,'Android Workshop','2018-08-29',150,'','',NULL,'0',NULL),(1005,'Python Workshop','2018-08-29',180,'','',NULL,'0',NULL),(1006,'Onkar','2018-09-15',15,'','',NULL,'0',NULL),(1007,'Webicon','2018-09-21',150,'','',NULL,'0',NULL),(1008,'Webicon','2018-09-17',150,'','',NULL,'0',NULL),(1009,'Block chain','2018-09-18',150,'','',NULL,'0',NULL),(1010,'Clash of Code','2018-09-18',150,'based on C,C++,java','',NULL,'0',NULL),(1011,'Blind Coding','2018-09-18',100,'Based on C','',NULL,'0',NULL),(1012,'Googler','2018-09-18',100,'Google Search','',NULL,'0',NULL),(1013,'Googler','2018-09-18',100,'Google Search','',NULL,'0',NULL),(1014,'Webicon','2018-09-22',155,'Web designing','',NULL,'0',NULL),(1015,'Blind Coding','2018-09-21',120,'Based on C','',NULL,'0',NULL),(1016,'Block chain','2018-09-23',200,'Based on bitcoin','',NULL,'0',NULL),(1017,'Webicon','2018-09-20',200,'Web designing','',NULL,'0',NULL),(1018,'Blind Coding','2018-09-21',150,'Based on bitcoin',_binary '����\0JFIF\0\0\0\0\0\0��\0�\0	 \Z \Z ( \Z\Z%!1!%)+/..383-7(-.+\n\n\n\r\Z\Z-% %---------------------------+---------------------.��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0J\0\0\0\0!1AQ\"q2a����3BR���#br���$Ss����CT45�������\0\Z\0\0\0\0\0\0\0\0\0\0��\0(\0\0\0\0\0\0\0\0!1Aa�Q��2R��\0\0\0?\0���ŒXH�;�@��5���|+���&5��i&|��xzu�4�]��g.Ȝ@�#�Ҿ]\\Z��j���\n�M�� 	\'XT+ݪ�f?�Z�\0[{f#��տ.�7&���>]\\-;[��8��}T���G�p�k�!��6���|��lwϗP�uy�v��6q,�����O�T�o�������5���u*�$���^c=��_�������p��q��ط*N�-�\"D�A����{hyF�=��n?�~ �\0LS��1���OU�6�\0HKc�c��`�\0,{��O2=/����7OA�:a{w�=ߔ��f�);\Z���@hq,H��O�D�����Le�~U�����¸-��c��\\���]�w�J���{�1N[��NJ�/�ԟm[�RnJ��?xR���{k�`�i��g�]D$�K�}�R?[����Cy��M�äS˧���7A�����\n��`���F\0	�rZ���:���+���\0��Y�ljj��|�t�m�q���\\����s{����ob�U0�u��P�urO�O��ؿ��O��ؿ�^�.���.�G����\08���`��}��S��uߗP�ur/�O��ؿ��W��ؿ�:S��~]C�ȿXq_�b�T�5�i��A\'E��t�S�a���uԺ�=��.\\���m�\r�v�V�X��F����uS��ԟYֽ����\rp���?\Z�������&3�4�	Y\"	rH�s�=T�#i�:��5�ϗ�B��X\"�$3wA�Hw:ֵj�gF��� \'�?\Zcu\0�\"��ګ���;��\"ƞ/�j����$��:�	�*]GKIǮw���a7��ި1�H`6;O���g\r˔0I ��y�ސ�t�-��T^T����/4�m�(;�t�o.c�Q�ඦ���0C@h3�:�Lr��TO����R*n�,�U�&FW1�c>ʘ��Whp�m�PB��t�5���OQ:�Q��53m��CG�����kG��D���aǬ.��)��-��\n�*�]eH ����e���Ñ���5c� �v�������-H����I�a�t-�ȿ�zE�r��{b4�lA7GS��?*Z�p�x�W���8�\r$�=u)�y��|$~t��C�#� �{���������9�E�~�%r��{搧q6C;�ت�2�G�#­�V,�N���+�����}~��QG����W|�ƺ6\rTʺ�����5L�ѫ����D��당1EK���R�����(�QQB(�v-feQ�0Q=I�ƨ�������5�Sj�vo�K\\Gϧrt)�3Ͻ[Tڹ���w�6�5�e��n�#� H^��{X�9�m�~����9�2����Ѥ�F�t�;��ocm�m.iu�Y��l:Ե�a�!���D���S��Mf,ܛ�I0_rH:�4X�9�N����53��⽠�\"�d�A&&4�	�\Z��u��&�<�M6�{M2a}�qE�[%J�W�\Z��]9MH�oC��\n��;̮�w�Ƃ����Fl���u�yÆ�y2�v,�9�tզ`�\'�U���L����Ԟ�9�p�W)fp���K�2��\Z�u����	��Yq��nlv�T�\r��v���j�����C��&D��u�]��&5�� �X\'�(���J�a�H�~�-h=[��Eb�Ӧ�W���V00w��p�>�M��5Nh:\r$M���Vx7�A�r�\0!����qO��y}�ꃍV̮��Y��;��|�Ղ�.���������3�S�&����ZdŧC)�P|3i�R�j_���]*:ś�ǩ�O�ԣ�?I�Ѡ֬��{��rŖ�	�}t�^^��5sY����B	*z0:�����E��~�~Dj=W-S�5e&�e��4t(B�h���;����*=H��Mk�D�aDu���ӺK9�����j�U]�3�.^�u���Z�M��j�9�m�~�,6$��\'Q½{�>��¼�$,�$DǷ�P�\\9X�C�0�]&ږs0oTzy�.m�+A�d�t�<dfo�5s�!u7ur�Y�y�����I�:�)��?ߪ�}�~���\n{����ܕ��?TTn��RO�����I��Z�ԉ4�\0s�m��\Ztp��;��yD��a��x��u�&\Z�\'n_�U���&F�}�V|I���J���6�dH\r���yT��V�j�����*��e�p�	,��;�<7�ӗ0��>�?�-@��o�U�SL�>�h�F�*�8�p��F��z�����X\"#]N��a�WwR$I���ұ]&0v���N�L}���u��H#�Tkwۙ��c��*B��*}�=H��@�U*=��G\nk�\ZA�����m̸��x���������uD���9] ��uOPG�\Z�Q�?�=�\Z3t�qqD��Q������t�7C�cFb��Zd���ӯ�zD�\0~{�{U嫁�e �$�t��<+�9S�E��l`��\'�H�W���;ˑQR���**:	��þ������F �d�lh;\r�α�v����O*�M���3�^�u���|�e��fv��j�J�9�m�~��nr�I���ǫ�{�}x�x��©�:O�^��&9����\\�3Lc��G�cC��\r�$����ziX��4�l�coLS��2a���}=i\'�u��cY��#�)�T���\n����j�J���#+r!u�WP�c�߱�W�aa��8��t�n�9d��2�X�����kW�3��p��w0k�\0�HӼ+U�πa��Ʋ�,%�2ڢ*��-�2L�v�-��x��a���\"۰Lֆ�$����g�W�{�Vl��v-�.�������?\n��|:��sr�����\n���t�Mk�q���n[V{;r��f�q���e	�\0�7��a�yM��.#,\\P�]	:f)�oEZ�ۋ��K��_��U)ԑ ���謗g8��m_���0��#�Iظ�t.�vZū7��r�ڴ]A#�+�4���:F����Vp�qzն�]�*]\n�H0�Z�?{�Mv�������,�.��yI��5�]���kA���H�.��(:�7�MN{��e�m��--ܘ2a�B�U@�6]D9���+��UL�)w\"\rߐ\0��	\Z}c�a�K��b\r�E���g#*��%@]��O=���\0j8}�Rbg�-���)\0�&f\\μ�Eb��-*	�/��>h�n�H�5�l���\'��9Fu@��P,0+�LiVG����*U\r�(TA�BO�O�kI���\rlZ�M�E�B���Q%�fcI�D�jE�\n���\\b[�j�ĸ<��U=�D9I;ny�\"y�w�[��/�*ŋw��VDlı�@��z��M+�m�b-b�.#߹,��9�.P[�k\Z�Ρ`1|>�%�ڹz��@\Z�G��A\"=:{\\�,x�\0�?+Ò���*�*�lߴX��,�>kw��ÝYc�>��n6�u�ʖ��3v��՜nj`�����n�͑y�ټ.�˰���Q�x�\0Q1]��o�7m=�)�����m��uXA:�2:S�����<�\n���ob�2\\���	2��1�\"	#�_�ǁ�6���l�vDP��4���O��+/�{Uap���/,�T�/9hVH��1��H\Z����ة�1X|�RϓuaԸ,��D:Uũ��}�Kw�h�\r�HP��ӝf\rYv��1X�6�����.fĨ�u�}:����f����i5@�4tT\Z���-qg\\�c�KA�et�ڹ����#�ڲ=���k�&՛�b��}x�y	�T ��$����D�^��F��^=�z����3\\VbX�>����$M�=�3���&��ͨX��e���;�\Z�;�2�\"�:\r��#�3\r}�i�BF�����70}��$y0##�:rϢP��1�T����9�&\'~�.�L�9\'�`�*�z\"΄sͶ�Qp�!��S�\Z���cƤqk������ ��)ۨ���!+qA\Z���DV�%勜p}09��bڂ�r��,L�i����xW��o\r�{�/����u�-f�r�\Zi1y�z�){8ǓI����� Vߎp�Ů�.�(��U�i���-3\0yhն[��8����LF\"���70Xt���A|�9D@Bs1���pnĭ]��\r�6\"ږ�.�\0;�RH�F``�+���k�[a��-��K1W2��fU!�N�����nb-�y��Ҩ\0�a���	:l`S�ɞ���-n��=�a�\'�-ۀ�M������9Ӽ3�8V)�������#^�Sx��8n�n�ݳ���p�+@��Uy�{C�lO{WP[G�\\N_$��a˼b:ӕ�ʫ��ph�ep��d�����O�!���d\r һO�0�f���X��mr���ܟ7R`�w��������oyL2c�[X+m�Ql�	�29֧�x��yW�����p�\r����G��N#�����p��^I��h\'4�t��>�a���5�w/����X���\nu#9��U�v��޵gʯ��d��~��ߔ�����g\0�[�����m��ט��ӘB���`ϦiɈ��������.�	mtwe`IbX�AQ�We�_����ŕd ���>�P@\Zr ���q�����le��큖��3C�����i�	ڋM����F!,�n�V�\'�L�\\�\'\n���X,=���n�R�-��T����ԃCG�{?�����n�Y���Z��L	Rܣ��g��{Mw0׭�G�$ߘ\"F�I�CO�L^���.6@�\Z���f+�]Bg��W)�_��|.\Z�K,E��H7.)�)��i˶�U9\Z�:^�ֳ�nYKz�W�����ec;��\0�\0ubB$&�Mͽ5#��9V�gT���\"4������53�9.�p�y���F��|w� �e �r���$��F��Ւ�-ҿ�4�Dk��4(誋Oч�\00���밦��?FC�~3�;?����f�i]�>��\ry?�`������\0�	�t���Xqϣo��u$�&���ahw\0*���-�����\Z	��I|B�fPI!�dhI��n\Z��`_d��_FԬ|���N�e;�q/��\0h�byI�L����l�;��DF�ۦ��3�Y��Լ0,C(��o1$�ޭ��(��aUA�ZTl$��0\'0\0맪z�w�a��6ʱ$	�E�J_�5���[��Ǻ�d�k�&�2����U|��&�!	κ$��mW�ʥ��qx���9H�Q�&⢪�\\ν�d�\r�-�H�bH�i]f=�m���v���������H�M��nG#��J�w�]�l��*��r6��q���[v�������VeΤ`��%s-�����c�]e�p�4�U�WB5�$k֤�j�1��vڲ�]$�t*���L(`�M��J��K����>X]Ô0�>U3�&�$��-�-�h�@4���1u�������M�W\Z˲�x�4-��ɒ�g��b�VE���8[q^X�u`y0�Vm`7/��*���˃��\0|�PC\ne\Z���z�t�w��L6�Rt,F�t��n��e���TR�*�R���}y��`R�*���$Ȅ�\'u�kf$L������78 ��I�Lɬ������t\"�q>#�Y.�2)n\0<و��Џ\Zq{Mz�*�A*�\n a�A��X�%A�PJ�p��U���J�7��6��*�\0�2���#�;��\'F#�#�F)�w�p�g�I0U7��F��}�U;�㷀�a��x�<�����:�ʜ�\"[�!��Q��`�X�2HJ��\\Ӧ���y�X[�52����Df H\'Z��gs������!y�m=:T,w�s-�pyF\nd�C%·wU\r�U�8\'a�[�!��c60bi�����������k���t��<��DEd��#�4��D&�RZޫ�T���jwʫ�e;o�#pG*�� �~���*&/9�eX.�� �G?\Z�\Z3EFh����*����^1��_7-��޶_7�WbM��~�������i�K�b��}x�yG�ͤN�2��` �����^��F��^@8�!d��xVl��R��rU����O_���d&����u\n\"�-�,<E;�9��K����MZ���ݽ9Lk4���ʼ�$�q�����eñǇ�֞�������Φ4���{�ƌ�\'(*���=�,e�T��*�Gt	\0���E�03j�L�� i\0�L�j�g��50���IW?*Uk�\\U�����e�g�QF%�����(�w\Z��\'�cr\0J���ƣ��v>�F�,���M\'��!ߣ���0=�v}|�UGh�r��>+���ZYմ�߀�c)np���\0\0�Pd\0�ӱ�għly;Z��&��%��R\0>�����d�_��Q�D�{|����)b���ǰ����w�m4q��[z�\'�!��`�\r|j��2�\rwW��J\r�Q\Z��\0�TX��6t�[L��4���Lc�*ȶ��PJ)ф��|���c���~E�$e����;�\0~�X㯝mܷi\\�A\r���8�:�;�a��\0n�#�\0�7�0��U��O�1��TL�e���Ie��a�^uE��Ձ�7��G��M*wP����K��W�A��#PFU�[\'*��/����e�H �\0�\Z2v?ب����7���\"C��{*ȀX��A��`l��?;�@#r>��:�M� 石�\Zd��3y#�[gnGC���|�\\�2/��\'Q�}�\\�\Z\n*��\\�B�\n?B�1>������WgM��~�t��e�����]�6�{�]�>��¼��p-[n�x��Q�׮��ѷ��W�-�����X`r�څ`	�ٿvf��M�d34f%A�t�\n� �N3���}$��Ժr��b8��B�w���y#�Rpr�F�x��:�}�B�δ�N��:h`�s��uN��K��TĶXY=yr���Ü� �$hd�v�Ub��e\0�\0\r����Ao,�f����\"Ϗ��t�+b�m�e�\Zh2��5\'z�GgHԉI m��b�f���1����G?�ыه�VFRg(/��՚R�\\�UH,d�˶�M�U��P\\j\0ns�W�?\Z��K��rUN�\Z�u��j�î\\��Iܛ�N�9���V�Z��O��I��8�^J�Z1�jsbYQC�u\0�4�\0y��k;�ܹVy\0�D�a�;w�5��2AX=Gv���e�	F�Í�;�|QF6�ϔ��fS�י\Z�\0��wO��.:S&\n�?y$A����Ӹ���b��g��ߞ���6κW>[�@���h���e)�nm�ZA�Om&��6���on��w�\\�[���`�]͓���4�\'OY�QX�~���\"H<�r����\0�F�i^��G��<F�Xw�h`|N�i�o2}\Z���QM����9�\'+F��Ұ��l���� �r>�d��O>4��Zki[0q�t��N�X#H�y�w�:w}\\�\0�j�����>��qIm�uP@1I���$�B��+-�GD�(PO����G�k�&�ǿD��V3�O��aM�UWqϣo�&�½��>��¼x�/�@$����&�q}\Zr�5>�:�g�$�r�������A�4�9QyM����Y�!����fL����)�b	�`hLy���_Q��Zq����rLw�@ �\0��f�[7�)X3Н���j���|��;�1+q�\rϗ��\'	�� �D�QC�*��ST��/\rpH�r���SjN�d��� ��n\r��O����f9��+�����;�*0÷�S�ѥ�\"�~�������̄OH�-*��Y�[�2�rR3�����Y�j\Z�`���{⯻ �p�T�\r2471�̋���J��N��qR��D�4�d��Wm�T\\)#C�}z�Q��k�`P�ճ.X$�%���\Z��ō���U�\"�ƺ6�\0ļ��\0*��4�V#]`t�:U��V�l�w�3΁V����M\r#((���JA�y��jh,&�g:n4z9���w�uG{h�\0{��ꓘ�YT�1릔��{�\0��&oa��G�k����\r�M����������y�?}t���<��s\r>���~tX?�O�OS8�O�O����?�O�_����V�\0�|)��C�Ǝ����W ��x��Ox5��j���F��^BQnV۽��-u�½{����\ry�{%b~��O��>^�z=�7�N��u���ɂc���i[s�;j��E\'�F�ۻ���+��o�}������Ŵ����ꍏ�w�\'�Q��X�W~��+Wӷ�>�Q���b�\Z�Ҷ��V>���̺��ꍏ�w�/��ӷ�>�Q���dLt�o0����_�V>�߼��I^�X�w~�EON���=Kc��a��Q1\Z�;�c��N� 滧�/�Q���W~�E_O���OQ���c�����Eor<kc��c�]����읁������z~��������$s<�Ҵ�q�`I9X��e:Չ읏�w�\'�Q�\\:��%�HUD�ɺ�����t�W��Z<~έSL�o�x��]|��t>x�u��/��o��֓����o0vE�\n]7W��@9t�s�h8�`0�a�>\"@��fHa [ 	QҼOk���P@ ��:��؞�UXVc���1:�íu;]��^Q�u� ��l�F�V��B=F�X���U-�.��w�$���VL��g_Gh+w��l�3��^^��&�ud%�q\"KLi�i�Eh���ܼ��!D�!H#HeϺ���#qm���1:�g1$��jie���mb�)V\r�m��Z�~�M#W��ze����l%��\"��;��A����M�1n�P�-9�=�|N�\0�[�Ě�jq\r\rp	�@�F���Β.��J�(t�;�C�Ϳh/$&��O)��M��dM\rc����M�\0��?�|)����M�P�[� J�/�R�\0[q-}���#Y��<��`���*�XQ�{�rŸ�<֝����b:Z���tWJ�7��h�\0H�s�`M��~��Mw��љ��1���d���T�k��¸j5w^.��z+�^���1*|\'��;{F�W]�o���\0���n]=8����Oʅ��H*v�Iͧ���M�;�>M�|㕻�ƺi��W�:��A@T`��\r���1�L���2��l���]J�b�-����M{/�ў��U��0������\0����y�i��&���o\'P24�11��j,]�*d�hFP�f�̊��haNW:�k�Zz�+@�l䰗�o QnfJ���<ș֧�i�x��jǿ�)k	q��3Ce X7L�_u%,9\0�$( I.\0%cy�=��Q�yB��X��e$��������6��.>�#ˮWQ��w;G�\'���Vt�|��r��1�m�E�u<�n4�&3�����:֤c1y�e��dnFP��h\\��y�F��H�팂[�d��\"�v�9D������_��>�2�ee=`��ү��>�Ё�s(#4�$f�:h\\�D�����WY�6qΨ��og�5]B�O��������W�6?�?�j������3��Nu�|U��w}���;;y�*�\r�H���r����nީ5{_��g�oM�6����I�l��g�.�-���	�r�2��)j�\0���$Z�Z���(T���~�13��w�۴��[�b3W�ɝ\05��;)}����\'Q�$}Y�O���6����zВ3�\\�e`�F�h}z�)o�E���z����^q�ڟ����\\���:��]G\"dx�ԬF5ֹ����yf���\0�֭��$�U�5�-�D����v�s> ɕr#�\'�I�F�\r�]O��˗��hߔF�5S��d8rF]h��\Z{�MW��f2��[&�%���m�U��:�d\r\'�J�q���Ic������]2�f;�3>��w���F�T��b�;9kr�O���@�U�&�8b�V���b~ݿ�M�y��v�\0��5�������᯾���\\H��l��#��_o������\"tkc�~U�\'�gM��chV���b~ݿ�M�<�������M���_�k�r��m\\��S�;�;���+y@��2��>�u���t���5O*(�Rt��Rt�B�|ԝ(|ԝ(P�5\'J5\'J(�I҇�I҅\n�Rt��Rt�B�|ԝ(|ԝ(P�5\'J5\'J(�I҇�I҅\n�Rt��Rt�B�|ԝ(|ԝ(P�5\'J5\'J(�I҇�I҅\n�Rt��Rt�B�|ԝ(|֝(P�~�.�&�\n��','2018-09-22','200',NULL),(1019,'Googler','2018-09-20',150,'Google Search',_binary '����\0JFIF\0\0\0\0\0\0��\0�\0	 \Z\Z\Z    \Z (  %  \"1!%)+...383-7(-.+\n\n\n\r2& %--05---+----------//+--------/-----5-------------/��\0\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0I\0\0\0\0\0!1A\"Qa2q��B���#Rbr����3��C���$&4S��%cs���\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0��\01\0\0\0\0\0\0\0!1AQaq�\"2�����#3B����\0\0\0?\09�m\'�g��(2�����/!J6¶S�.-�\\|���x�(��IҖhu�f;*���lyƑ��h���)�����HMd�(>�j��5�.c�8�	�\\�w���^a��⎐�4UX�&X�6�F-�r��5�2������Aڰ7��v`��#��\'`����8��7���]��i���TJj=�W�]4GUUf��R�Q�/�E�A(G�$��,}I8�6✕>�4�ؘ0�˸�\0��G7�����.@�\Z�2�iX���\0��1�b\0��m\\����,W�_\r)�P��6$\r�׎f�l\0!.�[��>_�_\0N���҂M4<�\\R�ڈ�u$��iY� ��$t?,J�=&�R���Z��!���m;4�6NEP�����_�OBF��9���IOR��Rv�G `\n�A�A�~8��c\'!�@��i������9\ZƟ���A����_�6<�\0t�o��\Z��E+p��9�@�cf�\0\0��O ,ߘ�K���O4� u6\r�t$[s�N�XXXX\0XXXX\0XXXX\0����$[�ݡV祮Z#μ�9�8\r��mFP>����rM@�̍ŊS��c�3��L�ITѣ�3�X�\r ;y���+�3 �D��)#\ZT3�Ү�rl��B���p��$x��K)\"8���� �7;^2���0ɲYs��P�B�cb<J#����o.�#F��ԫB(������,�V>rp��bǟu��}ۆ�`U���hc�� u9I���x��j$١˦�}���9y2i��ŗl�JN�`�j �#��j��������Ff��~/3�q�\Z��s�\0OBZ)A�\0��O�G�(�f\'�,r��L#�R��6�wc������݄�������)u��t)F�-&��	�F��c��	�e��6\\�9�|�S8v[(P��7�<�Ꝕ�Gj3��l��+�5���\0>W���f3�\0����,MH�	�KQ�\Z�����g��x��	cY9�5(?�0x��\0��.X����?vWk�Ɵ،ƾ�k��������t�,�Uټ�}�A�ؕH���~ɱ��N&_2�IeRTj�JҲr O��h���@����;W34��k�y٫+u��\Z�Qي���M\\#�1�!\'dO�ԊG�u�Ϳ�G�=&?lI���e\n\r�5�+�c~����\n���\Z3���+l@�)�0~�\\7�xz��\\�+tV�X�;�o</p�\nO~�_��s��Y���I-��rގE*�F�����$\Z&��DV�n����p����<�偶+�kp�T+���x��픹���s3X�0\'r�\r-M��R<7vqL\'��n׿�O:�u%L��D[��p����;�遆���R��F�����w��\'N��㐃Z��ǉ�a<�|�(�/��ù|������bS��-�W�u����*� ����-0��:����<�.�?���ǸXX�qab�@�h����o�g|x�Z��YQ�@Y��J,�7t:\r�7������Ď�4$�-u�-\"1�\00lk������˾��V锂:��qȌvw����L�G<sd�:uº�e�Q:u���\0��p�3�\Z�,\rV�#r���|;�G6c��,#���*<^^\0���){p�Is	�r�Ѵ�4�!�Mg�:���ӕY��X��R)r��G\'S?\n�}(��D��e�6�Qv&H�ɯ�3�e���6��G{���b�3�e��O=O1���Ա#1$�Z$V�}��jn\r�������ED4B�����Ħ�vn}s;M�ZBıd}�߲�}°���\"3�E��>I#���!�#BI,F�����{�ƅٮ\n�.^R�%���.@=kU_�)~��Dࣻ����O@�ro�X�c|L���c�$���A{���f��\n�S����u��U��y�����p]��s{�5�;���ψ�V���.�bbXy��\n0�iu�$	z��d޹#�}ޕ��K�x�Q@)4�0#�UPU�	-�!��~B�\0_�k`���~����)�o���9aYa����gAd�U\Zt�m�P�¸U�Y$��h�.�i:�bP\'k6]��E��B�,��[h���UU����3�.]#��Q!<�5m�Nr2�4e_èx�����\"М��2]�̭�w,ĴR՞|�\0�!g�H)b��|ԏ!����<E,\"��b\r���|�0�L�VIJo޾���(�\ZN7��~�R�ܩc�\0�aɪ�w���f[F���w�ڭ��>H�P�=�R}cr>>�,L��;jT<��{�@��#3X!͖-4��q�G��N�L�ځ�f~�ub^|��U�������e���e���K�`�5$�@��]O�\Z�5͘��g�j%dY�e���j�o�H�U�y��^%�K��j��(��?U��[q�]7����gc2G\ZE8�h�u+fǴ�﫯Z61$WЏiL9����e@�e��B�ߣ}�����31��}�x�p��5��-��G��\'���xN\n�3�Q��Y�k�k#ɞ*a�rpe�\"����ۂ��X��5�D���,�����̫(�c�����I+i��K�0�2{��2~��/������\Z���e� s�\'�a���W#�r����u���ޘ������t\\�]���e�\0�K�ⷉ�sV^K��I��-_v>\0?��\0�ӽ?&\'��q����e���������\0f�u��+|�����tP�,��pO���02�u\n	�V��\0�\Z0����V�%O��^��Tg8~RSl�\Z�TJ߿�߯<]�F0Z�\0c4�(�l	�><�=㡷A_,�܌Q\"��ݒZ�|�r�_\rʉ\'�1��ǥ����C*JJ�{N����H�ĭ^c@�=�K\Z�8��X�\n�Dnw#z=��\0,�b�C q�sS&$�e=(���_?��.�(�f���I5U�jۡ��	4C�e����9�qm�&������3\0�ei\Zvb6ە{�?ٮ0H�Ǩ�����\0X��G\'~��LsI߽�K�Pi�o�߆Q�x�X�a���w���M��5�ߐŦ+�\'�d�E��)?��L_B*hV��P#G��G_�꠯�������T�~*�6=�����\\���uM�S��N1��0�\r�\"M���߁���V�������7m{�� ����$2�xTv�Hd[�gtoU���r�6K�G�x3(���ֻ� �A�6{a�d^9��\"���ٕ���@�»�%}/�|ԑ�rqꚴ8W��\Z؁����\0��{���6aj�������K�0��(lو?�TS���%��}����c�\"�!�\n�S�l�)\'z7���wb~����;�\'ȇR�w���J�#�:G!Gp��D��܏��ف�Y�o�\Z��[���e�����8�ec��/��cV�G+��>R\\�G���tԬ���{�8�/e�pp��fe\',�Ԏ�N�w�p\0U^�\0��<�����f�\0ݐa��ڨ V�>X��4��|����6ņ�,I��ܓ�:�G���(�#ó���SdS��#�q|rQ�a���2l��G&�&v��	=w��%G奫��>���o�e�x��2ț2�v �<��A����x��p��@-��C`\n�#cG|m�DY��\n���SDQ=w��$��p�o\',u�)U�iT2mV��q����M:fa,B��#!c�ٖ��`���$M�� *\r����,N�tc�J-��8GpM�J�\n��G�u�L\\q�C�I���O��o�XjI�E���O-i_+��7���Ǔ���8�d��KN��i�^����~.jyx����	8w�4=��}ߍy{�OU�oz��`�����n������/A��\n\"�����H�Q���i+A1��=����d� t�,<���s\"fp�|`W2�\Z>B�T�e�ZE�$c��\0<�:�L�%J��ٌ�I�Ȫ|�\0~X�N3^��D�2L^%45r�@mx�,��ȭ�6��3��ܩR���؍$�=lQ�����嘮_*�΄�1^lG�:i���]A��<$�Rd����[y)>d��`�I\Zw�4ٶm0�j��f-����Œf�Ε�G}B\'�\'�-��,�#\r���-�}@�Ӌ,�bW�h�Dq���x�@�p�.�7���ʳN�`Z�*�6�j�#lu�|��ҫٽ$5����6�%fT��>֏/�#��X���\Zh�Z����\r��,����|\\	�a$��h�L��\r��x�v�y-LJ��)�J����$�n�͙�\\Bgh#�Xj��=�ia�m[ݏ#�^+�~��耉P����~ л�k$�&���NBIriS��*#�X}��Q�����\0F�[O��a�O{k2�\0	��o��E�&�&^2�N���\'���帍ы>C���)�+��\03�H_��Ѭ�(��,_p>�S��g!������ޒ�\'�|�o�����?��e1}b(��9�2��\"#����\\g�0��e�~�.�c�X���i��m���6Q��c�-o�\nq����s�����4����������\0��D�}y>/Vʨ>���/��1�?��.���jS�7��x�7u���Hm��|��G��\rV/�6�FNqT�3��NQQodU�9CN\n����wC��P2�Yv�:X�W�\\�t�Xi`\"�\"��A��]�o��O�|:����D\'\\��|�Z�Ґ*�m��4t�<��b��̅�R5v���Ǝ�H�ZP篚������*���ሧT�Z�h�c66�X�S�Hk?ı���$�����3N%Y\0a�-d�<���-,n;�y�7H���(t�kP�~��릭#���X����\\���\ZOm��Q�ۿ�?�������CHH�zUF�r9��[1\n,YC>y��p]\n䜵iDR5� �}��w���6�O���L=�>j.G3���Gt���4�v+�Q\0w�5��.�g�qq�VӨ��ub�ؐv�`X��C2�5��q���8>h�<�:lh�\"������q5�Q\"X�;�܀(t�5wneZϖ*81ʣj���	�!_�pI��&ڵ�7�������A1�s�)�olb��P+�\"��i��w5��@�wF���φ�c��ǘ�W���.��UW��ʩ:@%o��My�u�����M��@��-	������SI�i�i����1&C�Y����<f04Ƥ�h���k�}��rn	�F��W�%�7�3wk��kN�X\rU�D�1���V\\����,��N�J��y6ߍq�����gh��Mn$G]�K�G勐?���f����M��p쾗w��wj���[}����ge��:�J)��.���I]��0�:��n��7�I���h핷؏�:�Q�{��Ô�6R%\\�>9Q!�\r��E\rGJ�?��$ɸ��f��n앎7>mʭ���8���I�\0h���RwsA\"k�m�F�U�{�w\'n�Q��4�����TPC�nD���b��Ed���G	�,jD���F.N��dPV̯��n*�6N�>]3ʳ�Z=$�j�7A�>{uƲ�3�y,�N�Ǡ���]_K�F㙣�|�zY�v홓�f`9kb~��GNŲq1�Z��f� ����ʠ����ß��<� :���\'�(�iLZ��	ck��E�;�q)��Y���&YP�^���17DiO�^��9��-c�z���|EYϑ>�GP��?� �\'�%S(ێŶW��Id�6�6���S��ã��\"�iGēԓԟ<7�97��q?	ɶu��)ZEk��W>��#�a|U��g�+9�*�g×��UGIz1���>7���\Zǽa�����o76G�B�Yc�9�dե�V����R�,a�)�u�k�Ӎ�N�y��>����\"�]�H6�0�EސH`B.ѮC�!�)2��kd_#�Պ���z��expH�|�3�#y$Wm�x���y55�y����I3��3��V(�D\"�,J\0�	�\r��ϐ���\"�j9\\�N\0��5������������^7Q�)&��d��\n���\\5�]�[@TY�F���z��-�T���\'a���%F*;�Kb��nʾ H�ngsd6�`ױ��\0}ˑȤ��\Z����}�<�sb��D\rP,Et�����	�~f��+;�{�Ô&�~a���x�?ß�Z5��_�b����S,�cM���X����oϻ�}Ӳ~|��\n����x	{�\0	3��6���s2��ZO;��@��?�v3��\0���N�6��/����r��	�&�q$m�s̗~�S��\0�;�8$����<�z�G��4���4��e�7Q��h{���0ۼ���l��ϗ����(�������\'�@���4���+�cJ�=7g˖��6\r����[S�/�3`}����fm;_>��c���D�;���j���G��X`E=�(�ġE������a�I7���=2�$X�q����,f����������ñq����{��b5+j�+aTw������]m�`�C����>��>\\J5\n����끸g���<�d��+���}����>zW����QEj�zc����Q�X�2���v��*�ݒ��Z�y���R4|���5|��+�U�ru�y2�W�ԡ�<�L�V�o�\0��W�ՇRQ���G���Wg�3Wu\Z���C�VΛ�=.���:�c�>+$�<�{��#�A>u����DR�Pȿ\rk��,Ȼ⇵q~�Xc`�G�8��4�D�qCZ@$�\r����6�VU�3�2�?������`f��D�.M[G`}����w�\\0��1�nD��\r�cw%*�^+�TH�{���z��獾z��lp�vVtj�HF�bTp>�?�I��p�$����ʲ,d��\Zp�nW��3�p���wt�I\0<�O�Ӧ:���c�P���)�6a��r�Q����JI�Z#+ ���ژ�i{��&g��d�j�c˶oT�`����$h�eD��G��ڸ�����r��#v2V���3T�]una��AU���\'�Y�}��ǸJ�l�\"(���?�*;EŞ<�~�l�i�|�@�j�_L1ĺ��{\\��\r�E����~�ȍZX��\nko�l_����)shv���o�-��W�ڽ���\"N\r=ݷƇ�p�{�y�\0P��s���tq��QfYX���y�΅~�\Z�ʤ5���z�|�r����/\'���\0N*8�xeh���[�$n�o\\B�eɖ�9�[D̞h8�v \n���~��0uEu�aظ\\�I�N�R7������V`��Z��jEDD�B�����ݜMe�\rb��0�v[6ܟ�/���;)��6�o�^!�=���0�\0\'�\Z~��0�8�h�+�3���N�/�ٚ�B�_G�x��a/��[\r�1���Ь�0+F78�)� o��$\0	��diE�;,L���0\0׿���o�D�d�u5����;�îDSɘ\r�Mbfs������6����X�\n�]�>cs�u�QlX���.+&Lq��6��X1�խ��v�o.�{�;i�׷��X\0⽫B��>ʷ��ʚ������Lk<f����r\\�����ܨ���g}��VY�i�3�!�:wD��ڢH\n:=o�)VD����.�iu\Z���]J�k\n˻܋n\"�{2�S��O�4�����1ˁ\"!`����I\0�*M��]l0øF&Yy+#Z�\n*�����86u��92�XbA���հ�t��c��L˸~Rݚ�h;�L2��0��\09	\'�;�1��{�x�H�\ne�*��$��h�YF��	(֞k�4a(�.G�nF�_}}��j��aG��־c\Z�c��J�W�߶g���_�����G��$��N����=��ӆm@F��0$E	}F$X�UY@�uӡ�\\U٣������W��\0�7�EO���E�9Kd����2�Hy�]��+5�(�ji��O�Ğ\"��\0Y�NX�9:�驀TR�N���y��R��\0��^��I��Z2�/G�t_o�/�	�Q�某#��u��+o;�_��9��ecm/2���g���5�g}KEHS��K;y��p����\0I��_���k$rK�=L�%%���m���\n> |%��9]��\Z���0�YY&�\nB�;��|^��<=�\nT��k����3R�v��;�����-X����=���+��Ӷ�u6ߥc��NZ�����>{㘲lN�y��\r1?�ǿ��(��AUa�nMQ�Z��/��g����~e��.F=ǋ�q�BB��\0��T�\r������Vc�A\'�7�7�\\>��X_��|@7��1��/��3j;r^H߽��9�pI=(E�4G���q���+�\'cUg�m�������/O����Z鳯������A�PD���ц��.�h�>�g��z���\r��#���0��A���l��d��ט���q�~=W�����:�t�;E�V����HTt���|�y��|k�$E6m5eZE�;b2��Õݝ����ݥ���r6,�(�3����b�%��X�/*+�$q`���﯆8�Ŧ�*�c1�B�$ǍrB�L�h\n�\0u#v́��ڞ���D�́׻1����!؞�u�(�ʤ�-$�T�l��\Z�+��\\Jꒇ,�ku(�y�@\n(�;X{?�N�mu3ǏZ�,�/Ē�0f3w`���l�?����F�Nצ������8��R����G^_�3Ā% �����U��{��Ş�T�mտ!���m��G���d1RhxE���ǹ�3lT�X���x��+�_r�x��t�/���\r���P>��<��=Q��0�(<�d��&��:��@����;SǾ�,���ua���v\ZXR�m|<�{^b�I#eb�⏘�>��]�����L��\\�\"v�\0E��������0�kV�n��ϞI�i�C��f���њrKj�5�~^@��n�;�dF�=M����ԅ삵`�h���x�S�,E+1;�j�j����1a� �X�uN�2?@>XaA��R��L!��.���l9s���\\����Lł[>J9o~�G�}y@|��?��2Y�ڬ�﹮t>_~9\\D��\'�!�M��\\�F{ĭLH�ս_]�bB��1�T�@#M��IO���\0����n!���rT��>G�\0���]NU�?~�}�*U��9lo`{�YZI	�M(��7�!�R��NՍ�`A �ȮC��h$�rŔj>$�j��S�^��ix��R�<`Y�m�\ZQ��\n�,o�yўm�`�e�%܉�u���{�kʷ������F7�{���k.�+�TX�\0?�w�a�t��a����?����F5mkt�������AB]D��A�Ӆ�%x��?�t@�$I��t89�09ῲN�����K���3<��[��rI>�_lY���lm�n�[c��\0��X�7�����er�^E7�\0�E|�����=�sě*˽�r;��{��B�B3gr�G��m������y��Bk�.��}oӝ�+�FP̤��kT(s�}�9�3�/u#R��6K�j�\'��,:�Y�٢��d�O����{9����ʮ�j)W#�J�y|�C٬�ӣg^�id�B�T ������>xq��\Z����_��A�i��R�S��=@��m\\����w�x���I\n�Y�M+�5��ܝ�ۯ�q\\�,��d��亞0F�l�;Y�q�f<��(ރH(\\�y��\Z�j��,	�\r��r��ˬmF��w/��NL�:��t:�&�\0Y�y�D��qO�A޸����ş�Qq(r�W`��_!Y�u\Z��ʾ#0��3Ay�Q_x;��q!���F,rԛ�2�3�zQ�BH\0=ߋr7��X7��\"}L�rF�0�I}����m~���^q�̋�������#����9���X��|?,wxm���^#i�VRp�r��Hb	��4�}I�E�FP(Y݄��RO��3�Z=\n���5WZW�r<�_�\"q��N�$�r,N��|���m�Ȳ/x��2_ٕO�a��l�u��������ɼ�`8��\05a��mL�y�<�o������iy�\\�e��;u�����L�}e�AT��d�N� =J�OJ\"��W��e[Je���c���|?0٘��)5jFf(�oGʅ]zW�0�%m�*�ca�b���G�%Х�n@^�q}�%j�Z�$��:���`������=1�0G�^_�7��&c���x��V���{С�B��Fc������\0����$z�E�@Ki��L���-���Y���t|_Pw/���\'���\0�o�,ir��ߧ�1E�L�p�f$,�HPARHQa�Vë����|�X�&�_+8��aω�����8d���U�	��*Mj�A�e����ŉʉ$�B�\0*��z\r�a��px�7��I�ˤ0�����}6v�����q\"���1��uV�ަǾǞ8|_�NQp�J|������R��e<(��S_3��1r%����0y#�r�s\"�ِ��Lud��+}�2�\'h��\0mH�b`��E�\rVB�����|k��J���\\*�\\fr�0�/aT����_<Dˇ�ɨ�{2W���?�(o=�]���Aգ�XeLpY@,N\\8�uY�cA4E[}\"D ��WR@�@h徲H����_�+���[oVϥr��\\u$����R�HgR�lvc�#ȑ�m��}�r,����u }�Z����]=y�v\n��s2������xH�Y)\n�1�7�o!u���d$XR�i���!��\n\'����Mm}����⣦�>6NWG�&ڣsJ����ʶ��s�fX���j������gx��f\'�E@�vV�:��>k�WLA=��s�����bh�!�G�b�0\"Vڇ�1���8��T!�:����(�y���1�_F�[m���_���!��h�Ci��\r\Z���5��<�f�~��F��G��	Q}.CW�7�-x�i��i˗�1p��C܉���7-�O��(���&]ܔ(�+I ���	s��\Z� �4�$���;\0	8�����1�|����ߕFG�?�qW�~2A0}]�*	�[-SH�����w��6��k=��v��ץ!.���J_Cj�\Z�5\r$�*=n�_i�YL&9AS�ɢ�-\\�_��TzŊd{HS�Kv��b7,�F�K߿�,X�$&�.�H[iw���X\Zu�4	�b�¬�#(�}�s�����E�]l�1�\02��&g��E��)Ud�;��Z�\Z\n�!Q#��dZ\0Qx3U�B&��tj�[iu�\0석A��\\�e\\����&p�t�B�D���HT�F6SRA]#���6bIU�sB�bfr��[[}�%ِ�\0e�0��\Z��L����<��*���CM��EGH�.�f7�����U�6�H�F��\0��1�;ٜ��\0�q%�]@Fd�*��}�J�^����\\���-؁��!h�jo���7@c�;%�(\"��2I\n9\n,�V��m|�q`�`�I�)�I�2y��B�� Qa�v�,e`�*�u-��Ҵ�����N�d��@�g ��UJ�eӡR�]�$h��^G�3}��L�Fʧ.d(��З.ʒ� �t);�j�X�\0;7����kID2Zgy��\n�,4��P�!f;	1�{���љQڗI�F�Z�����\Zf\0\0�]��feh�yӳ�&g�����j����q��L�����3�`���,���J�<�*�8X\0���ј�Y$YMzc�ꄎ���_�v�j�<5��bI4�w��22�EQ��K	`H7�QB��`�\0\\/��@b��J��u��\0� Y�������Y��C#��HL����B��v��M;f��[��p�\'z�O����N���B�����)��)���!��A�*��<���^\0[%�\0�Jt�rt[��k��>\\��#�J�edN��5�����\0�6��\0\0\08=���:������������������������������������������sˤ]��z{4�T�\Z\0Y\'�����t�����	7�\r���~�_��xX\0�_����q�\"���B�Qm��I�q�`F�C����Ȥ)�y���v\0d�\0�t�������b�ďN{^!���ٴ��C�%�\n��\"��^��\0�.}���;^��k��|1�g\Z�ogU�@�\\���&a`�\0鍂}�j��t3�K7v�:ogk�o�&�n(1\\�܊X=\r>c��è��Q��m=��o�a��cR�V�VǄ���������=GpA�c�\0q�������:-X�\0k�?,{���C��I2�4�^�$��z�CԌ\0<�[��\\=��Č᛹�\ZF} �d���@b�\0x�A�u!�\"�S]���|\np����3*��D4�B\"(Z��Y\'m����s��\n�=��x\Z%��Z�K΁��W��oH����X��S���t��\0#�`(���[l4�鵜\n������\r�tN��}v��I�,,\0W���«3��r9Y7���o���S\"�^�J�bܨ\n6�|�z��\0�}\Z�b���#Ug�o��%,h�ژ(�d\r��a`�^�IdY�Z@\0\"� t��\0�����]7����W�א��m�+��Mq��^�n~��G\n�I��X�$�X����\'�\0��j��Y��96�j�*��ɾ��bi���	�7����N��6�oxX\0��d�(��Ô�����B��+k�ry�6{�T0���F��Ng�k���1M �	��w�~���/ح��zx���a`��<��$i5�{nb���\rv�<�)X�\n��L[k�+-\0\Z���p�Y���5�(j؁{�KB��<,,\0��','2018-09-22','100',NULL);
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NEWS_FEED`
--

DROP TABLE IF EXISTS `NEWS_FEED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEWS_FEED` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(200) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `N_ID` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NEWS_FEED`
--

LOCK TABLES `NEWS_FEED` WRITE;
/*!40000 ALTER TABLE `NEWS_FEED` DISABLE KEYS */;
/*!40000 ALTER TABLE `NEWS_FEED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTER_FOR_EVENT`
--

DROP TABLE IF EXISTS `REGISTER_FOR_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTER_FOR_EVENT` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `event_id` int(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `event_name` varchar(50) NOT NULL,
  `mobile_no` int(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `REGISTER_FOR_EVENT_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `WEB_USER` (`user_id`),
  CONSTRAINT `REGISTER_FOR_EVENT_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTER_FOR_EVENT`
--

LOCK TABLES `REGISTER_FOR_EVENT` WRITE;
/*!40000 ALTER TABLE `REGISTER_FOR_EVENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTER_FOR_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_USER`
--

DROP TABLE IF EXISTS `WEB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_USER` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `year_of_study` int(2) DEFAULT NULL,
  `reg_id` varchar(20) DEFAULT NULL,
  `branch` varchar(20) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `EMAIL` (`email_id`),
  UNIQUE KEY `MOBILE` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_USER`
--

LOCK TABLES `WEB_USER` WRITE;
/*!40000 ALTER TABLE `WEB_USER` DISABLE KEYS */;
INSERT INTO `WEB_USER` (`user_id`, email_id, `mobile`, `user_password`, `year_of_study`, `reg_id`, `branch`, `user_type`) VALUES (1001, 'onkarbhujbal95@gmail.com', '8446320691', NULL, NULL, NULL, NULL, NULL), (1002, 'bchaitanya@gmail.com', '9552586390', NULL, NULL, NULL, NULL, NULL), (1003, 'snehalchaudhari@gmail.com', '9881035311', NULL, NULL, NULL, NULL, NULL), (1004, 'sakshibihani@gmail.com', '9420378369', NULL, NULL, NULL, NULL, NULL), (1005, 'sanved007@gmail.com', '9011011060', NULL, NULL, NULL, NULL, NULL), (1014, 'bchaitanya15@gmail.com', '9552565839', 'chaitanya', NULL, NULL, NULL, NULL), (1015,'abc@gmail.com','9226871649','onkar',NULL,NULL,NULL,NULL), (1016,'pictadmin@gmail.com','9130540536','admin@123',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `WEB_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!50001 DROP VIEW IF EXISTS `stats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `stats` AS SELECT 
 1 AS `type`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `stats`
--

/*!50001 DROP VIEW IF EXISTS `stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stats` AS select 'user_count' AS `type`,count(0) AS `count` from `WEB_USER` union select 'event_count' AS `type`,count(0) AS `count` from `EVENT` union select 'entries_count' AS `type`,count(0) AS `count` from `REGISTER_FOR_EVENT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 15:00:36
