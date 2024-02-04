![image](https://github.com/vitruveo-validators/azure/assets/157662422/78a51658-e769-4dca-9a1a-3002e7278163)


**START HERE - prerequisites**

**STEP 1** First create your AWS account - https://console.aws.amazon.com/

**STEP 2** Create an IAM Service Account in AWS - https://github.com/vitruveo-validators/aws/blob/main/iam-account 

**STEP 3** Create a Public key and a Private key - https://github.com/vitruveo-validators/aws/blob/main/Mac/key-pair 

**STEP 4** Follow this document on a Mac with all updates installed and as an Administrator

**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**



**1. Download Terraform Code by click on the image 'Download ZIP'**

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/1a6e18db-711d-4a62-8ce6-686cb3a3fea7)](https://github.com/vitruveo-validators/aws/archive/refs/heads/main.zip)



a) Download Terraform by clicking the following image

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/1a290c8d-944e-40cd-ac1c-78ffc34b9899)](https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_darwin_amd64.zip)


b) Download AWS CLI by clicking the following image (Mac OS 10.09 + versions supported)

[![image](https://github.com/vitruveo-validators/aws/assets/157662422/2d1bcbb5-e29b-459b-9289-90abd25e5086)](https://awscli.amazonaws.com/AWSCLIV2.pkg)

b) Run 'Finder' and navigate to the 'Downloads' folder which should look like this


![image](https://github.com/vitruveo-validators/aws/assets/157662422/e8d2d0c4-aadc-4bbd-8f60-c870fc600350)




c) Run AWSCLIV2.pkg and select 'Continue' selecting all the defaults

![image](https://github.com/vitruveo-validators/aws/assets/157662422/b00b551e-80d1-412f-bf29-6fa8e351c191)

**2. Authorizing against your AWS account**

a) From LaunchPad open Terminal

![image](https://github.com/vitruveo-validators/aws/assets/157662422/124cd1a5-df23-4a5e-a8f2-7dec918f222a)

![image](https://github.com/vitruveo-validators/aws/assets/157662422/7f99f329-abc2-418a-83ba-734de1df98ff)

b) Type **cd Downloads** and hit enter

     cd Downloads 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/2186dd91-1730-43f9-a777-77310a306682)

c) Authorize to your AWS account by typing **aws configure** and hitting enter, then adding your access key from STEP 2

     aws configure 

![image](https://github.com/vitruveo-validators/aws/assets/157662422/872bf478-c923-4ee2-b88e-f0ed53e7b370)

d) Add your secret access key from STEP 2

![image](https://github.com/vitruveo-validators/aws/assets/157662422/6ec07a44-56ff-4e60-b13b-1830290b2ac3)

e) Hit enter for the default options

![image](https://github.com/vitruveo-validators/aws/assets/157662422/6731e58e-b53b-4aea-aeee-1b37320439bb)


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
