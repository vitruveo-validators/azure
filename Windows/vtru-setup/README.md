![image](https://github.com/vitruveo-validators/aws/assets/157662422/0bf3e724-4ff2-45f1-8406-e7454111baf1)



**This document will step you through connecting to your validator and installing Vitruveo validator software**


1. After deploying your Azure instance successfully review the commands in the output. Copy each commpand and run.

![image](https://github.com/vitruveo-validators/azure/assets/157662422/c1103c39-d349-44bb-adf6-26fbef1220f5)


      icacls validator.pem /Inheritance:r

![image](https://github.com/vitruveo-validators/azure/assets/157662422/20272bbe-d40f-4df4-a44e-565406a954f9)


      icacls validator.pem /Grant:r "%Username%":"(R)"


![image](https://github.com/vitruveo-validators/azure/assets/157662422/76f22190-3c3b-4144-a64c-69f47c27b531)

a) Remove **YOUR-PUBLIC-IP** and add your Public IP that is detailed in the output and type **yes** to the question

     ssh -i validator.pem validatoradmin@<YOUR-PUBLIC-IP> 

![image](https://github.com/vitruveo-validators/azure/assets/157662422/5e53669a-0f64-445d-82b9-af3736b25fc2)



![image](https://github.com/vitruveo-validators/azure/assets/157662422/77d1dd12-24a7-4848-b9cd-1d235dc013db)






**NEXT STEPS ARE TO INSTALL THE VALIDATOR CODE FOR YOUR NODE VIA A BASH SCRIPT**


**1. Download the BASH script locally on your Validator by typing:-** 

     wget https://raw.githubusercontent.com/vitruveo-validators/azure/main/Windows/vtru-setup/vtru.sh 

**2. Now start the script by typing:-**

     sudo vtru.sh 
