Feature: Register Page
    ผู้ใช้อยากจะกรอกข้อมูลเพื่อสมัครสมาชิกในการใช้งานระบบ

    Scenario: กรอกข้อมูลถูกต้องสมัครได้สำเร็จ
        Given ฉันสมัครสมาชิกด้วยข้อมูลของฉันดังนี้แล้ว:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 01-01-1990 | Male   | chanon@za.com   | 0987654321  | CSS     |
        When ฉันกดลบข้อมูลของฉัน
        Then ข้อมูลของฉันจะหายไป