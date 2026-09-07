# JUTI Ragnarok Website

เว็บพอร์ทัล Ragnarok สำหรับ JUTI-HI สร้างใหม่โดยอ้างอิงแนวทาง UX/feature จาก enigma-juti.com แต่ใช้โค้ดและหน้าตา original ของโปรเจกต์นี้

## Features
- Home / live Login-Char-Map status
- Register และ Login เชื่อมตาราง `ragnarok_db.login`
- Member dashboard + รายชื่อตัวละคร
- Ranking Zeny / Level / PvP / MVP
- Server information / download section
- News table (`web_news`)
- PDO prepared statements, CSRF protection, session regeneration, output escaping

## Local setup
1. PHP 8.x + PDO MySQL
2. ตั้ง DocumentRoot หรือ copy/symlink โฟลเดอร์นี้เป็น `htdocs/juti-ragnarok`
3. Import `sql/web.sql` เข้า `ragnarok_db`
4. ตรวจ `config/app.php`
5. เปิด `http://localhost/juti-ragnarok/`

## Important
ชุด emulator นี้ตั้ง `use_MD5_passwords: no` ดังนั้นระบบสมัครสมาชิกเขียน password แบบ plain ตาม schema/config ของ login-server ปัจจุบัน หากเปลี่ยน emulator เป็น MD5 ต้องแก้ register/login ให้ตรงกันก่อนเปิด public.
