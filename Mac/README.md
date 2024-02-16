![image](https://github.com/vitruveo-validators/azure/assets/157662422/4606795a-2489-4eda-9c5b-5ff2592f62b7)

**START HERE - prerequisites**

**STEP 1** First create your Azure account - https://portal.azure.com/

**STEP 2** Second, pick a Region (green dot) from this interactive site - https://datacenters.microsoft.com/globe/explore

**STEP 3** Third, pick a virtual machine size or use the suggestion in this guide - https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

**STEP 4** Follow this document on an updated Mac as a local Administrator 

**$\color{Red}Review\ each\ step\ carefully\ and\ check\ your\ steps\ vs.\ the\ images.\ Don't\ rush.\$**


**1. Download tools needed**

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

c) Open 'Finder' and navigate to the 'Downloads' directory


![Screenshot 2024-02-16 165108](https://github.com/vitruveo-validators/azure/assets/157662422/59b19c96-9f49-40f1-bf5b-d80025852971)

![image](https://github.com/vitruveo-validators/azure/assets/157662422/4256dc52-f566-4475-995d-f978fa20da66)



d) Install HomeBrew from the 'Downloads' folder

![image](https://github.com/vitruveo-validators/azure/assets/157662422/d5c56272-6b9b-49e3-974f-1126820fa241)



g) Install Azure CLI by typing command **brew update && brew install azure-cli**


     brew update && brew install azure-cli 

![image](https://github.com/vitruveo-validators/azure/assets/157662422/1a62cfd2-f2f1-4785-ad92-b837a70a44a8)

![image](https://github.com/vitruveo-validators/azure/assets/157662422/64de2fff-c458-44d4-b32f-95511edac70c)

h) Move Terraform file to /azure-main directory


     mv ./Downloads/terraform ./Downloads/azure-main/ 


![image](https://github.com/vitruveo-validators/azure/assets/157662422/f0422e3c-14ab-43e3-94f6-42f92706d655)



**4. Authorizing against your Azure account**


a) Type **cd Downloads/azure-main/** and hit enter

     cd Downloads/azure-main/ 


b) Authorize to your Azure account using email and password by typing **az login** and hitting enter

    az login

![image](https://github.com/vitruveo-validators/azure/assets/157662422/fa251ba8-4580-4cb5-ad40-f211d4d9e6ef)

c) A web browser should open for you to enter your email account for Azure and password that was created in STEP 1

![image](https://github.com/vitruveo-validators/azure/assets/157662422/dc195203-13ae-41cf-83fa-c1a4331e0d18)


d) Once successful, you should see this windows and it can be closed

![image](https://github.com/vitruveo-validators/azure/assets/157662422/855051ae-863e-4144-bbf3-567fce775521)


e) Once successful move to step 7.


**5. **VERY IMPORTANT STEP** - Take your time as it needs to be done correctly**

a) 


a)  Type **Terraform init** and hit enter - NOTE: This can take a while

    Terraform init

![image](https://github.com/vitruveo-validators/azure/assets/157662422/36ddbe69-0b85-434f-9924-a55330dc2276)

b) Copy and paste the following command

   NOTE: This command should list all the current Azure Regions around the world. Earlier you picked a region, now from this list copy your region in this format i.e. 
   Sweden Central = swedencentral NOT sweden. Brazil South = brazilsouth NOT brazil
    
    az account list-locations --query "sort_by([].{Location:name}, &Location)" -o table

![image](https://github.com/vitruveo-validators/azure/assets/157662422/2574efc1-a04c-4e9e-a54a-b3bf5644cdd8)

c) Type **Terraform plan** hit enter and add your predetermined region and hit enter again

    Terraform plan

![image](https://github.com/vitruveo-validators/azure/assets/157662422/02b8a4c2-f967-4ae6-8ba9-e8a79e5ebcaa)

d) Enter your Azure Virtual machine vm size here. i.e. **Standard_F4s_v2** then hit enter

    Standard_F4s_v2

![image](https://github.com/vitruveo-validators/azure/assets/157662422/93c03700-9414-42d9-85cc-ffc7ec6283c3)

![image](https://github.com/vitruveo-validators/azure/assets/157662422/4283a576-3477-420c-aa0e-e925706decd6)


**NOTE** if you receive and error about a Region not being supported like "canada" pick another region from the list like "canadacentral"

![image](https://github.com/vitruveo-validators/azure/assets/157662422/41c97517-cb79-4178-bf15-a76292f2b98d)



e) Confirm that Plan: 10 to add, 0 to change, 0 to destroy. is displayed

![image](https://github.com/vitruveo-validators/azure/assets/157662422/0c07213b-a8b4-4ccb-ae01-3e8435cb6a2b)

f) Copy **Terraform apply -auto-approve** and hit enter

    Terraform apply -auto-approve

![image](https://github.com/vitruveo-validators/azure/assets/157662422/6f75d613-1bcf-4920-af49-81714aa659c6)


g) Enter your Azure Virtual machine vm size here. i.e. **Standard_F4s_v2** then hit enter

    Standard_F4s_v2

![image](https://github.com/vitruveo-validators/azure/assets/157662422/68f628ba-b819-464c-be6d-01c5ae45274c)


f) Make sure 'Apply complete! Resources: 10 added, 0 changed, 0 destroyed.'


![image](https://github.com/vitruveo-validators/azure/assets/157662422/793256ba-6c4f-4cac-8896-9fd8e2e69107)




**6. Your Validator is deployed to Azure with the following configuration:**
   - Pre configured Network Security Group with all required ports
   - Static Public IP bound to Validator
   - Key Pair to securely SSH into your Validator when needed
   - Azure Ubuntu VM with 4GB RAM, 4 cores and an 80GB SSD
   - validator.pem file downloaded locally

![image](https://github.com/vitruveo-validators/azure/assets/157662422/ea822892-cb0e-46bb-9b08-6469e43b685d)




**Next steps in the process is to connect to your newly deployed EC2 instance and install VTRU Validator code**



https://github.com/vitruveo-validators/aws/tree/main/Mac/vtru-setup

