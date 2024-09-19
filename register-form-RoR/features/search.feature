Feature: Search
    ผู้ใช้อยากเห็นข้อมูลของตัวเองในกรณีที่มีข้อมูลอยู่เยอะมาก

    Scenario: ค้นหาข้อมูลของตัวเองได้สำเร็จ
        Given ฉันสมัครสมาชิกด้วยข้อมูลของฉันดังนี้โดยมีข้อมูลของคนอื่นอยู่แล้วด้วย:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 01-01-1990 | Male   | chanon@za.com   | 0987654321  | CSS     |
        When ฉันค้นหาข้อมูลของฉันจากชื่อ "Chanon"
        Then ฉันจะเห็นข้อมูลของฉันดังนี้แค่คนเดียว:
            | First Name  | Last Name        | Birthday   | Gender | Email           | Phone       | Subject |
            | Chanon      | Wiriyathanachit  | 1990-01-01 | Male   | chanon@za.com   | 0987654321  | CSS     |