FROM php:8.2-apache

WORKDIR /var/www/html

# Копируем все файлы сайта
COPY . .

# Включаем mod_rewrite для ЧПУ URL
RUN a2enmod rewrite

# Настраиваем порт для render.com (обязательно 8080)
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf

EXPOSE 8080

CMD ["apache2-foreground"]