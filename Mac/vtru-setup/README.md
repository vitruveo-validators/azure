
![Screenshot 2024-01-31 202655](https://github.com/vitruveo-validators/aws/assets/157662422/354799ca-27f1-48ec-b68d-258bbd895bfe)

**This document will step you through connecting to your validator and installing Vitruveo validator software**

1. After deploying your Azure instance successfully review the commands and follow steps.

![image](https://github.com/vitruveo-validators/azure/assets/157662422/0cdbe80b-b7b7-41ed-9fbc-d981bc79e9d4)



a) Copy the first Mac command to give your account read permissions and remove other users. Security protection.


     chmod 400 validator.pem 


![image](https://github.com/vitruveo-validators/azure/assets/157662422/7bb8bffd-6007-4f4e-86be-6b209f9044a1)


b) Replace **YOUR-PUBLIC-IP** with your Public IP that is detailed in the output and type yes to the question


     ssh -i validator.pem validatoradmin@<YOUR-PUBLIC-IP> 


![image](https://github.com/vitruveo-validators/azure/assets/157662422/2b2ac1bc-a54d-4746-b34a-b6a3cc869482)



a) You are now logged onto your Azure Validator 

![image](https://github.com/vitruveo-validators/azure/assets/157662422/9625703a-454c-45f3-b733-d0fc69618b61)



**NEXT STEPS ARE TO INSTALL THE VALIDATOR CODE FOR YOUR NODE VIA A BASH SCRIPT**

Coming soon...




