# Список требований в контексте внешних интеграций

1. Взаимодействие по зашифрованным протоколам (HTTPS, TLS 1.2). Обеспечит защиту от MITM.
2. Отсутствие передачи персональных данных через токенизацию или минимизации пересылаемых данных 
(например, взаимодействие только через идентификаторы). 
Обеспечит защиту от потенциальных утечек данных на стороне внешних сервисов.
3. Выделенные сервисные пользователи для внешних сервисов и соответствие принципу минимальных привилегий (Least Privilege). 
Сервисы могут запрашивать только те данные, на которых у них должен быть доступ.
4. Регулярные аудиты сервисных учетных записей на предмет наличия избыточных доступов.
5. Мониторинг и алертинг подозрительной активности со стороны внешних сервисов. 
Сюда можно отнести: попытки получить несанкционированный доступ к несвязанным ресурсам, слишком частые запросы.
6. VPN канал между сервисами партнеров и системой "PropDevelopment".
7. Firewall, DDoS защита.
8. Белый список IP-адресов для доступа к системе.
9. MFA для пользователей.
10. Шифрование персональных данных на уровне СУБД.

# Протоколы аутентификации и авторизации

Внешние сервисы при запросе данных из системы "PropDevelopment" должны получать токен авторизации (JWT) через Keycloak.
Далее при использовании API использовать его в соответсвующих заголовках. У токена есть срок жизни, по истечении которого, необходимо будет его продлевать.

# Взаимодействие между системами предприятия и внешней платформой

Предполагается взаимодействие по HTTPS протоколу, обеспечивающее шифрование передаваемых данных.
