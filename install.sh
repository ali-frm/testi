#!/bin/bash

# نمایش پرسش برای تعیین موقعیت سرور با رنگ سبز
echo -e "\033[0;32mIs this server located in Iran or abroad? (iran/abroad):\033[0m"
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
    echo -e "\033[0;32mInvalid response. Please enter 'iran' or 'abroad'.\033[0m"
fi

echo -e "\033[0;32mThe appropriate script has been successfully installed and executed.\033[0m"
