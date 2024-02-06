
![image](https://github.com/vitruveo-validators/azure/assets/157662422/d5ddfd24-2b07-4b75-aba9-de7ecd5a4518)




**START HERE - prerequisites**

**STEP 1** First create your Azure account - [https://console.aws.amazon.com/](https://portal.azure.com/)

**STEP 2** Follow this document on a Windows 10 or Windows 11 with all updates installed and as a local Administrator 



**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**



**1. Run a command prompt as an Administrator (you need to be a local admin of your machine):**


![image](https://github.com/vitruveo-validators/aws/assets/157662422/b4131d26-9303-4072-a010-54b9ff717d83)



**2. Create a folder and download a ZIP file:**

Type cd\ and hit **enter**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/051ce98d-f33f-45da-a978-724ef1cdcb3b)

Type **md AWS** and hit **enter**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/aa8675c5-38c2-412a-a86f-0fddfe137767)


Type **cd AWS** and hit **enter**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/5298746b-5661-4671-a496-4de6123904ee)



**3. Download Terraform Code by clicking on the image 'Download ZIP'**

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/6fabf047-5201-460d-a42a-93fda5564e61)](https://github.com/vitruveo-validators/azure/archive/refs/heads/main.zip)




**4. Download AWS CLI by click the following image**

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/2d1bcbb5-e29b-459b-9289-90abd25e5086)](https://awscli.amazonaws.com/AWSCLIV2.msi)


**5. On your PC, open File Explorer and navigate to your Downloads folder**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/ac780075-11e3-4022-8bbe-fc4c613da768)

  
a) Right click on aws-main.zip and select 'Extract All'


![image](https://github.com/vitruveo-validators/aws/assets/157662422/90a2a938-f38e-4146-89fe-57e9861cc178)


b) Change the location of the extracted file by typing c:\aws\ and click 'Extract'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/89e886d8-e41e-44d0-b077-47f35dcb3a34)

c) Install AWS CLI by running the file 'AWSCLIV2.msi' and selecting all defaults


![image](https://github.com/vitruveo-validators/aws/assets/157662422/8fde5b4f-8803-4244-9133-bece037853c0)


d) Navigate to the aws-main folder - c:\AWS\aws-main - right click on the file 'terraform_1.7.1_windows_386.zip' and select 'Extract All'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/0af0f5eb-e6e1-4380-9edc-16fdbdd60fb7)


e) Type c:\aws\aws-main\ and then select 'Extract' **NOTE** - make sure its the same as this image.

![image](https://github.com/vitruveo-validators/aws/assets/157662422/d4a68f2b-b898-4800-99eb-de45229d5d8b)

**$\color{Red}Close\ ALL\ Windows\ and\ restart\ the\ Command\ Prompt\ as\ an\ Administrator\ like\ in\ Step\ 1.$**


**6. Authorizing against your AWS account**

a) Change to the aws-main directory by typing ** cd c:\aws\aws-main** and hit enter

![image](https://github.com/vitruveo-validators/aws/assets/157662422/3ed06c9d-76c7-4bc6-901b-87b3ad3130e8)


b) Authorize to your AWS account using your secret keys by typing **aws configure** and hitting enter

c) Add your access key from your saved notepad that was completed in STEP 2

![image](https://github.com/vitruveo-validators/aws/assets/157662422/1bb6fe01-0cda-4c9e-bd71-72c0d6e68988)

d)Add your secret access key from your saved notepad that was completed in STEP 2

![image](https://github.com/vitruveo-validators/aws/assets/157662422/e9106582-2708-424c-94a3-56000b3affe7)


c) Hit enter twice adding no text for the default options

![image](https://github.com/vitruveo-validators/aws/assets/157662422/5032ce15-3a2b-48c7-86eb-026c236b6188)


**7. **VERY IMPORTANT STEP** - Take your time as it needs to be done correctly**

a) Click File Explorer in the task bar

![image](https://github.com/vitruveo-validators/aws/assets/157662422/caf95ad6-d148-4497-a8dd-4ab9d0b526ce)

b) Navigate to 'c:\AWS\aws-main'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/36aed84e-6c45-4613-8382-61ffbce64cd7)

c) Right click on the main.tf file and select 'Open with'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/02d7de39-3ef9-4c3b-b26f-0ca840a8069b)

d) **IMPORTANT**  Untick 'Always use this app to open .tf files' - then select 'Notepad' or select 'More apps, then Notepad' and 'OK'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/7fbc8bac-a885-42ae-8402-55bea124a8a1)

e) Find resource "aws_key_pair" "validator" like in this image and paste in your Public Key copied from STEP 3.

![image](https://github.com/vitruveo-validators/aws/assets/157662422/1edf2c09-ac25-4a06-81bb-7d21c6ab5455)

f) It should look something like this and have quotes before and after Public Key

![image](https://github.com/vitruveo-validators/aws/assets/157662422/7b3860c1-aa8d-4c7a-849c-8a99353a51ff)

g) Save and close the main.tf file

![image](https://github.com/vitruveo-validators/aws/assets/157662422/46d49653-4c50-4662-a476-38c6033e9a30)


**8. Deploying your Validator to AWS**

a) Navigate back to the command line that should be running. Type **Terraform init** and hit enter - NOTE: This will take while

![image](https://github.com/vitruveo-validators/aws/assets/157662422/aacc6357-47ad-48aa-95ca-b6aa4eb12c5c)

b) Type **Terraform plan** and hit enter - make sure of 'Plan: 4 to add, 0 to change, 0 to destroy.'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/7e6312b7-e475-4b2c-8166-4be0e1f00e86)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/7c0d423f-8ade-4641-bc32-1c22533e2bba)

c) Type **Terraform apply -auto-approve** - make sure 'Apply complete! Resources: 4 added, 0 changed, 0 destroyed.'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/348cf3f6-1664-4713-8cd1-2f4925687d76)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/a1d2d696-a494-4b6f-8003-08b084380bef)

d) If you make a mistake then run **Terraform destroy** hit enter and then type **yes** enter

**9. Your Validator is deployed to AWS with the following configuration:**
   - Pre configured Security Group with all required ports
   - Elastic IP bound to Validator to always keep the same Public IP
   - Key Pair to securely SSH into your Validator when needed
   - EC2 Instance with 4GB RAM, 4 cores and an 80GB SSD

![image](https://github.com/vitruveo-validators/aws/assets/157662422/2f229182-3310-46db-855a-5bca8fbd443a)


**10. **Deactive the Access Key due to security reasons****

a) Navigate back to your AWS portal if opened or select this link https://console.aws.amazon.com/
   Search for IAM and then select 'Users' from the left side.

![image](https://github.com/vitruveo-validators/aws/assets/157662422/eed39c70-af13-4647-9af4-4761785a88e5)

b) Select 'Security credentials' 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/5ce1d616-b415-4d0e-b490-9bbd42589b1d)

c) Under 'Access keys' select the 'Actions' drop-down and select 'Deactive'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/6e6a2714-9ace-425f-b587-3723bc9796ce)

d) Last step is to click 'Deactive' 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/e4ca17ec-6918-4514-8669-ed734a441537)

**Next steps in the process is to connect to your newly deployed EC2 instance and install VTRU Validator code**



https://github.com/vitruveo-validators/aws/blob/main/Windows/vtru-setup






