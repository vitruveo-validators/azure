
![Screenshot 2024-01-31 202655](https://github.com/vitruveo-validators/aws/assets/157662422/354799ca-27f1-48ec-b68d-258bbd895bfe)

**This document will step you through connecting to your validator installing Vitruveo validator software**

1. After deploying your Azure instance successfully review the commands and follow steps.

![image](https://github.com/vitruveo-validators/azure/assets/157662422/0cdbe80b-b7b7-41ed-9fbc-d981bc79e9d4)



a) Copy the first Mac command to give your account read permissions and remove other users. Security protection.


     chmod 400 validator.pem 


![image](https://github.com/vitruveo-validators/aws/assets/157662422/9f4819fc-d47e-4b1d-aaef-5c96b17bb866)

b) Replace **YOUR-PUBLIC-IP** with your Public IP that is detailed in the output and type yes to the question


     ssh -i validator.pem validatoradmin@<YOUR-PUBLIC-IP> 



a) Search for EC2

![image](https://github.com/vitruveo-validators/aws/assets/157662422/28f74f1a-69d0-4470-bebd-fffcd12e4c21)

b) Select 'Elastic IPs"

![image](https://github.com/vitruveo-validators/aws/assets/157662422/bc18ea66-5186-4f8b-8a63-4b4d7773dfd4)

c) Copy your Allocated IP address

![image](https://github.com/vitruveo-validators/aws/assets/157662422/e1ea57b8-ba06-4681-a6f9-3ecaf2d134bd)



d) Now run SSH by typing **ssh -i validator.pem ubuntu@PASTE-YOUR-IP-HERE** and hit enter NOTE:- your IP will be different from image



     ssh -i validator.pem ubuntu@PASTE-YOUR-IP-HERE
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/75264a08-ce9f-4070-b202-0b7a763aecec)



e) Type **yes** to the question and type your password for the PEM file

![image](https://github.com/vitruveo-validators/aws/assets/157662422/e52192a1-1b4a-4212-a3d5-63950f7ca380)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/5916aba6-73b2-43be-a4a6-33832d9a98c6)




a) You are now logged onto your AWS Validator 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/62cbcce8-6b20-48cc-9357-f13dc9e5c024)




**NEXT STEPS ARE TO INSTALL THE VALIDATOR CODE FOR YOUR NODE VIA A BASH SCRIPT**

**1. Download the BASH script locally on your Validator**

 
a) Type **wget https://raw.githubusercontent.com/vitruveo-validators/aws/main/Mac/vtru-setup/vtru.sh**


     wget https://raw.githubusercontent.com/vitruveo-validators/aws/main/Mac/vtru-setup/vtru.sh
  

![image](https://github.com/vitruveo-validators/aws/assets/157662422/27e6061b-c057-4eec-9401-2dc272f5e680)



b) Now start the script by running **sudo bash vtru.sh**

  
     sudo bash vtru.sh



![image](https://github.com/vitruveo-validators/aws/assets/157662422/5e0c6736-a021-4b78-9849-c89d7984d33d)






