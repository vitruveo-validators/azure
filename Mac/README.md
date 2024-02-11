![image](https://github.com/vitruveo-validators/azure/assets/157662422/4606795a-2489-4eda-9c5b-5ff2592f62b7)

**START HERE - prerequisites**

**STEP 1** First create your Azure account - https://portal.azure.com/

**STEP 2** Second, pick a Region (green dot) from this interactive site - https://datacenters.microsoft.com/globe/explore

**STEP 3** Third, pick a virtual machine size or use the suggestion in this guide - https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

**STEP 4** Follow this document on an updated Mac as a local Administrator 

**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**


**1. Download needed tools**

d) Download Homebrew' by clicking this image

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/91cabd9e-45eb-4153-a000-53de5c9672ba)](https://github.com/Homebrew/brew/releases/download/4.2.6/Homebrew-4.2.6.pkg)


e) Download Terraform by clicking the following image

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/1a290c8d-944e-40cd-ac1c-78ffc34b9899)](https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_darwin_amd64.zip)

f) Next download Terraform code by clicking this imagine

[![image](https://github.com/vitruveo-validators/azure/assets/157662422/24e60a58-7e02-4759-92cb-7769dc922e24)
](https://github.com/vitruveo-validators/azure/archive/refs/heads/main.zip)



**2. Install packages**

a) Run 'Terminal' from LaunchPad and type **xcode-select --install** and hit enter

![image](https://github.com/vitruveo-validators/aws/assets/157662422/ff8c8e72-53c8-44db-a801-6c7a8e854d29)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/01627bed-41f2-45f0-afb1-f7a65de2cffa)


     xcode-select --install 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/4cfb2357-af5a-411c-b7ee-9d0e98688bf0)

b) Select 'Install' and run through all the defaults - **NOTE:** This can take a long time.

![image](https://github.com/vitruveo-validators/azure/assets/157662422/d21b0a5b-c9d3-4187-821a-5d9f73c82583)

c) Install Azure CLI by typing command **brew update && brew install azure-cli


     brew update && brew install azure-cli 

![image](https://github.com/vitruveo-validators/azure/assets/157662422/1a62cfd2-f2f1-4785-ad92-b837a70a44a8)



a) From 'Finder' navigate to the 'Downloads' folder which should look like this

![image](https://github.com/vitruveo-validators/aws/assets/157662422/b57daf84-f64f-44b3-86da-7ae221e3436e)

![image](https://github.com/vitruveo-validators/azure/assets/157662422/4256dc52-f566-4475-995d-f978fa20da66)






**2. Authorizing against your Azure account**

a) From LaunchPad open Terminal



b) Type **cd Downloads** and hit enter

     cd Downloads 




**3. VERY IMPORTANT STEP - Take your time as it needs to be done correctly**

a) Navigate to aws-main folder in the Downloads folder from Finder > click main.tf and select 'TextEdit'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/d22893d3-fef2-48ab-aff3-87dfb110d471)


b) Find resource "aws_key_pair" "validator" like in this image 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/b5f49c59-cde3-493b-8563-5e04932d8009)

c) Paste in your Public Key copied from STEP 3 **then save and close the main.tf file**

![image](https://github.com/vitruveo-validators/aws/assets/157662422/593bdbac-d851-433e-88a5-54361e68febb)

**4. Deploying your Validator to AWS**

a) Go back to 'Terminal' and type **echo $PATH** hit enter and it should show this same path as on the image below


    echo $PATH 


![image](https://github.com/vitruveo-validators/aws/assets/157662422/a2b4aa9e-62ef-4954-9624-4b47e071a2d9)


b) Now type or copy and paste **sudo mv ~/Downloads/terraform /usr/local/bin/** and hit enter, then enter your password

    sudo mv ~/Downloads/terraform /usr/local/bin/ 
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/ec44f734-84b0-40f1-a3ce-83a1fc111941)



c) Now change to the 'aws-main' directory by typing **cd aws-main** 

     cd aws-main
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/ed9f6d42-cc59-46d5-9500-5c293de498f1)



d) Type **Terraform init** and hit enter - NOTE: This might take a while

     Terraform init
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/ec4bc1eb-b187-44c2-89f1-aa71142770dd)

e) Type **Terraform plan** and hit enter making sure it shows 'Plan: 4 to add, 0 to change, 0 to destroy.' as in the following image

     Terraform plan
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/7ea302fb-1fa1-46b4-9cb8-1186b9197d65)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/c3547fe0-f0d3-47d8-a2cd-c095e11ab173)

f) Type **Terraform apply -auto-approve** - make sure 'Apply complete! Resources: 4 added, 0 changed, 0 destroyed.'

     Terraform apply -auto-approve
  
![image](https://github.com/vitruveo-validators/aws/assets/157662422/3011f4c8-1ba6-46b6-abf8-16d3743d1437)


![image](https://github.com/vitruveo-validators/aws/assets/157662422/e8a341f3-d95c-4cc6-8dea-5594e4e4d0c7)

g) **Close Terminal** 

**5. Your Validator is deployed to AWS with the following configuration:**
   - Pre configured Security Group with all required ports
   - Elastic IP bound to Validator to always keep the same Public IP
   - Key Pair to securely SSH into your Validator when needed
   - EC2 Instance with 4GB RAM, 4 cores and an 80GB SSD

![image](https://github.com/vitruveo-validators/aws/assets/157662422/f15f1106-951d-4a44-8152-cee94b2b8353)



**6. Deactive the Access Key due to security reasons**

a) Open IAM via the AWS Portal and select 'Users'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/eed39c70-af13-4647-9af4-4761785a88e5)

b) Select 'Security credentials' 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/5ce1d616-b415-4d0e-b490-9bbd42589b1d)

c) Under 'Access keys' select the 'Actions' drop-down and select 'Deactive'

![image](https://github.com/vitruveo-validators/aws/assets/157662422/6e6a2714-9ace-425f-b587-3723bc9796ce)

d) Last step is to click 'Deactive' 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/e4ca17ec-6918-4514-8669-ed734a441537)

**Next steps in the process is to connect to your newly deployed EC2 instance and install VTRU Validator code**



https://github.com/vitruveo-validators/aws/tree/main/Mac/vtru-setup

