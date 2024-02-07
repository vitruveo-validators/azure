![image](https://github.com/vitruveo-validators/aws/assets/157662422/0bf3e724-4ff2-45f1-8406-e7454111baf1)



**This document will step you through connecting to your validator via PuTTY and installing Vitruveo validator software**


1. Start PuTTY by typing putty in the search bar and running the application - **NOTE don't run PuTTYgen**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/c4469d5a-b252-4798-8fd7-c005063ed852)

2. First step in PuTTY is to add your Private Key to the application by navigating to Credentials like in this image

   Connection > SSH > Auth > Credentials

![image](https://github.com/vitruveo-validators/aws/assets/157662422/4afb840d-55de-4db3-8ce8-9e32c4348412)

3. Under Private key file for authentication select 'Browse' and find the PPK file saved from STEP 3 and then select 'Open' one time.

![image](https://github.com/vitruveo-validators/aws/assets/157662422/617024ec-a5b0-4039-8c22-886dcc7af4e7)

a) Your path to the PPK file will more than likely be different and that is ok.

![image](https://github.com/vitruveo-validators/aws/assets/157662422/edb66efc-f21d-4013-b6e9-f6674292251d)

b) In the left hand side of PuTTY under 'Category:' navigate back to the top and select sessions

![image](https://github.com/vitruveo-validators/aws/assets/157662422/6954433f-8913-4e5a-82e2-2fe021f99648)


4. Noow log onto the AWS portal if not already logged in and find the Public IP.

https://console.aws.amazon.com/

5. Search for EC2

![image](https://github.com/vitruveo-validators/aws/assets/157662422/28f74f1a-69d0-4470-bebd-fffcd12e4c21)

6. Select 'Elastic IPs"

![image](https://github.com/vitruveo-validators/aws/assets/157662422/bc18ea66-5186-4f8b-8a63-4b4d7773dfd4)

7. Copy your Allocated IP address

![image](https://github.com/vitruveo-validators/aws/assets/157662422/1e2efd41-5cd1-4b75-9a3f-556b447d67c7)

8. Paste it into the 'Host Name or IP address' field

![image](https://github.com/vitruveo-validators/aws/assets/157662422/4f251e1a-f583-4219-b073-205ddc2b7718)

9. Under 'Saved Sessions' give it a name and select 'Save'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/fec17f4d-095e-4d58-bd9e-f186a24bedaa)

10. Now click 'Open'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/8af9567e-7117-4cd9-a8ec-206ea3313620)

11. Select 'Accept' to the one time message

![image](https://github.com/vitruveo-validators/aws/assets/157662422/41bbc0b3-7259-4aa6-ac2c-450ccbc006f0)

12. Type **ubuntu** and hit enter and then enter your passphrase from STEP 3

![image](https://github.com/vitruveo-validators/aws/assets/157662422/3378b37d-ad7c-4e15-83bd-e460afe02215)

13. You are now logged on

![image](https://github.com/vitruveo-validators/aws/assets/157662422/47f38b1b-6749-4f71-8cd1-96874b950b76)


**NEXT STEPS ARE TO INSTALL THE VALIDATOR CODE FOR YOUR NODE VIA A BASH SCRIPT**


**1. Download the BASH script locally on your Validator by typing:-** 

     wget  https://raw.githubusercontent.com/vitruveo-validators/aws/main/Windows/vtru-setup/vtru.sh 

**2. Now start the script by typing:-**

     sudo vtru.sh 
