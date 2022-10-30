class User < ApplicationRecord
    has_secure_password
    has_many :glasses
    VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
    validates :Email, presence: true, uniqueness: true,
    format:{with:VALID_EMAIL_REGEX,multiline:true}

    validates :Name, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 8 },
              if: -> { new_record? || !password.nil? }
    enum Currency: {
        USD: 0,
        GBP: 1,
        EUR: 2,
        JOD: 3,
        JPY: 4,
    }
end
