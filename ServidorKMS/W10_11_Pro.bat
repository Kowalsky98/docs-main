@echo off

Rem datos del servidor kms

SET KMS_SERVER_IP=kms.gana-loterias.online
SET KMS_SERVER_PORT=1688
SET KMS_PRODUCT_KEY=W269N-WFGWX-YVC9B-4J6C9-T83GX

slmgr /ipk %KMS_PRODUCT_KEY%

slmgr /skms  %KMS_SERVER_IP%:%KMS_SERVER_PORT%

slmgr /ato

exit /b