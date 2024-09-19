Feature: Register Modal
    ผู้ใช้อยากจะกรอกข้อมูลเพื่อสมัครสมาชิกในหน้า Dashboard

    Scenario: กรอกข้อมูลถูกต้องสมัครได้สำเร็จ
        Given ฉันมาที่หน้า Dashboard แล้ว
        When ฉันกดที่ปุ่ม "+ Register"
        And ฉันกรอกข้อมูลดังนี้:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 01-01-1990 | Male   | chanon@za.com   | 0987654321  | CSS     |
        And ฉันกดที่ปุ่ม "Submit"
        Then เห็นข้อมูลของฉันดังนี้:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 1990-01-01 | Male   | chanon@za.com   | 0987654321  | CSS     |