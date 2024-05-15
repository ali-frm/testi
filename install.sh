#!/bin/bash

# نمایش پرسش برای تعیین موقعیت سرور
echo "این سرور در ایران است یا خارج؟ (iran/abroad)"
read server_location

# تنظیم مسیر ریپازیتوری GitHub
REPO_URL="https://raw.githubusercontent.com/ali-frm/testi/main"

if [ "$server_location" == "iran" ]; then
    # دانلود و نصب اسکریپت برای سرور ایران
    wget "$REPO_URL/server_iran.sh" -O server_iran.sh
    chmod +x server_iran.sh
    ./server_iran.sh
elif [ "$server_location" == "abroad" ]; then
    # دانلود و نصب اسکریپت برای سرور خارج
    wget "$REPO_URL/server_abroad.sh" -O server_abroad.sh
    chmod +x server_abroad.sh
    ./server_abroad.sh
else
    echo "پاسخ نامعتبر. لطفا 'iran' یا 'abroad' را وارد کنید."
fi

echo "نصب اسکریپت مورد نظر با موفقیت انجام شد."
