@echo off

Rem datos del servidor kms

SET KMS_SERVER_IP=viaduct.proxy.rlwy.net
SET KMS_SERVER_PORT=21698
SET KMS_PRODUCT_KEY=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4

slmgr /ipk %KMS_PRODUCT_KEY%

slmgr /skms  %KMS_SERVER_IP%:%KMS_SERVER_PORT%

slmgr /ato 

exit /b 