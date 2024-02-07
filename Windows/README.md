
![image](https://github.com/vitruveo-validators/azure/assets/157662422/d5ddfd24-2b07-4b75-aba9-de7ecd5a4518)




**START HERE - prerequisites**

**STEP 1** First create your Azure account - [https://console.aws.amazon.com/](https://portal.azure.com/)

**STEP 2** Follow this document on a Windows 10 or Windows 11 with all updates installed and as a local Administrator 



**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**



**1. Run a command prompt as an Administrator (you need to be a local admin of your machine):**


![image](https://github.com/vitruveo-validators/aws/assets/157662422/b4131d26-9303-4072-a010-54b9ff717d83)



**2. Create a folder and download files:**

Type cd\ and hit **enter**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/051ce98d-f33f-45da-a978-724ef1cdcb3b)

Type **md azure** and hit **enter**

![image](https://github.com/vitruveo-validators/azure/assets/157662422/43a876df-34f8-4e7a-aad5-2003a6c34d93)

Type **cd azure** and hit **enter**

![image](https://github.com/vitruveo-validators/azure/assets/157662422/a08704d3-ab99-4b02-8e87-8508f74ee4d2)


**3. Download Terraform Code by clicking on the image 'Download ZIP'**

[![image](https://github.com/vitruveo-validators/azure/assets/157662422/0ef2634f-0d7d-4bd6-938e-8bd802a407b5)
](https://github.com/vitruveo-validators/azure/archive/refs/heads/main.zip)



**4. Download Azure CLI by clicking the following image**

[![image](https://github.com/vitruveo-validators/azure/assets/157662422/746c64ed-32a0-48e5-9bf6-c57bf6e8ed8b)
](https://aka.ms/installazurecliwindowsx64)


**5. On your PC, open File Explorer and navigate to your Downloads folder**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/ac780075-11e3-4022-8bbe-fc4c613da768)

  
a) Right click on azure-main.zip and select 'Extract All'


![image](https://github.com/vitruveo-validators/azure/assets/157662422/0cac875b-743c-4ca7-afa5-e65cd9075604)



b) Change the location of the extracted file by typing c:\azure\ and click 'Extract'

![image](https://github.com/vitruveo-validators/azure/assets/157662422/fbde6ead-3c88-48c6-a979-432a314b5f47)


c) Install Azure CLI by running the file 'azure-cli-2.57.0-x64.msi' and selecting all defaults


![image](https://github.com/vitruveo-validators/azure/assets/157662422/64a5235e-b66f-4c6c-8ce1-6e6069a1098c)


d) Navigate to the azure-main folder - c:\azure\azure-main - right click on the file 'terraform_1.7.2_windows_386.zip' and select 'Extract All'

![image](https://github.com/vitruveo-validators/azure/assets/157662422/031e197e-94bf-474b-b552-4eb0c6b6a5f2)



e) Type c:\azure\azure-main\ and then select 'Extract' **NOTE** - make sure its the same as this image.

![image](https://github.com/vitruveo-validators/azure/assets/157662422/68044d55-7a03-4bb4-b319-0ec12efe25ab)


**$\color{Red}Close\ ALL\ Windows\ and\ restart\ the\ Command\ Prompt\ as\ an\ Administrator\ like\ in\ Step\ 1.$**


**6. Authorizing against your Azure account**

a) Change to the Azure-main directory by typing ** cd c:\azure\azure-main** and hit enter

![image](https://github.com/vitruveo-validators/azure/assets/157662422/56d4ec46-346a-4045-9250-fa628c667fd5)



b) Authorize to your Azure account using email and password by typing **az login** and hitting enter

![image](https://github.com/vitruveo-validators/azure/assets/157662422/bc68e0df-b0b8-49d6-bb74-4692d0e326ce)

c) A web browser should open for you to enter your email account for Azure and password that was created in STEP 1



![image](https://github.com/vitruveo-validators/azure/assets/157662422/b60f3466-71cf-466a-b75c-0f7ec8fdd4dc)

d) Once successful, you should see this windows and it can be closed

![image](https://github.com/vitruveo-validators/azure/assets/157662422/cf3ff8bf-94c1-4d81-85b1-dbbaf21ad675)

e) Once successful move to step 7.


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






