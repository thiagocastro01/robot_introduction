def get_payload_user_login():
    return {
        "email": "felipe@gmail.com",
        "password": "pwd123"
    }


def get_payload_wrong_email():
    return {
        "email": "felpe$gmail.com",
        "password": "pwd23"
    }


def get_payload_email_not_found():
    return {
        "email": "not_found@gmail.com",
        "password": "pwd23"
    }
