#!/bin/sh
mysql -uroot -pdemo -e  "use anao;\. anao_s.sql"
mysql -uroot -pdemo -e  "use anao_relations;\. anao_relations_s.sql"
mysql -uroot -pdemo -e  "use bdsdc;\. bdsdc_s.sql"
mysql -uroot -pdemo -e  "use c2000;\. c2000_s.sql"
mysql -uroot -pdemo -e  "use compta;\. compta_s.sql"
mysql -uroot -pdemo -e  "use comptoirs;\. comptoirs_s.sql"
mysql -uroot -pdemo -e  "use dcf;\. dcf_s.sql"
mysql -uroot -pdemo -e  "use factory;\. factory_s.sql"
mysql -uroot -pdemo -e  "use magasin;\. magasin_s.sql"
mysql -uroot -pdemo -e  "use mairiepq;\. mairiepq_s.sql"
mysql -uroot -pdemo -e  "use master;\. master_s.sql"
mysql -uroot -pdemo -e  "use nuance;\. nuance_s.sql"
mysql -uroot -pdemo -e  "use phpmyadmin;\. phpmyadmin_s.sql"
mysql -uroot -pdemo -e  "use puzzle;\. puzzle_s.sql"
mysql -uroot -pdemo -e  "use rp;\. rp_s.sql"
mysql -uroot -pdemo -e  "use toshiba;\. toshiba_s.sql"
mysql -uroot -pdemo -e  "use toshiba_relations;\. toshiba_relations_s.sql"
