Feature: Register Page
    ผู้ใช้อยากจะกรอกข้อมูลเพื่อสมัครสมาชิกในการใช้งานระบบ

    Scenario: กรอกข้อมูลถูกต้องสมัครได้สำเร็จ
        Given ฉันมาที่หน้าสมัครสมาชิก
        When ฉันกรอกชื่อ "Chanon"
        And ฉันกรอกนามสกุล "Wiriyathanachit"
        And ฉันกรอกวันเกิด "01-01-1990"
        And ฉันกรอกเพศ "Male"
        And ฉันกรอกอีเมล "chanon@za.com"
        And ฉันกรอกเบอร์โทรศัพท์ "0987654321"
        And ฉันกรอกเรื่องทำงาน "CSS"
        And ฉันกดสมัครสมาชิก
        Then ฉันจะเห็นหน้า "Dashboard"
        And เห็นข้อมูลของฉันดังนี้:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 1990-01-01 | Male   | chanon@za.com   | 0987654321  | CSS     |